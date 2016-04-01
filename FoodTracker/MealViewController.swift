//
//  ViewController.swift
//  FoodTracker
//
//  Created by Erik Karlsson on 3/30/16.
//  Copyright © 2016 Dan Karlsson. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var ratingController: RatingControl!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    /*
     This value is either passed by 'MealTableViewController` `prepareForSegue(_:sender:)`
     or constructed as part of addding a new meal.
    */
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Handle the text fields user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard - Closes the text input field
        textField.resignFirstResponder()
        
        return true
    }
   
    // This method allows us to read the information for the text field once the user has finished entering in information
    // It is called after text field resigns its first responder status
    func textFieldDidEndEditing(textField: UITextField) {
        // TODO: Will be implemented soon
    }
    

    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker controller if the user canceled 
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // This function gets called when the user selects an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary contains multiple representations of the image and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set the photImageView to display the selected image
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingController.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets users pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Allow photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
}

