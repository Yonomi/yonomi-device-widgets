


# drawSliderSelector method








void drawSliderSelector
([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) offset, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) angle, [Paint](https://api.flutter.dev/flutter/dart-ui/Paint-class.html) handler)








## Implementation

```dart
void drawSliderSelector(
    Canvas canvas, Offset offset, double angle, Paint handler) {
  if (selectorSvgImage != null) {
    canvas.save();

    final double halfWidth = selectorSvgImage.width / 2;
    final double halfHeight = selectorSvgImage.height / 2;

    final ui.Offset offsetByImageDim =
        Offset(offset.dx - halfWidth, offset.dy - halfHeight);

    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(angle);
    canvas.translate(-offset.dx, -offset.dy);

    canvas.drawImage(selectorSvgImage, offsetByImageDim, handler);

    canvas.restore();
  }
}
```







