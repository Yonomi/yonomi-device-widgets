


# add method







- @[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html)

ShapeBorder add
(ShapeBorder other, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reversed = false})

_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), inherited_



<p>Attempts to create a new object that represents the amalgamation of <code>this</code>
border and the <code>other</code> border.</p>
<p>If the type of the other border isn't known, or the given instance cannot
be reasonably added to this instance, then this should return null.</p>
<p>This method is used by the <a href="../../ui_ring_border/RingBorder/operator_plus.md">operator +</a> implementation.</p>
<p>The <code>reversed</code> argument is true if this object was the right operand of
the <code>+</code> operator, and false if it was the left operand.</p>



## Implementation

```dart
@protected
ShapeBorder? add(ShapeBorder other, { bool reversed = false }) => null;
```







