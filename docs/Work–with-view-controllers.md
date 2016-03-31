Work with view controllers
-----

## View Controller Lifecycle
An object of the __UIViewController__ (and its subclasses) comes with a set of methods that manage its view hierarchy. These methods are called automatically when a view controller transitions between states.

__UIViewController__ methods get called as follows:

* `viewDidLoad()` : Intended for initial setup and called when the content view is created and loaded from a storyboard.

* `viewWillAppear()` : Inteded for operations that are to occur before a view becomes visible

* `viewDidAppear()` : Intended for operations that are to occur as soon as the view becomes visible.

> Other methods: viewDidDisappear, viewWillDisappear

The model-View-Controller pattern is an app design pattern where view controllers serve as the communication pipeline between the views and the data model.

Basically:

* Models - Track the apps data
* Views - Display the user interface and make up the content of an app
* Controllers - Manages the views

### Gesture Recognizer
Gesture recognizers are objects that you attch to a view that allow the view to respond to actions the way acontrol does.