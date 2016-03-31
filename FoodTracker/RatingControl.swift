//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Erik Karlsson on 3/31/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        button.backgroundColor = UIColor.redColor()
        
        // This is creating the connection to the interface except instead of 
        //  using CTRL + Drag this is creating the connection within the code.
        // Target is set to self since this is where the action is defined
        //  It means that the button will select the function ratingButtonTapped
        //  and execute this action every time the control events recognizes the 
        //  action .TouchDown
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)

        // This adds the button to the RatingControl View
        addSubview(button)
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed :thumbup:")
    }
    
    
    
}
