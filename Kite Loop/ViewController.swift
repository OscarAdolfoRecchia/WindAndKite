//
//  ViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/21/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import DrawerController

let sharedDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //set up drawer controller I think
        
//        appDelegate.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        
//

        
        
        //        var toDotList = storyBoard.instantiateViewControllerWithIdentifier("Feedvc") as! Feedvc
        //        var navConToDo = UINavigationController(rootViewController: toDotList)
        //
        //        var menu = storyBoard.instantiateViewControllerWithIdentifier("Menu") as! MenuViewController
        //
        //        var drawerCon = DrawerController(centerViewController: navConToDo, leftDrawerViewController: menu)
        //        drawerCon.openDrawerGestureModeMask = OpenDrawerGestureMode.BezelPanningCenterView
        //        drawerCon.closeDrawerGestureModeMask = CloseDrawerGestureMode.PanningCenterView
        //        self.window?.rootViewController = drawerCon
        //        self.window?.makeKeyAndVisible()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if(UserDefaults.standard.value(forKey: KEY_UID) != nil){
            print(UserDefaults.standard.value(forKey: KEY_UID))
            self.performSegue(withIdentifier: SEGUE_LOGGED_IN, sender: nil)
            
            //SET UP SIDE BAR MENU AND SHOW THE VIEW CONTROLLER
            //self.setUpAndShowViewController()
        }
        
        
    }
    
    
    @IBAction func fbBtnPressed(_ sender:UIButton!){
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email","public_profile"]) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError:NSError!) in
            if(facebookError != nil){
                print("Facebook login failed error error error \(facebookError)")
            }else{
                let accessToken = FBSDKAccessToken.current().tokenString
                print("facebook login gooood \(accessToken)")
               
                
                //get user info
                self.getFacebookUserInfo()
                
                

                
                DataService.ds.REF_BASE.auth(withOAuthProvider: "facebook", token: accessToken, withCompletionBlock: {error, authData in
                    
                    if(error != nil){
                        print("login failed")
                    }else{
                        print("yay logged in well and good")
                        
                        let user = ["provider": authData.provider!]
                        DataService.ds.createFireBaseUser(authData.uid, user: user)
                        
                        UserDefaults.standard.setValue(authData.uid, forKey: KEY_UID)
                       
                        
                        self.performSegue(withIdentifier: SEGUE_LOGGED_IN, sender: nil)
                        //set up drawer controller and set drawer as root
                        //SET UP SIDE BAR MENU AND SHOW THE VIEW CONTROLLER

                        //self.setUpAndShowViewController()
                    
                    }
                })
            }
        }
    }
    
    @IBAction func emailBtnPressed(_ sender:UIButton){
        if let email = emailField.text, email != "", let pw = passwordField.text, pw != ""{
            
            DataService.ds.REF_BASE.authUser(email, password: pw, withCompletionBlock:{
                error, authData in
                
                if error != nil {
                    print(error.code)
                    
                    if(error.code == STATUS_ACCOUNT_NONEXIST){
                        DataService.ds.REF_BASE.createUser(email, password: pw, withValueCompletionBlock: {
                            error, result in
                            
                            if(error != nil){
                                self.showErrorAlert("Could not create account", msg: "Bummer")
                            }else{
                                UserDefaults.standard.setValue(result?[KEY_UID], forKey: KEY_UID)
                                DataService.ds.REF_BASE.authUser(email, password: pw, withCompletionBlock:{
                                    error,authData in
                                    
                                    let user = ["provider": authData?.provider!]
                                    DataService.ds.createFireBaseUser(authData.uid, user: user)
                                })
                                self.performSegue(withIdentifier: SEGUE_LOGGED_IN, sender:nil)
                            }
                        })
                    }
                }
            })
                
            
            
        }else{
            showErrorAlert("Email and Password Error",msg: "Enter a valid email and password")
        }
    }
    
    

    
    func showErrorAlert(_ title:String,msg: String){
        let alert = UIAlertController(title:title, message: msg,preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default, handler:nil)
        
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
        
    }
    
    func setUpAndShowViewController(){
        //self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        //set up drawer controller and set drawer as root
        //SET UP SIDE BAR MENU AND SHOW THE VIEW CONTROLLER
        
        sharedDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let rootViewController = sharedDelegate.window?.rootViewController
        
        let centerViewController = storyBoard.instantiateViewController(withIdentifier: "SpotListViewController") as! SpotListViewController
        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        var leftSideNav = UINavigationController(rootViewController: menuViewController)
        var centerNav = UINavigationController(rootViewController: centerViewController)
        
        sharedDelegate.centerContainer = DrawerController(centerViewController: centerNav, leftDrawerViewController: leftSideNav)
        
  
//        centerContainer!.openDrawerGestureModeMask = DrawerController.
//        centerContainer?.closeDrawerGestureModeMask = DrawerController.PanningCenterView
//        
        sharedDelegate.window?.rootViewController = sharedDelegate.centerContainer
        sharedDelegate.window?.makeKeyAndVisible()
    }
    
    func getFacebookUserInfo(){
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).start { (connection, result, error) -> Void in
            let strFirstName: String = (result.object(forKey: "first_name") as? String)!
            let strLastName: String = (result.object(forKey: "last_name") as? String)!
            let strPictureURL: String = (result.object(forKey: "picture")?.object(forKey: "data")?.object(forKey: "url") as? String)!
            
            let user = ["firstName": strFirstName, "lastName": strLastName, "provider": "facebook", "picURL": strPictureURL]
            
            UserDefaults.standard.setValue(user, forKey: "user")
        }
    }

}

