


# getLockTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[LockTrait](https://yonomi.co/yonomi-sdk/LockTrait-class.html) getLockTrait
()








## Implementation

```dart
LockTrait getLockTrait() {
  return _deviceDetail.traits
      .skipWhile((trait) => !(trait is LockTrait))
      .first as LockTrait;
}
```







