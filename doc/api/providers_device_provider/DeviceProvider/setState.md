


# setState property




    *[<Null safety>](https://dart.dev/null-safety)*





setState=
([WidgetState](../../providers_widget_state/WidgetState.md) newState)  







## Implementation

```dart
set setState(WidgetState newState) {
  _state = newState;
  notifyListeners();
}
```







