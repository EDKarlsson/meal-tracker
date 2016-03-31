# Build a Basic UI

App Delegate Source File
-----

### Preface and Terminology

* Creates the entry point to the app
* Runs a loop that devliers input events to the app
    * work is done by UIApplicationMain attribute

__UIApplicationMain__ simply put is responsible for creating the objects that manages the life cycle of the app. Two of the objects it creates is application object and the app delegate object;

__Application Object__: Responsible for managing the life cycle of the app, communication with its delegates during state transitions.

__App Delegate__ (Object) : It is what will create the window in which the app's content will be displayed.


## A View Controller Source File
Typically defines a custom subclass of _UIViewController_, a view controller source file will simply inherit everything for the _UIViewController_ and it can either extend that behavior or override it.

## Storyboards
__Storyboard__ is a visual representation of the app's user interface.
Shows screen content and how they transition

## UIs
Elements that appear in the UI are known as views and these views display content to the user.

All view objects in iOS are of type __UIView__ or one of its subclasses.