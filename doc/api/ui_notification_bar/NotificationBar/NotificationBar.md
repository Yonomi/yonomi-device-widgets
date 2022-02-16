


# NotificationBar constructor




    *[<Null safety>](https://dart.dev/null-safety)*


const
NotificationBar({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageText, required [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) backgroundColor, [IconData](https://api.flutter.dev/flutter/widgets/IconData-class.html) messageIcon = BootstrapIcons.exclamation_diamond_fill})





## Implementation

```dart
const NotificationBar({
  Key? key,
  required String messageText,
  required Color backgroundColor,
  IconData messageIcon = BootstrapIcons.exclamation_diamond_fill,
})  : _messageText = messageText,
      _backgroundColor = backgroundColor,
      _messageIcon = messageIcon,
      super(key: key);
```







