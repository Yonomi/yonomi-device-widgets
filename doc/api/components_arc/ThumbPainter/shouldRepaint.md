


# shouldRepaint method




    *[<Null safety>](https://dart.dev/null-safety)*



- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) shouldRepaint
(covariant [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html) oldDelegate)

_override_



<p>Called whenever a new instance of the custom painter delegate class is
provided to the <a href="https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html">RenderCustomPaint</a> object, or any time that a new
<a href="https://api.flutter.dev/flutter/widgets/CustomPaint-class.html">CustomPaint</a> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former).</p>
<p>If the new instance represents different information than the old
instance, then the method should return true, otherwise it should return
false.</p>
<p>If the method returns false, then the <a href="../../components_arc/ThumbPainter/paint.md">paint</a> call might be optimized
away.</p>
<p>It's possible that the <a href="../../components_arc/ThumbPainter/paint.md">paint</a> method will get called even if
<a href="../../components_arc/ThumbPainter/shouldRepaint.md">shouldRepaint</a> returns false (e.g. if an ancestor or descendant needed to
be repainted). It's also possible that the <a href="../../components_arc/ThumbPainter/paint.md">paint</a> method will get called
without <a href="../../components_arc/ThumbPainter/shouldRepaint.md">shouldRepaint</a> being called at all (e.g. if the box changes
size).</p>
<p>If a custom delegate has a particularly expensive paint function such that
repaints should be avoided as much as possible, a <a href="https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html">RepaintBoundary</a> or
<a href="https://api.flutter.dev/flutter/rendering/RenderRepaintBoundary-class.html">RenderRepaintBoundary</a> (or other render object with
<a href="https://api.flutter.dev/flutter/rendering/RenderObject/isRepaintBoundary.html">RenderObject.isRepaintBoundary</a> set to true) might be helpful.</p>
<p>The <code>oldDelegate</code> argument will never be null.</p>



## Implementation

```dart
@override
bool shouldRepaint(CustomPainter oldDelegate) => true;
```







