//
//  ViewController.swift
//  Desiree_14120433
//
//  Created by Desiree Comas on 19/04/2018.
//  Copyright © 2018 Desiree Comas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lineView: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
    var appTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var runningTrack = UIImageView (image: UIImage(named:"running track"))
        runningTrack.frame = UIScreen.main.bounds
        self.view.addSubview(runningTrack)
        
        UIView.animate(withDuration: 6, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.lineView.center.y += self.view.bounds.height
        }, completion: nil
        )
        
        self.view.bringSubview(toFront: lineView)
        self.view.bringSubview(toFront: player)
        
        appTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.createRandomRunners), userInfo: nil, repeats: true)
        let timer = DispatchTime.now() + 20
        DispatchQueue.main.asyncAfter(deadline: timer){
           
            
        }
        // let Timer = DispatchTime.now()+20
     
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func createRandomRunners(){
        let runnerColour = arc4random_uniform(7)
        let randomRunner = UIImageView(image:nil)
        
        switch runnerColour{
        case 1: randomRunner.image = UIImage(named:"greenRunner.png")
        case 2: randomRunner.image = UIImage(named:"greyRunner.png")
        case 3: randomRunner.image = UIImage(named:"whiteRunner.png")
        case 4: randomRunner.image = UIImage(named:"yellowRunner.png")
            
            
        default: randomRunner.image = UIImage(named: "redRunner.png")
        }
        let xpos = arc4random_uniform(400)
        randomRunner.frame = CGRect(x: Int(xpos), y: 0, width: 30, height: 70)
        view.addSubview(randomRunner)
        view.bringSubview(toFront: randomRunner)
        

}


}
