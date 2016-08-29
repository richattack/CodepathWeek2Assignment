//
//  LoginViewController.swift
//  Carousel
//
//  Created by Kelly II, Richard W. on 8/24/16.
//  Copyright © 2016 Kelly II, Richard W. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var fieldsParentView: UIView!
    @IBOutlet weak var buttonsParentView: UIView!
    @IBOutlet weak var loginLoadingIndicator: UIActivityIndicatorView!
    var buttonInitialY: CGFloat!
    @IBAction func loginBackButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    var buttonOffset: CGFloat!
    @IBAction func pressLoginButton(sender: AnyObject) {
        if (self.emailTextfield.text!.isEmpty) {
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in print("empty email")}
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if (self.passwordTextfield.text!.isEmpty) {
            let alertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in print("empty pw")}
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            self.loginLoadingIndicator.startAnimating()
            delay(2) {
                if (self.emailTextfield.text! == "rich" && self.passwordTextfield.text! == "ftw") {
                    self.loginLoadingIndicator.stopAnimating()
                    self.performSegueWithIdentifier("loginCompletedSegue", sender: nil)
                } else {
                    self.loginLoadingIndicator.stopAnimating()
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email and Password", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in print("wrong pw")}
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        fieldsParentView.transform = transform
        fieldsParentView.alpha = 0
        buttonsParentView.transform = transform
        buttonsParentView.alpha = 0
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.fieldsParentView.transform = CGAffineTransformIdentity
            self.fieldsParentView.alpha = 1
            self.buttonsParentView.transform = CGAffineTransformIdentity
            self.buttonsParentView.alpha = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonsParentView.frame.origin.y
        buttonOffset = -120
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)
        print(offset)
        if scrollView.contentOffset.y < -50 {
            view.endEditing(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonsParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("keyboardWillHide")
        // Move the button up above keyboard
        buttonsParentView.frame.origin.y = buttonInitialY
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
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
