


# ThermostatIcon constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ThermostatIcon({[double](https://api.flutter.dev/flutter/dart-core/double-class.html)? thermostatState, [Decoration](https://api.flutter.dev/flutter/painting/Decoration-class.html)? decoration, [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)? textStyle, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
ThermostatIcon(
    {double? thermostatState,
    Decoration? decoration,
    TextStyle? textStyle,
    Key? key})
    : super(key: key) {
  this._thermostatState =
      (thermostatState != null) ? thermostatState.round().toString() : 'N/A';
  this._decoration = decoration ??
      BoxDecoration(
          borderRadius: WidgetStyleConstants.defaultCircularBorderRadius,
          border: Border.all(
              width: WidgetStyleConstants.defaultBorderWidth,
              color: WidgetStyleConstants.defaultBorderColor));
  this._textStyle = WidgetStyleConstants.deviceItemTextPrimaryState;
}
```







