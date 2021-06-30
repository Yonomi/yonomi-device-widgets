


# focusNode property






FocusNode focusNode
  
_final, inherited_



<p>An optional focus node to use as the focus node for this widget.</p>
<p>If one is not supplied, then one will be automatically allocated, owned,
and managed by this widget. The widget will be focusable even if a
<a href="../../components_modes_toolbar/ModeIconButton/focusNode.md">focusNode</a> is not supplied. If supplied, the given <code>focusNode</code> will be
<em>hosted</em> by this widget, but not owned. See <code>FocusNode</code> for more
information on what being hosted and/or owned implies.</p>
<p>Supplying a focus node is sometimes useful if an ancestor to this widget
wants to control when this widget has the focus. The owner will be
responsible for calling <code>FocusNode.dispose</code> on the focus node when it is
done with it, but this widget will attach/detach and reparent the node
when needed.</p>



## Implementation

```dart
final FocusNode? focusNode;


```







