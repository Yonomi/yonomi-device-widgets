


# themeStyleOf method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

ButtonStyle themeStyleOf
(BuildContext context)

_inherited_



<p>Returns the <code>ElevatedButtonThemeData.style</code> of the closest
<code>ElevatedButtonTheme</code> ancestor.</p>



## Implementation

```dart
@override
ButtonStyle? themeStyleOf(BuildContext context) {
  return ElevatedButtonTheme.of(context).style;
}
```







