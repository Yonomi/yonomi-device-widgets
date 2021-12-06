


# createWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createWidget
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name)








## Implementation

```dart
Widget createWidget(String name) {
  switch (name) {
    case 'lock':
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(),
        );
      });
    default:
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              BootstrapIcons.box,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Unknown trait', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      );
  }
}
```







