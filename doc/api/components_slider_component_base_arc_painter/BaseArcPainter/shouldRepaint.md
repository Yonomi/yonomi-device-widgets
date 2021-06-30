


# shouldRepaint method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) shouldRepaint
(covariant CustomPainter oldDelegate)





<p>Called whenever a new instance of the custom painter delegate class is
provided to the <code>RenderCustomPaint</code> object, or any time that a new
<code>CustomPaint</code> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former).</p>
<p>If the new instance represents different information than the old
instance, then the method should return true, otherwise it should return
false.</p>
<p>If the method returns false, then the <a href="../../components_slider_component_base_arc_painter/BaseArcPainter/paint.md">paint</a> call might be optimized
away.</p>
<p>It's possible that the <a href="../../components_slider_component_base_arc_painter/BaseArcPainter/paint.md">paint</a> method will get called even if
<a href="../../components_slider_component_base_arc_painter/BaseArcPainter/shouldRepaint.md">shouldRepaint</a> returns false (e.g. if an ancestor or descendant needed to
be repainted). It's also possible that the <a href="../../components_slider_component_base_arc_painter/BaseArcPainter/paint.md">paint</a> method will get called
without <a href="../../components_slider_component_base_arc_painter/BaseArcPainter/shouldRepaint.md">shouldRepaint</a> being called at all (e.g. if the box changes
size).</p>
<p>If a custom delegate has a particularly expensive paint function such that
repaints should be avoided as much as possible, a <code>RepaintBoundary</code> or
<code>RenderRepaintBoundary</code> (or other render object with
<code>RenderObject.isRepaintBoundary</code> set to true) might be helpful.</p>
<p>The <code>oldDelegate</code> argument will never be null.</p>



## Implementation

```dart
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
}
```







