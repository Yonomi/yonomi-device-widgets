


# debugDescribeChildren method







- @[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html)

[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;DiagnosticsNode> debugDescribeChildren
()

_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), inherited_



<p>Returns a list of <code>DiagnosticsNode</code> objects describing this node's
children.</p>
<p>Children that are offstage should be added with <code>style</code> set to
<code>DiagnosticsTreeStyle.offstage</code> to indicate that they are offstage.</p>
<p>The list must not contain any null entries. If there are explicit null
children to report, consider <code>new DiagnosticsNode.message</code> or
<code>DiagnosticsProperty&lt;Object&gt;</code> as possible <code>DiagnosticsNode</code> objects to
provide.</p>
<p>Used by <a href="../../components_lock_widget/LockWidget/toStringDeep.md">toStringDeep</a>, <a href="../../components_lock_widget/LockWidget/toDiagnosticsNode.md">toDiagnosticsNode</a> and <a href="../../components_lock_widget/LockWidget/toStringShallow.md">toStringShallow</a>.</p>
<p>See also:</p>
<ul>
<li><code>RenderTable.debugDescribeChildren</code>, which provides high quality custom
descriptions for its child nodes.</li>
</ul>



## Implementation

```dart
@protected
List<DiagnosticsNode> debugDescribeChildren() => const <DiagnosticsNode>[];
```







