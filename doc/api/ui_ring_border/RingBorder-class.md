


# RingBorder class









<p>A border that fits a ring-circle within the available space.</p>
<p>Typically used with <code>ShapeDecoration</code> to draw a circle.</p>
<p>The <a href="../ui_ring_border/RingBorder/dimensions.md">dimensions</a> assume that the border is being used in a square space.
When applied to a rectangular space, the border paints in the center of the
rectangle.</p>
<p>See also:</p>
<ul>
<li><code>CircleBorder</code>, which is the parent implementation for this class.</li>
<li><code>Border</code>, which, when used with <code>BoxDecoration</code>, can also
describe a circle.</li>
</ul>



## Constructors

[RingBorder](../ui_ring_border/RingBorder/RingBorder.md) ({BorderSide side = BorderSide.none})

   _const_ 


## Properties

##### [dimensions](../ui_ring_border/RingBorder/dimensions.md) &#8594; EdgeInsetsGeometry



The widths of the sides of this border represented as an <code>EdgeInsets</code>. [...](../ui_ring_border/RingBorder/dimensions.md)  
_read-only, inherited_



##### [hashCode](../ui_ring_border/RingBorder/hashCode.md) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](../ui_ring_border/RingBorder/hashCode.md)  
_read-only, inherited_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_



##### [side](../ui_ring_border/RingBorder/side.md) &#8594; BorderSide



The border outline's color and weight. [...](../ui_ring_border/RingBorder/side.md)  
_final, inherited_




## Methods

##### [add](../ui_ring_border/RingBorder/add.md)(ShapeBorder other, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reversed = false}) ShapeBorder



Attempts to create a new object that represents the amalgamation of <code>this</code>
border and the <code>other</code> border. [...](../ui_ring_border/RingBorder/add.md)  
_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), inherited_



##### [copyWith](../ui_ring_border/RingBorder/copyWith.md)({BorderSide side}) [RingBorder](../ui_ring_border/RingBorder-class.md)



Returns a copy of this OutlinedBorder that draws its outline with the
specified <code>side</code>, if <code>side</code> is non-null.   




##### [getInnerPath](../ui_ring_border/RingBorder/getInnerPath.md)([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) [Path](https://api.flutter.dev/flutter/dart-ui/Path-class.html)



Create a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the inner edge of the border. [...](../ui_ring_border/RingBorder/getInnerPath.md)  
_inherited_



##### [getOuterPath](../ui_ring_border/RingBorder/getOuterPath.md)([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) [Path](https://api.flutter.dev/flutter/dart-ui/Path-class.html)



Create a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the outer edge of the border. [...](../ui_ring_border/RingBorder/getOuterPath.md)  
_inherited_



##### [lerpFrom](../ui_ring_border/RingBorder/lerpFrom.md)(ShapeBorder a, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) ShapeBorder



Linearly interpolates from another <code>ShapeBorder</code> (possibly of another
class) to <code>this</code>. [...](../ui_ring_border/RingBorder/lerpFrom.md)  
_inherited_



##### [lerpTo](../ui_ring_border/RingBorder/lerpTo.md)(ShapeBorder b, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) ShapeBorder



Linearly interpolates from <code>this</code> to another <code>ShapeBorder</code> (possibly of
another class). [...](../ui_ring_border/RingBorder/lerpTo.md)  
_inherited_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [paint](../ui_ring_border/RingBorder/paint.md)([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection}) void



Paints the border within the given <a href="https://api.flutter.dev/flutter/dart-ui/Rect-class.html">Rect</a> on the given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>. [...](../ui_ring_border/RingBorder/paint.md)  




##### [scale](../ui_ring_border/RingBorder/scale.md)([double](https://api.flutter.dev/flutter/dart-core/double-class.html) t) ShapeBorder



Creates a copy of this border, scaled by the factor <code>t</code>. [...](../ui_ring_border/RingBorder/scale.md)  




##### [toString](../ui_ring_border/RingBorder/toString.md)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](../ui_ring_border/RingBorder/toString.md)  
_inherited_




## Operators

##### [operator +](../ui_ring_border/RingBorder/operator_plus.md)(ShapeBorder other) ShapeBorder



Creates a new border consisting of the two borders on either side of the
operator. [...](../ui_ring_border/RingBorder/operator_plus.md)  
_inherited_



##### [operator ==](../ui_ring_border/RingBorder/operator_equals.md)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](../ui_ring_border/RingBorder/operator_equals.md)  
_inherited_











