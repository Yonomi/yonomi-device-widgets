


# getColorTrait property




    *[<Null safety>](https://dart.dev/null-safety)*




[ColorTrait](https://yonomi.co/yonomi-sdk/ColorTrait-class.html)? getColorTrait
  







## Implementation

```dart
ColorTrait? get getColorTrait {
  final color = ColorTrait(HSBColor(130, 50, 50));
  if (color is ColorTrait) {
    return color;
  } else {
    return null;
  }
}
```








