//
//  LoginVC.swift
//  ChatAppSwift
//
//  Created by Imee Cuison on 6/15/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signupBtn: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        welcomeLabel.center = CGPointMake(theWidth/2, 130)
        usernameTxt.frame = CGRectMake(16, 200, theWidth - 32, 30)
        passwordTxt.frame = CGRectMake(16, 240, theWidth - 32, 30)
        loginBtn.center = CGPointMake(theWidth/2, 330)
        signupBtn.center = CGPointMake(theWidth/2, theHeight - 30)
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }

    
    
    
    @IBAction func loginBtn_click(sender: AnyObject) {
        
        

    
        PFUser.logInWithUsernameInBackground(usernameTxt.text, password: passwordTxt.text){
            (user:PFUser?, error:NSError?) -> Void in
            
            
            if (error != nil)
            {
                println("can't login")
            }else {
                println("you are logged in")
                
                var installation:PFInstallation = PFInstallation.currentInstallation()
                installation["user"] = PFUser.currentUser()
                installation.saveInBackgroundWithBlock({
                    (success:Bool, error:NSError?) -> Void in
                })
                
                
                self.performSegueWithIdentifier("goToUsersVC", sender: self)
            }
        
            }
    }    
}

