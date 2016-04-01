//
//  Meal.swift
//  FoodTracker
//
//  Created by Erik Karlsson on 3/31/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    // Have to add the ? to mark the init keyword as failable
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
