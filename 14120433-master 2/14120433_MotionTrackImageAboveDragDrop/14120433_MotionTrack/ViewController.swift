//
//  ViewController.swift
//  14120433_MotionTrack
//
//  Created by Desiree Comas on 26/02/2018.
//  Copyright © 2018 Desiree Comas. All rights reserved.
//

import UIKit

/*protocol subviewDelegate{
func collision(){
    collisionBehavior = UICollisionBehavior(items:[carView])
    collisionBehavior.addBoundary(withIdentifier: "Main Runner" as NSCopying, for: UIBezierPath(rect:mainRunner.frame))
    dynamicAnimator.addBehavior(collisionBehavior)
    
}*/

class ViewController: UIViewController/*, subviewDelegate*/{
   
    
    
   // declaring Variables
    @IBOutlet weak var line: UIImageView!
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
     
        
        /*
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: [redRunner])
        
        //y: sets the time for the redrunner to come down
        
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 150), for: redRunner)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        mainRunner.myDelegate = self
   */
        let carArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        //[Then set up a loop to generate random cars]
        
        for index in 0...5 {
            
            let delay = Double(carArray[index])
            
            let when = DispatchTime.now() + delay
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                let carPic = arc4random_uniform(5)
                
                let carView = UIImageView(image: nil)
                
                switch carPic {
                    
                case 1: carView.image = UIImage(named: "greenRunner.png")
                case 2: carView.image = UIImage(named: "greyRunner.png")
                case 3: carView.image = UIImage(named: "whiteRunner.png")
                case 4: carView.image = UIImage(named: "yellowRunner.png")
                    
                default: carView.image = UIImage(named: "redRunner2.png")
                    
                }
                let randomXPosition = arc4random_uniform(300)
                carView.frame = CGRect(x: Int(randomXPosition), y: 0, width:30, height: 50)
                
                //[YOU WOULD WANT TO SET THE POSITION OF YOUR ENEMY CAR HERE. HINT: Maybe generate some sort of random position for x])
                
                self.view.addSubview(carView)
                
                self.view.bringSubview(toFront: carView)
                
                /*
                 
                 self.dynamicItemBehavior.addItem(carView)
                 self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 300), for: carView)
                 self.collisionBehavior.addItem(carView)
                 */
                
                //dynamicAnimator = UIDynamicItemBehavior(items: self.view)
                
                
                self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                self.dynamicItemBehavior = UIDynamicItemBehavior(items : [carView])
               
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 670), for: carView)
                
                //self.collisionBehavior.addItem(carView)
                self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                //self.dynamicAnimator.addBehavior(self.gravityBehaviour)
                
                //self.collision()
                //[You might also want to calculate a score here in some way later on]
                
            } //[End of Loop]
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


