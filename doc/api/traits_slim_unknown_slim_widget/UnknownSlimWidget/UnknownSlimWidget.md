


# UnknownSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



UnknownSlimWidget([String](https://api.flutter.dev/flutter/dart-core/String-class.html) headerText, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
UnknownSlimWidget(String headerText, {Color? backgroundColor, Key? key})
    : super(
          leftIcon: UnknownItemIcon(
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          headerText: Text(headerText,
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          key: key);
```







