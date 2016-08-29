//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Kelly II, Richard W. on 8/28/16.
//  Copyright © 2016 Kelly II, Richard W. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var fieldsParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonsParentView: UIView!
    var buttonOffset :CGFloat!
    var buttonInitialY :CGFloat!
    @IBAction func pushedBackButton(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func pushedAgreeButton(sender: UIButton) {
        sender.selected = !sender.selected
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 526)
        scrollView.contentInset.bottom = 100
        scrollView.delegate = self
        buttonOffset = -120
        buttonInitialY = buttonsParentView.frame.origin.y

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
        print("keyboardWillShow123")
        // Move the button up above keyboard
        buttonsParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("keyboardWillHide")
        // Move the button up above keyboard
        buttonsParentView.frame.origin.y = buttonInitialY
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
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
