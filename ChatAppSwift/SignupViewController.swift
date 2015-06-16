//
//  SignupViewController.swift
//  ChatAppSwift
//
//  Created by Imee Cuison on 6/15/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var addImgBtn: UIButton!
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var profileNameTxt: UITextField!

    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        profileImg.center = CGPointMake(theWidth/2, 160)
        
        /*  MAKES PROFILE PICTURE ROUND -- remove for now
        //not sure if i want this
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        */
        
        addImgBtn.center = CGPointMake(self.profileImg.frame.maxX+50, 140)
        usernameTxt.frame = CGRectMake(16, 250, theWidth - 32, 30)
        passwordTxt.frame = CGRectMake(16, 300, theWidth - 32, 30)
        profileNameTxt.frame = CGRectMake(16, 350, theWidth - 32, 30)
        signupBtn.center = CGPointMake(theWidth/2, 400)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addImgBtn_click(sender: AnyObject) {
    
    // POSSIBLY AMEND THIS TO AVATARS FOR KIDS
    var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        profileImg.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        usernameTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        profileNameTxt.resignFirstResponder()
        return true
        
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        if (UIScreen.mainScreen().bounds.height == 560) {
            
            if (textField == self.profileNameTxt) {
                
                UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations:{
            
                self.view.center = CGPointMake(theWidth/2, (theHeight/2) - 40)
            
               
                    } , completion: {
                        (finished:Bool) in
                
                })
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
