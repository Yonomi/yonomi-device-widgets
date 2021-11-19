


# buildThermostatIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildThermostatIcon
([double](https://api.flutter.dev/flutter/dart-core/double-class.html)? thermostatState)








## Implementation

```dart
static Widget buildThermostatIcon(double? thermostatState) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 3, color: Colors.black)),
    child: Center(
      child: Text(
        (thermostatState != null)
            ? thermostatState.round().toString()
            : 'N/A',
        style: WidgetStyleConstants.deviceItemTextPrimaryState,
      ),
    ),
  );
}
```







