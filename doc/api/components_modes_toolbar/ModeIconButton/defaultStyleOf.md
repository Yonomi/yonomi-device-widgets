


# defaultStyleOf method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[ButtonStyle](https://api.flutter.dev/flutter/material/ButtonStyle-class.html) defaultStyleOf
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_override_



<p>Defines the button's default appearance.</p>
<p>The button <a href="https://api.flutter.dev/flutter/material/ButtonStyleButton/child.html">child</a>'s <a href="https://api.flutter.dev/flutter/widgets/Text-class.html">Text</a> and <a href="https://api.flutter.dev/flutter/widgets/Icon-class.html">Icon</a> widgets are rendered with
the <a href="https://api.flutter.dev/flutter/material/ButtonStyle-class.html">ButtonStyle</a>'s foreground color. The button's <a href="https://api.flutter.dev/flutter/material/InkWell-class.html">InkWell</a> adds
the style's overlay color when the button is focused, hovered
or pressed. The button's background color becomes its <a href="https://api.flutter.dev/flutter/material/Material-class.html">Material</a>
color.</p>
<p>All of the ButtonStyle's defaults appear below. In this list
"Theme.foo" is shorthand for <code>Theme.of(context).foo</code>. Color
scheme values like "onSurface(0.38)" are shorthand for
<code>onSurface.withOpacity(0.38)</code>. <a href="https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html">MaterialStateProperty</a> valued
properties that are not followed by by a sublist have the same
value for all states, otherwise the values are as specified for
each state, and "others" means all other states.</p>
<p>The <code>textScaleFactor</code> is the value of
<code>MediaQuery.of(context).textScaleFactor</code> and the names of the
EdgeInsets constructors and <code>EdgeInsetsGeometry.lerp</code> have been
abbreviated for readability.</p>
<p>The color of the <a href="https://api.flutter.dev/flutter/material/ButtonStyle/textStyle.html">ButtonStyle.textStyle</a> is not used, the
<a href="https://api.flutter.dev/flutter/material/ButtonStyle/foregroundColor.html">ButtonStyle.foregroundColor</a> color is used instead.</p>
<ul>
<li><code>textStyle</code> - Theme.textTheme.button</li>
<li><code>backgroundColor</code>
<ul>
<li>disabled - Theme.colorScheme.onSurface(0.12)</li>
<li>others - Theme.colorScheme.primary</li>
</ul>
</li>
<li><code>foregroundColor</code>
<ul>
<li>disabled - Theme.colorScheme.onSurface(0.38)</li>
<li>others - Theme.colorScheme.onPrimary</li>
</ul>
</li>
<li><code>overlayColor</code>
<ul>
<li>hovered - Theme.colorScheme.onPrimary(0.08)</li>
<li>focused or pressed - Theme.colorScheme.onPrimary(0.24)</li>
</ul>
</li>
<li><code>shadowColor</code> - Theme.shadowColor</li>
<li><code>elevation</code>
<ul>
<li>disabled - 0</li>
<li>default - 2</li>
<li>hovered or focused - 4</li>
<li>pressed - 8</li>
</ul>
</li>
<li><code>padding</code>
<ul>
<li>textScaleFactor &lt;= 1 - horizontal(16)</li>
<li><code>1 &lt; textScaleFactor &lt;= 2</code> - lerp(horizontal(16), horizontal(8))</li>
<li><code>2 &lt; textScaleFactor &lt;= 3</code> - lerp(horizontal(8), horizontal(4))</li>
<li><code>3 &lt; textScaleFactor</code> - horizontal(4)</li>
</ul>
</li>
<li><code>minimumSize</code> - Size(64, 36)</li>
<li><code>side</code> - null</li>
<li><code>shape</code> - RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))</li>
<li><code>mouseCursor</code>
<ul>
<li>disabled - SystemMouseCursors.forbidden</li>
<li>others - SystemMouseCursors.click</li>
</ul>
</li>
<li><code>visualDensity</code> - theme.visualDensity</li>
<li><code>tapTargetSize</code> - theme.materialTapTargetSize</li>
<li><code>animationDuration</code> - kThemeChangeDuration</li>
<li><code>enableFeedback</code> - true</li>
<li><code>alignment</code> - Alignment.center</li>
</ul>
<p>The default padding values for the <a href="https://api.flutter.dev/flutter/material/ElevatedButton/ElevatedButton.icon.html">ElevatedButton.icon</a> factory are slightly different:</p>
<ul>
<li><code>padding</code>
<ul>
<li><code>textScaleFactor &lt;= 1</code> - start(12) end(16)</li>
<li><code>1 &lt; textScaleFactor &lt;= 2</code> - lerp(start(12) end(16), horizontal(8))</li>
<li><code>2 &lt; textScaleFactor &lt;= 3</code> - lerp(horizontal(8), horizontal(4))</li>
<li><code>3 &lt; textScaleFactor</code> - horizontal(4)</li>
</ul>
</li>
</ul>
<p>The default value for <code>side</code>, which defines the appearance of the button's
outline, is null. That means that the outline is defined by the button
shape's <a href="https://api.flutter.dev/flutter/painting/OutlinedBorder/side.html">OutlinedBorder.side</a>. Typically the default value of an
<a href="https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html">OutlinedBorder</a>'s side is <a href="https://api.flutter.dev/flutter/painting/BorderSide/none-constant.html">BorderSide.none</a>, so an outline is not drawn.</p>



## Implementation

```dart
@override
ButtonStyle defaultStyleOf(BuildContext context) {
  final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
    const EdgeInsets.symmetric(horizontal: 8),
    const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );
  return super.defaultStyleOf(context).copyWith(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(scaledPadding));
}
```







