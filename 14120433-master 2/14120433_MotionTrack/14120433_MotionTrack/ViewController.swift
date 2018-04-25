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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Animation of sun and balloon
        UIView.animate(withDuration: 5, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                
                self.line.center.y += self.view.bounds.height
                
        }, completion: nil
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

