


# ModeIconButton constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ModeIconButton({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, required [VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) onPressed, [VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)? onLongPress, required [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon})





## Implementation

```dart
ModeIconButton({
  Key? key,
  required VoidCallback onPressed,
  VoidCallback? onLongPress,
  required Widget icon,
}) : super(
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







