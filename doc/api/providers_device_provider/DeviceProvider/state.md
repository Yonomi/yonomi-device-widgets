


# state&lt;T extends Trait, S extends State> method




    *[<Null safety>](https://dart.dev/null-safety)*




[State](https://yonomi.co/yonomi-sdk/State-class.html)? state
&lt;T extends Trait, S extends State>()








## Implementation

```dart
sdk.State<dynamic>?
    state<T extends sdk.Trait, S extends sdk.State<dynamic>>() {
  return trait<T>()
      ?.states
      .firstWhere((state) => state is S, orElse: () => sdk.UnknownState());
}
```







