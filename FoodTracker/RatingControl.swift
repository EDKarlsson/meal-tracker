//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Erik Karlsson on 3/31/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0
    
    // An array of rating buttons
    var ratingButtons = [UIButton]()
    
    let spacing = 5
    let starCount = 5
    
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // the '_' represents a wildcard which is used when it is not needed to know what iteration of the loop
        //  is occuring.
        //  when writing the for loop the 0.. does not include an upper bound since it is limited to be less than 5
        //  This iteration means that it will loop for a total of five times.
        for _ in 0..<starCount {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.backgroundColor = UIColor.redColor()
            
            // This is creating the connection to the interface except instead of
            //  using CTRL + Drag this is creating the connection within the code.
            // Target is set to self since this is where the action is defined
            //  It means that the button will select the function ratingButtonTapped
            //  and execute this action every time the control events recognizes the
            //  action .TouchDown
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            
            // This adds the button to the RatingControl View
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button spacing
        //  Enumerate returns a collection that contains elements in the ratingButtons array paired with their indexes
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        // Set the button's width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed :thumbup:")
    }
    
}
