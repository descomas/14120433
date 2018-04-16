//
//  ViewController.swift
//  14120433_MotionTrack
//
//  Created by Desiree Comas on 26/02/2018.
//  Copyright © 2018 Desiree Comas. All rights reserved.
//

import UIKit

protocol subviewDelegate{
    func collision()
}

class ViewController: UIViewController, subviewDelegate{
   
    
    
   // declaring Variables
    @IBOutlet weak var line: UIImageView!
    
    @IBOutlet weak var redRunner: UIImageView!
    
    @IBOutlet weak var mainRunner: DraggingObject!
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Animation of sun and balloon
        
        
            UIView.animate(withDuration: 6, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.line.center.y += self.view.bounds.height
            }, completion: nil
            )
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: [redRunner])
        
        //y: sets the time for the redrunner to come down
        
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 200), for: redRunner)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        mainRunner.myDelegate = self
   
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collision(){
        collisionBehavior = UICollisionBehavior(items:[redRunner])
        collisionBehavior.addBoundary(withIdentifier: "Main Runner" as NSCopying, for: UIBezierPath(rect:mainRunner.frame))
        dynamicAnimator.addBehavior(collisionBehavior)
    }
 

}


