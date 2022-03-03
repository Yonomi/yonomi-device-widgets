


# showToast method




    *[<Null safety>](https://dart.dev/null-safety)*




void showToast
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) message)








## Implementation

```dart
void showToast(BuildContext context, String message) {
  WidgetsBinding.instance!
      .addPostFrameCallback((_) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          ));
}
```







