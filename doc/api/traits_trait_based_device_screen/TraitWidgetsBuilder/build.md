


# build method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([Request](https://yonomi.co/yonomi-sdk/Request-class.html) req, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [Device](https://yonomi.co/yonomi-sdk/Device-class.html) deviceDetail)








## Implementation

```dart
static Widget build(Request req, String deviceId, Device deviceDetail) {
  List<Trait> dummyTraits = [
    LockTrait("whenLocked", IsLocked(true)),
    LockTrait("whenUnlocked", IsLocked(false)),
    PowerTrait("PowerTrait", isPowered(true)),
    UnknownTrait(),
  ];

  // TODO: L41: use deviceDetail.traits, not dummyTraits;
  return Column(
    children: [
      buildDeviceTitleRow(deviceDetail.displayName),
      ...buildTraitRows(req, deviceId, dummyTraits),
    ],
  );
}
```







