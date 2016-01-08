//
//  HeroDetailViewController.swift
//  S.H.I.E.L.D. Hero Tracker
//
//  Created by Chris Stomp on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{

    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    private var originalBounds = CGRect.zero
    private var originalCenter = CGPoint.zero
    
    private var animator: UIDynamicAnimator!
    private var attachmentBehavior: UIAttachmentBehavior!
    private var pushBehavior: UIPushBehavior!
    private var itemBehavior: UIDynamicItemBehavior!
    
    let ThrowingThreshold: CGFloat = 1000
    let ThrowingVelocityPadding: CGFloat = 35
    
    var autoresizesSubviews: Bool!
    

    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        originalBounds = heroImage.bounds
        originalCenter = heroImage.center
        print(heroImage.bounds)
        print(heroImage.center)
        
        nameLabel.text = "Name: \(hero!.name)"
        homeworldLabel.text = "Homeworld: \(hero!.homeworld)"
        powersLabel.text = hero!.powers
        heroImage.image = UIImage(named: hero!.image)
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleAttachmentGesture(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(self.view)
        let boxLocation = sender.locationInView(self.heroImage)
        
        switch sender.state {
        case .Began:
            print("Your touch start position is \(location)")
            print("Start location in image is \(boxLocation)")
            // 1
            animator.removeAllBehaviors()
            
            // 2
            let centerOffset = UIOffset(horizontal: boxLocation.x - heroImage.bounds.midX,
                vertical: boxLocation.y - heroImage.bounds.midY)
            attachmentBehavior = UIAttachmentBehavior(item: heroImage,
                offsetFromCenter: centerOffset, attachedToAnchor: location)
            
            // 3
           // redSquare.center = attachmentBehavior.anchorPoint
           // blueSquare.center = location
            
            // 4
            animator.addBehavior(attachmentBehavior)
            
        case .Ended:
            print("Your touch end position is \(location)")
            print("End location in image is \(boxLocation)")
            animator.removeAllBehaviors()
            
            // 1
            let velocity = sender.velocityInView(view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            
            if magnitude > ThrowingThreshold {
                // 2
                let pushBehavior = UIPushBehavior(items: [heroImage], mode: .Instantaneous)
                pushBehavior.pushDirection = CGVector(dx: velocity.x / 10, dy: velocity.y / 10)
                pushBehavior.magnitude = magnitude / ThrowingVelocityPadding
                
                self.pushBehavior = pushBehavior
                animator.addBehavior(pushBehavior)
                
                // 3
                let angle = Int(arc4random_uniform(20)) - 10
                
                itemBehavior = UIDynamicItemBehavior(items: [heroImage])
                itemBehavior.friction = 0.2
                itemBehavior.allowsRotation = true
                itemBehavior.addAngularVelocity(CGFloat(angle), forItem: heroImage)
                animator.addBehavior(itemBehavior)
                
                // 4
                let timeOffset = Int64(0.4 * Double(NSEC_PER_SEC))
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, timeOffset), dispatch_get_main_queue()) {
                    self.resetDemo()
                }
            } else {
                resetDemo()
            }
            
        default:
            attachmentBehavior.anchorPoint = sender.locationInView(view)
            //redSquare.center = attachmentBehavior.anchorPoint
        }
    }
    
    func resetDemo() {
        animator.removeAllBehaviors()
        
        UIView.animateWithDuration(2.5) {
            self.heroImage.bounds = self.originalBounds
            self.heroImage.center = CGPoint(x: 160, y: 430)//self.originalCenter
            print(self.heroImage.bounds)
            print(self.heroImage.center)
            self.heroImage.transform = CGAffineTransformIdentity
            self.autoresizesSubviews = false
        }
    }
    

}
