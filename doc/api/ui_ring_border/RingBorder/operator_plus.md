


# operator + method








ShapeBorder operator +
(ShapeBorder other)

_inherited_



<p>Creates a new border consisting of the two borders on either side of the
operator.</p>
<p>If the borders belong to classes that know how to add themselves, then
this results in a new border that represents the intelligent addition of
those two borders (see <a href="../../ui_ring_border/RingBorder/add.md">add</a>). Otherwise, an object is returned that
merely paints the two borders sequentially, with the left hand operand on
the inside and the right hand operand on the outside.</p>



## Implementation

```dart
ShapeBorder operator +(ShapeBorder other) {
  return add(other) ?? other.add(this, reversed: true) ?? _CompoundBorder(<ShapeBorder>[other, this]);
}
```







