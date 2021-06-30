


# dimensions property








EdgeInsetsGeometry dimensions
  
_inherited_



<p>The widths of the sides of this border represented as an <code>EdgeInsets</code>.</p>
<p>Specifically, this is the amount by which a rectangle should be inset so
as to avoid painting over any important part of the border. It is the
amount by which additional borders will be inset before they are drawn.</p>
<p>This can be used, for example, with a <code>Padding</code> widget to inset a box by
the size of these borders.</p>
<p>Shapes that have a fixed ratio regardless of the area on which they are
painted, or that change their rendering based on the size they are given
when painting (for instance <code>CircleBorder</code>), will not return valid
<a href="../../ui_ring_border/RingBorder/dimensions.md">dimensions</a> information because they cannot know their eventual size when
computing their <a href="../../ui_ring_border/RingBorder/dimensions.md">dimensions</a>.</p>



## Implementation

```dart
@override
EdgeInsetsGeometry get dimensions {
  return EdgeInsets.all(side.width);
}
```








