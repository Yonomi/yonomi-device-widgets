


# getPowerTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[PowerTrait](../../traits_trait_based_device_screen/PowerTrait-class.md)? getPowerTrait
()








## Implementation

```dart
PowerTrait? getPowerTrait() {
  try {
    return _deviceDetail?.traits.first as PowerTrait?;
  } catch (error) {
    return null;
  }
}
```







