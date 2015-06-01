//
//  ComposeViewController.swift
//  demo-tumblr
//
//  Created by Josh Bisch on 5/26/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
        //println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            self.textBtn.frame.origin.y = 586
            self.photoBtn.frame.origin.y = 586
            self.quoteBtn.frame.origin.y = 586
            self.linkBtn.frame.origin.y = 586
            self.chatBtn.frame.origin.y = 568
            self.videoBtn.frame.origin.y = 586
            
            self.textBtn.alpha = 0
            self.photoBtn.alpha = 0
            self.quoteBtn.alpha = 0
            self.linkBtn.alpha = 0
            self.chatBtn.alpha = 0
            self.videoBtn.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    self.revealButtons()
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    @IBAction func didTapNevermindBtn(sender: AnyObject) {
        self.removeButtons()
        delay(0.45) {
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
            })
        }
        
    }
    
    func revealButtons(){
        UIView.animateWithDuration(0.35, delay: 0, usingSpringWithDamping: CGFloat(0.75), initialSpringVelocity: CGFloat(1.2), options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.photoBtn.frame.origin.y = 144
            self.photoBtn.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.1, usingSpringWithDamping: CGFloat(0.75), initialSpringVelocity: CGFloat(1.2), options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.textBtn.frame.origin.y = 144
            self.chatBtn.frame.origin.y = 144
            self.textBtn.alpha = 1
            self.chatBtn.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.1, usingSpringWithDamping: CGFloat(0.75), initialSpringVelocity: CGFloat(1.2), options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.videoBtn.frame.origin.y = 267
            self.videoBtn.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.2, usingSpringWithDamping: CGFloat(0.75), initialSpringVelocity: CGFloat(1.2), options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.linkBtn.frame.origin.y = 267
            self.quoteBtn.frame.origin.y = 267
            self.quoteBtn.alpha = 1
            self.linkBtn.alpha = 1
            }, completion: nil)
    }
    
    func removeButtons(){
        UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.linkBtn.frame.origin.y = 568
            self.quoteBtn.frame.origin.y = 568
            self.quoteBtn.alpha = 0
            self.linkBtn.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.23, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.videoBtn.frame.origin.y = 568
            self.videoBtn.alpha = 0
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.23, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.textBtn.frame.origin.y = 568
            self.chatBtn.frame.origin.y = 568
            self.textBtn.alpha = 0
            self.chatBtn.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.23, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.photoBtn.frame.origin.y = 568
            self.photoBtn.alpha = 0
            }, completion: nil)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
