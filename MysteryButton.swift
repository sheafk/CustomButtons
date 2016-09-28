//
//  MysteryButton.swift
//  customButtonGame
//
//  Created by Flatiron School on 9/23/16.
//  Copyright © 2016 Shea Furey-King. All rights reserved.
//

import UIKit

enum ButtonSuprise: Int {
    case Square = 0, Star, Circle, Cake
    
    func basicDescription() -> String {
        // This function returns a basic description of the enumeration.
        switch self {
        case .Square:
            return "Square"
        case .Star:
            return "Star"
        case .Circle:
            return "Circle"
        case .Cake:
            return "Cake"
        }
    }
}



extension ButtonSuprise {
    static var caseCount: Int {
        var max: Int = 0
        while let _ = self.init(rawValue: max + 1) {}
        return max
    }
    
    static func randomSuprise() -> ButtonSuprise {
        let randomValue = Int(arc4random_uniform(UInt32(caseCount)))
        return self.init(rawValue: randomValue)!
    }
}

class MysteryButton: UIButton {

    // Holds the filename of the mystery image
    var imageName: String = ""
    
    // Each image is worth varying points. This variable stores that value.
    var value: Int = 0
    
    // This bool determines if the button has been tapped. A user can't tap the same button twice.
    var beenTapped: Bool = false
    
    // This optional stores the result of our random object generation.
    var suprise: ButtonSuprise? = nil
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // The resetMe function sets up the values for this button. It is
        // called here when the button first appears and is also called
        // from the main ViewController when all the buttons have been tapped
        // and the app is reset.
        self.resetMe()
    }
    
    func showImage() {
        self.setBackgroundImage(UIImage(named: self.imageName), for: UIControlState.normal)
        self.layer.borderWidth = 0.0
        self.beenTapped = true
    }
    
    func resetMe() {
        self.value = 0
        self.beenTapped = false
        self.suprise = ButtonSuprise.randomSuprise()
        self.backgroundColor = UIColor.clear
        self.setBackgroundImage(UIImage(named: "button"), for: UIControlState.normal)
        
        if let thisSuprise = suprise {
            switch thisSuprise {
                
            case .Square:
                self.value = 10
                self.imageName = "square"
                
            case .Star:
                self.value = 15
                self.imageName = "star"
                
            case .Circle:
                self.value = 20
                self.imageName = "circle"
                
            case .Cake:
                self.value = 50
                self.imageName = "cake"
                
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
