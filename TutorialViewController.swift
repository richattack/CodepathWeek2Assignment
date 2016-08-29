//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Kelly II, Richard W. on 8/28/16.
//  Copyright © 2016 Kelly II, Richard W. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSizeMake(1280, 568)
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        pageControl.numberOfPages = 4
        buttonView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
        pageControl.hidden = false
        buttonView.alpha = 0
        
        if (page == 3) {
            buttonView.alpha = 1
            pageControl.hidden = true
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
