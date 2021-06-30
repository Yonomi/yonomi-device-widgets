


# sweepGradientShader method








[Shader](https://api.flutter.dev/flutter/dart-ui/Shader-class.html) sweepGradientShader
([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) offset)








## Implementation

```dart
Shader sweepGradientShader(Rect offset) {
  return this._sweepGradientShader ??=
      SweepGradient(colors: [arcColorStart, arcColorEnd])
          .createShader(offset);
}
```







