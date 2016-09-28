//
//  ViewController.swift
//  customButtonGame
//
//  Created by Flatiron School on 9/23/16.
//  Copyright © 2016 Shea Furey-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet to the score label in Interface Builder.
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Outlet to the object name label in Interface Builder.
    @IBOutlet weak var objectFoundLabel: UILabel!
    
    // Variables to record the current score. How many buttons have been tapped
    // and the maximum number of buttons available.
    var score: Int = 0
    var numberOfButtons: Int = 15
    var buttonCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Update the display
        self.updateDisplayWithObjectText(nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

