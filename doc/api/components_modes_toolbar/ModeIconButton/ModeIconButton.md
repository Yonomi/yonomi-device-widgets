


# ModeIconButton constructor







ModeIconButton({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html) key, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) onPressed, [VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) onLongPress, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon})





## Implementation

```dart
ModeIconButton({
  Key key,
  @required VoidCallback onPressed,
  VoidCallback onLongPress,
  @required Widget icon,
})  : assert(icon != null),
      super(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return WidgetStyleConstants.modesButtonPressedColor;
              }
              return WidgetStyleConstants.modesButtonUnpressedColor;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return RingBorder(
                side: BorderSide(
                    color: WidgetStyleConstants.modesButtonUnpressedColor,
                    width: 2.0),
              );
            }
            return CircleBorder(side: BorderSide());
          }),
          minimumSize: MaterialStateProperty.all<Size>(Size.square(48.0)),
        ),
        child: ModeButtonIconChild(icon: icon),
      );
```







