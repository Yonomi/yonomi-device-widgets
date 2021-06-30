


# paint method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void paint
([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection})





<p>Paints the border within the given <a href="https://api.flutter.dev/flutter/dart-ui/Rect-class.html">Rect</a> on the given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>.</p>
<p>The <code>textDirection</code> argument must be provided and non-null if the border
has a text direction dependency (for example if it is expressed in terms
of "start" and "end" instead of "left" and "right"). It may be null if
the border will not need the text direction to paint itself.</p>



## Implementation

```dart
@override
void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  switch (side.style) {
    case BorderStyle.none:
      break;
    case BorderStyle.solid:
      canvas.drawCircle(
          rect.center,
          (rect.shortestSide - side.width) / 2.0 + 2.0 * side.width,
          side.toPaint());
  }
}
```







