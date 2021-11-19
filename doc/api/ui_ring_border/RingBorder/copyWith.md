


# copyWith method




    *[<Null safety>](https://dart.dev/null-safety)*



- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[RingBorder](../../ui_ring_border/RingBorder-class.md) copyWith
({[BorderSide](https://api.flutter.dev/flutter/painting/BorderSide-class.html)? side})

_override_



<p>Returns a copy of this OutlinedBorder that draws its outline with the
specified <code>side</code>, if <code>side</code> is non-null.</p>



## Implementation

```dart
@override
RingBorder copyWith({BorderSide? side}) {
  return RingBorder(side: side ?? this.side);
}
```







