//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Erik Karlsson on 3/31/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var meals = [Meal]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button tem provided by the table view controllei
        navigationItem.leftBarButtonItem = editButtonItem()
        // Load the sample data.
        loadSampleMeals()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")
        let meal2 = Meal(name: "Chicken and potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data sourre
    
    // This method tells the table view how many sections to display.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // This method tells the table view how many rows to display in a given section.
    //  Default is a single section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We want to have each meal in the application to have its own row in that section
        return meals.count
    }
    
    // This method peforms a few tasks:
    //  Asks the table view for a cell with a placeholder identifier, adds a comment about where code to configure the
    //  cell should go, and then returns the cell.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        
        // We down ast the type because we created a custom cell class
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        // Fetches the appropriate meal for teh data source layout
        let meal = meals[indexPath.row]
        
        // Assign each cell with the specific information about a given meal
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // This code ocmpares the segue identifiers against the identifier string assigned to them earlier
        if segue.identifier == "ShowDetail" {
            // This tries to downcast the destination view controller of the segue to a MealViewController using the forced type cast operator (as!) - The exclamation mark means it is forcing the downcast
            let mealDetailviewController = segue.destinationViewController as! MealViewController
            
            // Get the cell that genrated this segue
            if let selectedMealCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailviewController.meal = selectedMeal
            }
        } else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            meals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate clas, insert it into the array, and add a new row to the table view.
            
        }
    }
    
    // override to suport conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item editable.
        return true;
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        // This code is kind of crazy
        // This conditional statement uses the optional type cast operator(as?) to try to downcast the source
        //  the view controller of the segue to type MealViewController.
        //  It will check to see if the downcast is was successful and if it was then it will assign the sourceViewController
        //  meal to the new meal. If the new meal is not nil then it will execute the if statement.
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else
            {
                // Add a new meal
                // This will determine where in the table view the new meal will be placed.
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                
                // Adds the new meal to existing list of meals in the data model
                meals.append(meal)
                
                // This animates the addition of new row to the table view for the new meal
                //  .Bottom is an option of what type of animation, the row will slide in from the bottom.
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
}
