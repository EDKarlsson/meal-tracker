//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Erik Karlsson on 3/30/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit
import XCTest

class FoodTrackerTest: XCTestCase {
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the meal initializer returns when no name or a negative function
    func testMealInitialization() {
        
        // success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Neative ratings are invalid, be positive")
        
    }
    
}