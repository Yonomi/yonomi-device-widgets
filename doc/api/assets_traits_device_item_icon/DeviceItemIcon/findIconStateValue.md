


# findIconStateValue&lt;T extends State, S> method




    *[<Null safety>](https://dart.dev/null-safety)*




S findIconStateValue
&lt;T extends State, S>([Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;[State](https://yonomi.co/yonomi-sdk/State-class.html)> states)








## Implementation

```dart
static S findIconStateValue<T extends sdk.State<dynamic>, S>(
    Set<sdk.State> states) {
  return states.firstWhere((state) => state is T).value;
}
```







