


# ArcPainter class






    *[<Null safety>](https://dart.dev/null-safety)*





**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [Listenable](https://api.flutter.dev/flutter/foundation/Listenable-class.html)
- [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html)
- ArcPainter






## Constructors

[ArcPainter](../components_arc/ArcPainter/ArcPainter.md) ([Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? color, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) width, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) height)

    


## Properties

##### [color](../components_arc/ArcPainter/color.md) &#8594; [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)?



   
_final_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)  
_read-only, inherited_



##### [height](../components_arc/ArcPainter/height.md) &#8594; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_final_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_



##### [semanticsBuilder](https://api.flutter.dev/flutter/rendering/CustomPainter/semanticsBuilder.html) &#8594; [SemanticsBuilderCallback](https://api.flutter.dev/flutter/rendering/SemanticsBuilderCallback.html)?



Returns a function that builds semantic information for the picture drawn
by this painter. [...](https://api.flutter.dev/flutter/rendering/CustomPainter/semanticsBuilder.html)  
_read-only, inherited_



##### [width](../components_arc/ArcPainter/width.md) &#8594; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_final_




## Methods

##### [addListener](https://api.flutter.dev/flutter/rendering/CustomPainter/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be notified when it is time to repaint. [...](https://api.flutter.dev/flutter/rendering/CustomPainter/addListener.html)  
_inherited_



##### [hitTest](https://api.flutter.dev/flutter/rendering/CustomPainter/hitTest.html)([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) position) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?



Called whenever a hit test is being performed on an object that is using
this custom paint delegate. [...](https://api.flutter.dev/flutter/rendering/CustomPainter/hitTest.html)  
_inherited_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [paint](../components_arc/ArcPainter/paint.md)([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size) void



Called whenever the object needs to paint. The given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a> has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the <code>size</code> argument. [...](../components_arc/ArcPainter/paint.md)  
_override_



##### [removeListener](https://api.flutter.dev/flutter/rendering/CustomPainter/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that the
object notifies when it is time to repaint. [...](https://api.flutter.dev/flutter/rendering/CustomPainter/removeListener.html)  
_inherited_



##### [shouldRebuildSemantics](https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRebuildSemantics.html)(covariant [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html) oldDelegate) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Called whenever a new instance of the custom painter delegate class is
provided to the <a href="https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html">RenderCustomPaint</a> object, or any time that a new
<a href="https://api.flutter.dev/flutter/widgets/CustomPaint-class.html">CustomPaint</a> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former). [...](https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRebuildSemantics.html)  
_inherited_



##### [shouldRepaint](../components_arc/ArcPainter/shouldRepaint.md)(covariant [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html) oldDelegate) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Called whenever a new instance of the custom painter delegate class is
provided to the <a href="https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html">RenderCustomPaint</a> object, or any time that a new
<a href="https://api.flutter.dev/flutter/widgets/CustomPaint-class.html">CustomPaint</a> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former). [...](../components_arc/ArcPainter/shouldRepaint.md)  
_override_



##### [toString](https://api.flutter.dev/flutter/rendering/CustomPainter/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/rendering/CustomPainter/toString.html)  
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_











