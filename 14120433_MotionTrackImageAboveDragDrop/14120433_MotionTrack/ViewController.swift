//
//  ViewController.swift
//  14120433_MotionTrack
//
//  Created by Desiree Comas on 26/02/2018.
//  Copyright © 2018 Desiree Comas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
   
    @IBOutlet weak var line: UIImageView!
    
    @IBOutlet weak var redRunner: UIImageView!
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    
    
    
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
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 300), for: redRunner)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
    }
 
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


