Implement a Custom Control
------

Typically a view is created in one of two ways:

1. Initializing the view with aframe so that it can be manually added in the view to the UI.
2. Allow the view to be loaded by the storyboard.

There are corresponding initializers for each approach, _init(frame:)_ for the frame and _init?(coder:)_ for the storyboard.

> Recall that an initializer is a method that prepares an instance of a class for use.


A UIView subclass that implements an initializer must include an implementation of _init?(coder:)_

To display a custom view it needs to be added to the UI and a connection between the view and the code must be established.

> Recall identity inspect lets you edit properties of an object in the storyboard related to that object's identity, such as what class the object belongs to.


