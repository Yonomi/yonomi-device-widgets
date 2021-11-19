


# paint method




    *[<Null safety>](https://dart.dev/null-safety)*



- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void paint
([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size)

_override_



<p>Called whenever the object needs to paint. The given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a> has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the <code>size</code> argument.</p>
<p>Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html">Canvas.clipRect</a> at the beginning of <a href="../../components_arc/ThumbPainter/paint.md">paint</a> so everything that follows
will be guaranteed to only draw within the clipped area.</p>
<p>Implementations should be wary of correctly pairing any calls to
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/save.html">Canvas.save</a>/<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html">Canvas.saveLayer</a> and <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/restore.html">Canvas.restore</a>, otherwise all
subsequent painting on this canvas may be affected, with potentially
hilarious but confusing results.</p>
<p>To paint text on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>, use a <a href="https://api.flutter.dev/flutter/painting/TextPainter-class.html">TextPainter</a>.</p>
<p>To paint an image on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>:</p>
<ol>
<li>
<p>Obtain an <a href="https://api.flutter.dev/flutter/painting/ImageStream-class.html">ImageStream</a>, for example by calling <a href="https://api.flutter.dev/flutter/painting/ImageProvider/resolve.html">ImageProvider.resolve</a>
on an <a href="https://api.flutter.dev/flutter/painting/AssetImage-class.html">AssetImage</a> or <a href="https://api.flutter.dev/flutter/painting/NetworkImage-class.html">NetworkImage</a> object.</p>
</li>
<li>
<p>Whenever the <a href="https://api.flutter.dev/flutter/painting/ImageStream-class.html">ImageStream</a>'s underlying <a href="https://api.flutter.dev/flutter/painting/ImageInfo-class.html">ImageInfo</a> object changes
(see <a href="https://api.flutter.dev/flutter/painting/ImageStream/addListener.html">ImageStream.addListener</a>), create a new instance of your custom
paint delegate, giving it the new <a href="https://api.flutter.dev/flutter/painting/ImageInfo-class.html">ImageInfo</a> object.</p>
</li>
<li>
<p>In your delegate's <a href="../../components_arc/ThumbPainter/paint.md">paint</a> method, call the <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html">Canvas.drawImage</a>,
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html">Canvas.drawImageRect</a>, or <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html">Canvas.drawImageNine</a> methods to paint the
<a href="https://api.flutter.dev/flutter/painting/ImageInfo/image.html">ImageInfo.image</a> object, applying the <a href="https://api.flutter.dev/flutter/painting/ImageInfo/scale.html">ImageInfo.scale</a> value to
obtain the correct rendering size.</p>
</li>
</ol>



## Implementation

```dart
@override
void paint(Canvas canvas, Size size) {
  var thumbPaint = Paint()
    ..color = Colors.red[400]!
    ..style = PaintingStyle.fill;
  canvas.drawCircle(Offset(thumbx! + 5, thumby! + 5), 10, thumbPaint);
}
```







