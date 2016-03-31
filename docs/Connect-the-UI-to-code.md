Connect the UI to Code
----
#### Special comments
A special type of comment used to organized code and help others navigate through it more easily is:

    // MARK:

This will 'Mark' that section of the code for the file's function menu.


### Connect the UI to Source code
Elements in a storyboard are linked to source code.
Within a storyboard:

* A __scene__ represents one screen of content and typically one view controller

* __View controllers__ implement the app's behavior, manages a single content view with its hierarchy of subviews and coordinates the flow information between the app's data model and the views that display that data.
* __Data Model__ Representation or structure of the data within an app.

All view controllers are of type _UIViewController_ or one of its subclasses.

By defining and implementing custom view controller subclasses the behavior of the view controllers is created.

## Outlets
Outlets provide away to reference interface objects in the source code. Interface objects are the objects added to the view in the storyboard.


iOS apps are based on event-driven programming which means the flow of the app is determined by events: __system events__ and __user actions__.

An __action__ is a piece of code that's linked to an event that can occur in your app.

## Specifying actions
When creating connections to elements in code by using ctrl + drag, the Type is required to be specified. The default is _AnyObject_ which is used to describe an object that can belong to any class. Specifying the type to be of _UIButton_ means that only button objects can connect to this action.

The _sender_ parameter points to the object that was responsible for triggering the action (such as a button). __IBAction__ attribute indicates that the method is an action that you can connext to from your storybaord in Interface Builder.

## iOS App Design
__Target-action__ is a design in which one object sends a message to another object when a specific event occurs.

## Process User Input
When working with user input, such as accepting input from a text field, you need help from a text field delegate.

__Delegate__ object is an object that acts on behalf of, or in coordination with, another object.

As long as an object conforms to the appropriate protocol, that object can serve as a delegate for another object.

__UITextFieldDelegate__ defines a text field's delegate.
This delegate only contains optional methods meaning they are not required to be implemented. However, to get the specific behavior these methods will need to be implemented.

    func textFieldShouldReturn(textField: UITextField) -> Bool
    func textFieldDidEndEditing(textField: UITextField)


### How text fields respond to user events.
When the user taps a text field, it automatically becomes first responder.
__First responder__ is anobject that is first on the line for receiving many kinds of app events, including key events, motion events and action messages.

