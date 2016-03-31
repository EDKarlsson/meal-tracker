Connect the UI to Code
----

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

## Special comments
A special type of comment used to organized code and help others navigate through it more easily is:

    // MARK:

iOS apps are based on event-driven programming which means the flow of the app is determined by events: __system events__ and __user actions__.

An __action__ is ap iece of codet hat's linked to an event that can occur in your app.