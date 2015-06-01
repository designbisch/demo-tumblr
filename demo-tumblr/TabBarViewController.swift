//
//  TabBarViewController.swift
//  demo-tumblr
//
//  Created by Josh Bisch on 5/26/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var homeBtnPressed = false
    var searchBtnPressed = false
    var composeBtnPressed = false
    var accountBtnPressed = false
    var trendingBtnPressed = false
    //var selectedButton: Bool!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var composeBtn: UIButton!
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var trendingBtn: UIButton!
    @IBOutlet weak var exploreBubbleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController
        
        //Load Home
        activeViewController = homeViewController
        homeBtn.selected = true
        
        UIView.animateWithDuration(1, delay:0, options: .Repeat | .Autoreverse, animations: {
            self.exploreBubbleImage.center.y += 8
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMoveToParentViewController(nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = contentView.bounds
            contentView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMoveToParentViewController(self)
        }
    }
    
    @IBAction func didTapTabBarBtn(sender: UIButton) {
        
        if homeBtn.touchInside {
            activeViewController = homeViewController
            homeBtn.selected = true
            searchBtn.selected = false
            accountBtn.selected = false
            trendingBtn.selected = false
        } else if searchBtn.touchInside {
            activeViewController = searchViewController
            //self.exploreBubbleImage.alpha = 0
            homeBtn.selected = false
            searchBtn.selected = true
            accountBtn.selected = false
            trendingBtn.selected = false
        } else if composeBtn.touchInside {
            //activeViewController = composeViewController
        } else if accountBtn.touchInside {
            activeViewController = accountViewController
            homeBtn.selected = false
            searchBtn.selected = false
            accountBtn.selected = true
            trendingBtn.selected = false
        } else if trendingBtn.touchInside {
            activeViewController = trendingViewController
            homeBtn.selected = false
            searchBtn.selected = false
            accountBtn.selected = false
            trendingBtn.selected = true
        }
        
    }
    
    @IBAction func didPanContentView(sender: UIPanGestureRecognizer) {
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            if activeViewController == searchViewController {
                self.exploreBubbleImage.alpha = 0
            }
        }
    }

    @IBAction func didTapContentView(sender: AnyObject) {
        if activeViewController == searchViewController {
            self.exploreBubbleImage.alpha = 0
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
