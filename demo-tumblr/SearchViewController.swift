//
//  SearchViewController.swift
//  demo-tumblr
//
//  Created by Josh Bisch on 5/26/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {

    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var searchFeedImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = searchFeedImage.image!.size
        
        loadingImage.animationImages = [UIImage]()
        
        for var index = 1; index < 4; index++ {
            var frameName = String(format: "loading-%01d", index)
            loadingImage.animationImages?.append(UIImage(named: frameName)!)
        }
        
        loadingImage.animationDuration = 1
        loadingImage.startAnimating()
        
        UIView.animateWithDuration(0.3, delay: 1.2, options: nil, animations: { () -> Void in
            self.searchFeedImage.alpha = 1
        }) { (finished) -> Void in
            //loadingImage.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
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
