


# createState method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

_ArcState createState
()





<p>Creates the mutable state for this widget at a given location in the tree.</p>
<p>Subclasses should override this method to return a newly created
instance of their associated <code>State</code> subclass:</p>
<pre class="language-dart"><code class="language-dart">@override
_MyState createState() =&gt; _MyState();
</code></pre>
<p>The framework can call this method multiple times over the lifetime of
a <code>StatefulWidget</code>. For example, if the widget is inserted into the tree
in multiple locations, the framework will create a separate <code>State</code> object
for each location. Similarly, if the widget is removed from the tree and
later inserted into the tree again, the framework will call <a href="../../components_arc/Arc/createState.md">createState</a>
again to create a fresh <code>State</code> object, simplifying the lifecycle of
<code>State</code> objects.</p>



## Implementation

```dart
@override
_ArcState createState() => _ArcState();
```







