


# deviceDetail property




    *[<Null safety>](https://dart.dev/null-safety)*




[Device](https://yonomi.co/yonomi-sdk/Device-class.html)? deviceDetail
  







## Implementation

```dart
Device? get deviceDetail => _deviceDetail;
```




deviceDetail=
([Device](https://yonomi.co/yonomi-sdk/Device-class.html)? detail)  







## Implementation

```dart
set deviceDetail(Device? detail) {
  _deviceDetail = detail;

  setLoading = false;
}
```







