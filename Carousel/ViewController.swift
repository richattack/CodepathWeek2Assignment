//
//  ViewController.swift
//  Carousel
//
//  Created by Kelly II, Richard W. on 8/24/16.
//  Copyright © 2016 Kelly II, Richard W. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!

    // Arrays of initial transform values for tiles
    var xOffsets : [CGFloat] = [-40, 55, 36, 95, -120, -65]
    var yOffsets : [CGFloat] = [-285, -260, -445, -428, -530, -530]
    var scales : [CGFloat] = [1.1, 1.7, 1.6, 1.8, 1.9, 1.7]
    var rotations : [CGFloat] = [-20, -18, 15, 15, 15, -15]
    
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImage.image!.size
        introScrollView.delegate = self
        introScrollView.sendSubviewToBack(introImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        let offset = CGFloat(scrollView.contentOffset.y)
        
        print(offset)
        
        let image1Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        let image1Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        let image1Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        let image1Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        
        image1.transform = CGAffineTransformMakeTranslation(
            CGFloat(image1Tx),
            CGFloat(image1Ty)
        )
        
        image1.transform = CGAffineTransformRotate(image1.transform, CGFloat(Double(image1Rotate) * M_PI / 180))
        image1.transform = CGAffineTransformScale(image1.transform, CGFloat(image1Scale), CGFloat(image1Scale))

        
        let image2Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        let image2Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        let image2Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        let image2Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        
        image2.transform = CGAffineTransformMakeTranslation(
            CGFloat(image2Tx),
            CGFloat(image2Ty)
        )
        
        image2.transform = CGAffineTransformScale(image2.transform, CGFloat(image2Scale), CGFloat(image2Scale))
        image2.transform = CGAffineTransformRotate(image2.transform, CGFloat(Double(image2Rotate) * M_PI / 180))

        
        let image3Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        let image3Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        let image3Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        let image3Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        
        image3.transform = CGAffineTransformMakeTranslation(
            CGFloat(image3Tx),
            CGFloat(image3Ty)
        )
        
        image3.transform = CGAffineTransformScale(image3.transform, CGFloat(image3Scale), CGFloat(image3Scale))
        image3.transform = CGAffineTransformRotate(image3.transform, CGFloat(Double(image3Rotate) * M_PI / 180))

        
        let image4Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        let image4Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        let image4Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        let image4Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        
        image4.transform = CGAffineTransformMakeTranslation(
            CGFloat(image4Tx),
            CGFloat(image4Ty)
        )
        
        image4.transform = CGAffineTransformScale(image4.transform, CGFloat(image4Scale), CGFloat(image4Scale))
        image4.transform = CGAffineTransformRotate(image4.transform, CGFloat(Double(image4Rotate) * M_PI / 180))

        
        let image5Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        let image5Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        let image5Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        let image5Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        
        image5.transform = CGAffineTransformMakeTranslation(
            CGFloat(image5Tx),
            CGFloat(image5Ty)
        )
        
        image5.transform = CGAffineTransformScale(image5.transform, CGFloat(image5Scale), CGFloat(image5Scale))
        image5.transform = CGAffineTransformRotate(image5.transform, CGFloat(Double(image5Rotate) * M_PI / 180))
        

        let image6Tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        let image6Ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        let image6Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        let image6Rotate = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        
        image6.transform = CGAffineTransformMakeTranslation(
            CGFloat(image6Tx),
            CGFloat(image6Ty)
        )
        
        image6.transform = CGAffineTransformScale(image6.transform, CGFloat(image6Scale), CGFloat(image6Scale))
        image6.transform = CGAffineTransformRotate(image6.transform, CGFloat(Double(image6Rotate) * M_PI / 180))

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
}

