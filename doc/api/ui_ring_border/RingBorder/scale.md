


# scale method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

ShapeBorder scale
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) t)





<p>Creates a copy of this border, scaled by the factor <code>t</code>.</p>
<p>Typically this means scaling the width of the border's side, but it can
also include scaling other artifacts of the border, e.g. the border radius
of a <code>RoundedRectangleBorder</code>.</p>
<p>The <code>t</code> argument represents the multiplicand, or the position on the
timeline for an interpolation from nothing to <code>this</code>, with 0.0 meaning
that the object returned should be the nil variant of this object, 1.0
meaning that no change should be applied, returning <code>this</code> (or something
equivalent to <code>this</code>), and other values meaning that the object should be
multiplied by <code>t</code>. Negative values are allowed but may be meaningless
(they correspond to extrapolating the interpolation from this object to
nothing, and going beyond nothing)</p>
<p>Values for <code>t</code> are usually obtained from an <code>Animation&lt;double&gt;</code>, such as
an <code>AnimationController</code>.</p>
<p>See also:</p>
<ul>
<li><code>BorderSide.scale</code>, which most <code>ShapeBorder</code> subclasses defer to for
the actual computation.</li>
</ul>



## Implementation

```dart
@override
ShapeBorder scale(double t) => RingBorder(side: side.scale(t));
```







