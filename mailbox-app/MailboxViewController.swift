//
//  MailboxViewController.swift
//  mailbox-app
//
//  Created by Carlos Cheung on 5/18/15.
//  Copyright (c) 2015 carloscheung. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var mainMessageView: UIView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Background - Color Changer
    @IBOutlet weak var backgroundMessageView: UIView!
    
    
    // rightView ICONS
    @IBOutlet weak var rightDragView: UIView!
    @IBOutlet weak var iconArchiveView: UIImageView!
    @IBOutlet weak var iconDeleteView: UIImageView!
    
    
    //leftView ICONS
    @IBOutlet weak var leftDragView: UIView!
    @IBOutlet weak var iconLaterView: UIImageView!
    @IBOutlet weak var iconListView: UIImageView!

    
    //SELF CREATED GLOBAL VARIABLES
    var contentOriginalCenter: CGPoint!
    var contentLoadPosition: CGPoint!
    var messageOriginalCenter: CGPoint!
    var loadPosition: CGPoint!

    
// COLORS
    let blueColor = UIColor(red: 68/255, green: 170/255, blue: 210/255, alpha: 1)
    let yellowColor = UIColor(red: 254/255, green: 202/255, blue: 22/255, alpha: 1)
    let brownColor = UIColor(red: 206/255, green: 150/255, blue: 98/255, alpha: 1)
    let greenColor = UIColor(red: 85/255, green: 213/255, blue: 80/255, alpha: 1)
    let redColor = UIColor(red: 231/255, green: 61/255, blue: 14/255, alpha: 1)
    let grayColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
    
    
// VIEW DID LOAD

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSizeMake(320, 1350)
       
        contentLoadPosition = contentView.center
        loadPosition = mainMessageView.center
        rightDragView.alpha = 0
        leftDragView.alpha = 0
        
        
        var edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        contentView.addGestureRecognizer(edgeGesture)

        
        
    }
    
    
// SEGMENT CONTROL
    
    @IBAction func onSegmentControl(sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0 {
            
            // reschedule
            
        }
        else if segmentControl.selectedSegmentIndex == 1 {
            
            // IDK
            
        }
        else if segmentControl.selectedSegmentIndex == 2 {
            
            // archive
            
        }
        
    }
    
    
    
// TAP GESTURE - to close Reschedule & List Vie
    

    @IBAction func rescheduleTap(sender: UITapGestureRecognizer) {
        
        rescheduleView.hidden = true
        
    }
    
    @IBAction func listTap(sender: UITapGestureRecognizer) {
        
        listView.hidden = true
        
    }
    

    
// PAN EDGE GESTURE
    func onEdgePan(sender:UIScreenEdgePanGestureRecognizer){
        
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began{
            contentOriginalCenter = contentView.center
        }
        else if sender.state == UIGestureRecognizerState.Changed{
            contentView.center = CGPoint(x:contentOriginalCenter.x + translation.x, y: contentOriginalCenter.y)
            
            println("fire onEdgePan")
            
        }
        else if sender.state == UIGestureRecognizerState.Ended{
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// PANNING AFTER MENU
    
    @IBAction func secondPanMenu(sender: UIPanGestureRecognizer) {
        
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began{
            contentOriginalCenter = contentView.center
        }
        else if sender.state == UIGestureRecognizerState.Changed{
            contentView.center = CGPoint(x:contentOriginalCenter.x - translation.x, y: contentOriginalCenter.y)
            
            
        }
        else if sender.state == UIGestureRecognizerState.Ended{
            
            contentView.center = contentLoadPosition
            
        }
        
        
        
    }
    
// PAN Regular Gesture
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
//        println("Velocity = \(velocity)")
//        println("Center = \(mainMessageView.center)")
        
        if sender.state == UIGestureRecognizerState.Began{
            messageOriginalCenter = mainMessageView.center
        }
        else if sender.state == UIGestureRecognizerState.Changed{
            mainMessageView.center = CGPoint(x:messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if mainMessageView.frame.origin.x > 60 && mainMessageView.frame.origin.x < 260 {
                
                self.rightDragView.alpha = 1
                self.leftDragView.alpha = 0
                self.backgroundMessageView.backgroundColor = self.greenColor
                iconDeleteView.alpha = 0
                iconArchiveView.alpha = 1
                
            }
            else if mainMessageView.frame.origin.x > 260 {
                
                self.rightDragView.alpha = 1
                self.leftDragView.alpha = 0
                self.backgroundMessageView.backgroundColor = self.redColor
                iconArchiveView.alpha = 0
                iconDeleteView.alpha = 1
                
            }
            else if mainMessageView.frame.origin.x < -60 && mainMessageView.frame.origin.x > -260 {
                
                self.rightDragView.alpha = 0
                self.leftDragView.alpha = 1
                self.backgroundMessageView.backgroundColor = self.yellowColor
                iconListView.alpha = 0
                iconLaterView.alpha = 1
                
            }
            else if mainMessageView.frame.origin.x < -260 {
             
                self.rightDragView.alpha = 0
                self.leftDragView.alpha = 1
                self.backgroundMessageView.backgroundColor = self.brownColor
                iconLaterView.alpha = 0
                iconListView.alpha = 1
                
            }
            

            
            
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: {
                
                if self.backgroundMessageView.backgroundColor == self.greenColor {
                    
                    self.mainMessageView.frame.origin.x = 320
                    
                    delay(0.3, { () -> () in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedView.frame.origin.y = 142
                        })
                    })
                    
                    
                }
                else if self.backgroundMessageView.backgroundColor == self.redColor {
                    
                    self.mainMessageView.frame.origin.x = 320
                    
                    delay(0.3, { () -> () in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedView.frame.origin.y = 142
                        })
                    })

                    
                }
                else if self.backgroundMessageView.backgroundColor == self.yellowColor {
           
                    self.mainMessageView.frame.origin.x = -320
                    
                    delay(0.3, { () -> () in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedView.frame.origin.y = 142
                        })
                    })
                    
                    // RESCHEDULE OPTION
                    delay(0.5, { () -> () in
                        self.rescheduleView.hidden = false
                    })
                    
                    
                    
                }
                else if self.backgroundMessageView.backgroundColor == self.brownColor {
                    
                    self.mainMessageView.frame.origin.x = -320
                    
                    delay(0.3, { () -> () in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedView.frame.origin.y = 142
                        })
                    })
                    
                    // LIST OPTION
                    delay(0.5, { () -> () in
                        self.listView.hidden = false
                    })
                    
                    
                    
                }
                else {
                    
                    self.mainMessageView.center = self.loadPosition
                    
                }
                
            })
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
