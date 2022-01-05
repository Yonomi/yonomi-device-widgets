


# getLockTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[LockTrait](https://yonomi.co/yonomi-sdk/LockTrait-class.html)? getLockTrait
()








## Implementation

```dart
LockTrait? getLockTrait() {
  return deviceDetail?.traits
      .firstWhere((trait) => trait is LockTrait, orElse: null) as LockTrait?;
}
```







