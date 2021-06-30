


# shouldRebuildSemantics method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) shouldRebuildSemantics
(covariant CustomPainter oldDelegate)

_inherited_



<p>Called whenever a new instance of the custom painter delegate class is
provided to the <code>RenderCustomPaint</code> object, or any time that a new
<code>CustomPaint</code> object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former).</p>
<p>If the new instance would cause <a href="../../components_arc/ArcPainter/semanticsBuilder.md">semanticsBuilder</a> to create different
semantics information, then this method should return true, otherwise it
should return false.</p>
<p>If the method returns false, then the <a href="../../components_arc/ArcPainter/semanticsBuilder.md">semanticsBuilder</a> call might be
optimized away.</p>
<p>It's possible that the <a href="../../components_arc/ArcPainter/semanticsBuilder.md">semanticsBuilder</a> will get called even if
<a href="../../components_arc/ArcPainter/shouldRebuildSemantics.md">shouldRebuildSemantics</a> would return false. For example, it is called
when the <code>CustomPaint</code> is rendered for the very first time, or when the
box changes its size.</p>
<p>By default this method delegates to <a href="../../components_arc/ArcPainter/shouldRepaint.md">shouldRepaint</a> under the assumption
that in most cases semantics change when something new is drawn.</p>



## Implementation

```dart
bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => shouldRepaint(oldDelegate);
```







