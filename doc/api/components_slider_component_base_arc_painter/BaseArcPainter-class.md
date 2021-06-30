


# BaseArcPainter class












## Constructors

[BaseArcPainter](../components_slider_component_base_arc_painter/BaseArcPainter/BaseArcPainter.md) ({@[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [SliderMode](../components_slider_component_slider_component/SliderMode-class.md) mode, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) arcColorStart, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) arcColorEnd, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [double](https://api.flutter.dev/flutter/dart-core/double-class.html) strokeWidth})

    


## Properties

##### [arcColorEnd](../components_slider_component_base_arc_painter/BaseArcPainter/arcColorEnd.md) &#8596; [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)



   
_read / write_



##### [arcColorStart](../components_slider_component_base_arc_painter/BaseArcPainter/arcColorStart.md) &#8596; [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)



   
_read / write_



##### [center](../components_slider_component_base_arc_painter/BaseArcPainter/center.md) &#8596; [Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html)



   
_read / write_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)  
_read-only, inherited_



##### [mode](../components_slider_component_base_arc_painter/BaseArcPainter/mode.md) &#8596; [SliderMode](../components_slider_component_slider_component/SliderMode-class.md)



   
_read / write_



##### [radius](../components_slider_component_base_arc_painter/BaseArcPainter/radius.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_read / write_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_



##### [semanticsBuilder](../components_slider_component_base_arc_painter/BaseArcPainter/semanticsBuilder.md) &#8594; SemanticsBuilderCallback



Returns a function that builds semantic information for the picture drawn
by this painter. [...](../components_slider_component_base_arc_painter/BaseArcPainter/semanticsBuilder.md)  
_read-only, inherited_



##### [startAngle](../components_slider_component_base_arc_painter/BaseArcPainter/startAngle.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_read / write_



##### [strokeWidth](../components_slider_component_base_arc_painter/BaseArcPainter/strokeWidth.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_read / write_



##### [sweepAngle](../components_slider_component_base_arc_painter/BaseArcPainter/sweepAngle.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



   
_read / write_




## Methods

##### [addListener](../components_slider_component_base_arc_painter/BaseArcPainter/addListener.md)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be notified when it is time to repaint. [...](../components_slider_component_base_arc_painter/BaseArcPainter/addListener.md)  
_inherited_



##### [hitTest](../components_slider_component_base_arc_painter/BaseArcPainter/hitTest.md)([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) position) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Called whenever a hit test is being performed on an object that is using
this custom paint delegate. [...](../components_slider_component_base_arc_painter/BaseArcPainter/hitTest.md)  
_inherited_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [paint](../components_slider_component_base_arc_painter/BaseArcPainter/paint.md)([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size) void



Called whenever the object needs to paint. The given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a> has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the <code>size</code> argument. [...](../components_slider_component_base_arc_painter/BaseArcPainter/paint.md)  




##### [removeListener](../components_slider_component_base_arc_painter/BaseArcPainter/removeListener.md)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that the
object notifies when it is time to repaint. [...](../components_slider_component_base_arc_painter/BaseArcPainter/removeListener.md)  
_inherited_



##### [shouldRebuildSemantics](../components_slider_component_base_arc_painter/BaseArcPainter/shouldRebuildSemantics.md)(covariant CustomPainter oldDelegate) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Called whenever a new instance of the custom painter delegate class is
provided to the <code>RenderCustomPaint</code> object, or any time that a new
<code>CustomPaint</code> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former). [...](../components_slider_component_base_arc_painter/BaseArcPainter/shouldRebuildSemantics.md)  
_inherited_



##### [shouldRepaint](../components_slider_component_base_arc_painter/BaseArcPainter/shouldRepaint.md)(covariant CustomPainter oldDelegate) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Called whenever a new instance of the custom painter delegate class is
provided to the <code>RenderCustomPaint</code> object, or any time that a new
<code>CustomPaint</code> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former). [...](../components_slider_component_base_arc_painter/BaseArcPainter/shouldRepaint.md)  




##### [sweepGradientShader](../components_slider_component_base_arc_painter/BaseArcPainter/sweepGradientShader.md)([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) offset) [Shader](https://api.flutter.dev/flutter/dart-ui/Shader-class.html)



   




##### [toString](../components_slider_component_base_arc_painter/BaseArcPainter/toString.md)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](../components_slider_component_base_arc_painter/BaseArcPainter/toString.md)  
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_











