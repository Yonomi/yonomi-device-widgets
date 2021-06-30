


# semanticsBuilder property








SemanticsBuilderCallback semanticsBuilder
  
_inherited_



<p>Returns a function that builds semantic information for the picture drawn
by this painter.</p>
<p>If the returned function is null, this painter will not contribute new
<code>SemanticsNode</code>s to the semantics tree and the <code>CustomPaint</code> corresponding
to this painter will not create a semantics boundary. However, if the
child of a <code>CustomPaint</code> is not null, the child may contribute
<code>SemanticsNode</code>s to the tree.</p>
<p>See also:</p>
<ul>
<li><code>SemanticsConfiguration.isSemanticBoundary</code>, which causes new
<code>SemanticsNode</code>s to be added to the semantics tree.</li>
<li><code>RenderCustomPaint</code>, which uses this getter to build semantics.</li>
</ul>



## Implementation

```dart
SemanticsBuilderCallback? get semanticsBuilder => null;
```








