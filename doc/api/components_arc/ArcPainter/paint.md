


# paint method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void paint
([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size)





<p>Called whenever the object needs to paint. The given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a> has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the <code>size</code> argument.</p>
<p>Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html">Canvas.clipRect</a> at the beginning of <a href="../../components_arc/ArcPainter/paint.md">paint</a> so everything that follows
will be guaranteed to only draw within the clipped area.</p>
<p>Implementations should be wary of correctly pairing any calls to
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/save.html">Canvas.save</a>/<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html">Canvas.saveLayer</a> and <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/restore.html">Canvas.restore</a>, otherwise all
subsequent painting on this canvas may be affected, with potentially
hilarious but confusing results.</p>
<p>To paint text on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>, use a <code>TextPainter</code>.</p>
<p>To paint an image on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>:</p>
<ol>
<li>
<p>Obtain an <code>ImageStream</code>, for example by calling <code>ImageProvider.resolve</code>
on an <code>AssetImage</code> or <code>NetworkImage</code> object.</p>
</li>
<li>
<p>Whenever the <code>ImageStream</code>'s underlying <code>ImageInfo</code> object changes
(see <code>ImageStream.addListener</code>), create a new instance of your custom
paint delegate, giving it the new <code>ImageInfo</code> object.</p>
</li>
<li>
<p>In your delegate's <a href="../../components_arc/ArcPainter/paint.md">paint</a> method, call the <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html">Canvas.drawImage</a>,
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html">Canvas.drawImageRect</a>, or <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html">Canvas.drawImageNine</a> methods to paint the
<code>ImageInfo.image</code> object, applying the <code>ImageInfo.scale</code> value to
obtain the correct rendering size.</p>
</li>
</ol>



## Implementation

```dart
@override
void paint(Canvas canvas, Size size) {
  var arcPaint = Paint()
    ..color = color ?? WidgetStyleConstants.defaultArcColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

  //draw arc
  canvas.drawArc(
      Rect.fromCircle(
          center: Offset(width / 2, height / 2), radius: width / 2),
      pi / 2 + pi / 10, //radians
      2 * pi - pi / 5, //radians
      false,
      arcPaint);
}
```







