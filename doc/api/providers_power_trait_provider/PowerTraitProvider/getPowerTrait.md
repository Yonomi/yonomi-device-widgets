


# getPowerTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[PowerTrait](https://yonomi.co/yonomi-sdk/PowerTrait-class.html)? getPowerTrait
()








## Implementation

```dart
PowerTrait? getPowerTrait() {
  try {
    return _deviceDetail?.traits.first as PowerTrait?;
  } catch (error) {
    _setErrorState(error.toString());
  }
}
```







