


# enabled property








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) enabled
  
_inherited_



<p>Whether the button is enabled or disabled.</p>
<p>Buttons are disabled by default. To enable a button, set its <a href="../../components_modes_toolbar/ModeIconButton/onPressed.md">onPressed</a>
or <a href="../../components_modes_toolbar/ModeIconButton/onLongPress.md">onLongPress</a> properties to a non-null value.</p>



## Implementation

```dart
bool get enabled => onPressed != null || onLongPress != null;
```








