


# getPowerTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[PowerTrait](https://yonomi.co/yonomi-sdk/PowerTrait-class.html)? getPowerTrait
()








## Implementation

```dart
PowerTrait? getPowerTrait() {
  return deviceDetail?.traits.firstWhere((element) => element is PowerTrait,
      orElse: null) as PowerTrait?;
}
```







