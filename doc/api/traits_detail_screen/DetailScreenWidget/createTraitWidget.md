


# createTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidget
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name)








## Implementation

```dart
Widget createTraitWidget(String name) {
  switch (name) {
    case 'lock':
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(lockProvider),
        );
      });
    default:
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            UnknownItemIcon(
              size: 20.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      );
  }
}
```






