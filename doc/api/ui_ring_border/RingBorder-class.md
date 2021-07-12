


# RingBorder class









<p>A border that fits a ring-circle within the available space.</p>
<p>Typically used with <a href="https://api.flutter.dev/flutter/painting/ShapeDecoration-class.html">ShapeDecoration</a> to draw a circle.</p>
<p>The <a href="https://api.flutter.dev/flutter/painting/CircleBorder/dimensions.html">dimensions</a> assume that the border is being used in a square space.
When applied to a rectangular space, the border paints in the center of the
rectangle.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/painting/CircleBorder-class.html">CircleBorder</a>, which is the parent implementation for this class.</li>
<li><a href="https://api.flutter.dev/flutter/painting/Border-class.html">Border</a>, which, when used with <a href="https://api.flutter.dev/flutter/painting/BoxDecoration-class.html">BoxDecoration</a>, can also
describe a circle.</li>
</ul>


**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)
- [OutlinedBorder](https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html)
- [CircleBorder](https://api.flutter.dev/flutter/painting/CircleBorder-class.html)
- RingBorder






## Constructors

[RingBorder](../ui_ring_border/RingBorder/RingBorder.md) ({[BorderSide](https://api.flutter.dev/flutter/painting/BorderSide-class.html) side = BorderSide.none})

   _const_ 


## Properties

##### [dimensions](https://api.flutter.dev/flutter/painting/CircleBorder/dimensions.html) &#8594; [EdgeInsetsGeometry](https://api.flutter.dev/flutter/painting/EdgeInsetsGeometry-class.html)



The widths of the sides of this border represented as an <a href="https://api.flutter.dev/flutter/painting/EdgeInsets-class.html">EdgeInsets</a>. [...](https://api.flutter.dev/flutter/painting/CircleBorder/dimensions.html)  
_read-only, inherited_



##### [hashCode](https://api.flutter.dev/flutter/painting/CircleBorder/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/painting/CircleBorder/hashCode.html)  
_read-only, inherited_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_



##### [side](https://api.flutter.dev/flutter/painting/OutlinedBorder/side.html) &#8594; [BorderSide](https://api.flutter.dev/flutter/painting/BorderSide-class.html)



The border outline's color and weight. [...](https://api.flutter.dev/flutter/painting/OutlinedBorder/side.html)  
_final, inherited_




## Methods

##### [add](https://api.flutter.dev/flutter/painting/ShapeBorder/add.html)([ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html) other, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reversed = false}) [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)



Attempts to create a new object that represents the amalgamation of <code>this</code>
border and the <code>other</code> border. [...](https://api.flutter.dev/flutter/painting/ShapeBorder/add.html)  
_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), inherited_



##### [copyWith](../ui_ring_border/RingBorder/copyWith.md)({[BorderSide](https://api.flutter.dev/flutter/painting/BorderSide-class.html) side}) [RingBorder](../ui_ring_border/RingBorder-class.md)



Returns a copy of this OutlinedBorder that draws its outline with the
specified <code>side</code>, if <code>side</code> is non-null.   
_override_



##### [getInnerPath](https://api.flutter.dev/flutter/painting/CircleBorder/getInnerPath.html)([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) [Path](https://api.flutter.dev/flutter/dart-ui/Path-class.html)



Create a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the inner edge of the border. [...](https://api.flutter.dev/flutter/painting/CircleBorder/getInnerPath.html)  
_inherited_



##### [getOuterPath](https://api.flutter.dev/flutter/painting/CircleBorder/getOuterPath.html)([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) [Path](https://api.flutter.dev/flutter/dart-ui/Path-class.html)



Create a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the outer edge of the border. [...](https://api.flutter.dev/flutter/painting/CircleBorder/getOuterPath.html)  
_inherited_



##### [lerpFrom](https://api.flutter.dev/flutter/painting/CircleBorder/lerpFrom.html)([ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html) a, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)



Linearly interpolates from another <a href="https://api.flutter.dev/flutter/painting/ShapeBorder-class.html">ShapeBorder</a> (possibly of another
class) to <code>this</code>. [...](https://api.flutter.dev/flutter/painting/CircleBorder/lerpFrom.html)  
_inherited_



##### [lerpTo](https://api.flutter.dev/flutter/painting/CircleBorder/lerpTo.html)([ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html) b, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)



Linearly interpolates from <code>this</code> to another <a href="https://api.flutter.dev/flutter/painting/ShapeBorder-class.html">ShapeBorder</a> (possibly of
another class). [...](https://api.flutter.dev/flutter/painting/CircleBorder/lerpTo.html)  
_inherited_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [paint](../ui_ring_border/RingBorder/paint.md)([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) void



Paints the border within the given <a href="https://api.flutter.dev/flutter/dart-ui/Rect-class.html">Rect</a> on the given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>. [...](../ui_ring_border/RingBorder/paint.md)  
_override_



##### [scale](../ui_ring_border/RingBorder/scale.md)([double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)



Creates a copy of this border, scaled by the factor <code>t</code>. [...](../ui_ring_border/RingBorder/scale.md)  
_override_



##### [toString](https://api.flutter.dev/flutter/painting/CircleBorder/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/painting/CircleBorder/toString.html)  
_inherited_




## Operators

##### [operator +](https://api.flutter.dev/flutter/painting/ShapeBorder/operator_plus.html)([ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html) other) [ShapeBorder](https://api.flutter.dev/flutter/painting/ShapeBorder-class.html)



Creates a new border consisting of the two borders on either side of the
operator. [...](https://api.flutter.dev/flutter/painting/ShapeBorder/operator_plus.html)  
_inherited_



##### [operator ==](https://api.flutter.dev/flutter/painting/CircleBorder/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/painting/CircleBorder/operator_equals.html)  
_inherited_











