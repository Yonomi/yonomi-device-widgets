


# copyWith method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[RingBorder](../../ui_ring_border/RingBorder-class.md) copyWith
({BorderSide side})





<p>Returns a copy of this OutlinedBorder that draws its outline with the
specified <code>side</code>, if <code>side</code> is non-null.</p>



## Implementation

```dart
@override
RingBorder copyWith({BorderSide side}) {
  return RingBorder(side: side ?? this.side);
}
```







