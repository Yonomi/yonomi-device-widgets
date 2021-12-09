


# yonomi_device_widgets - Dart API docs


<h1 id="yonomi-device-widgets---flutter">Yonomi Device Widgets - Flutter</h1>
<p><a href="https://www.yonomi.co/"><img src="https://img.shields.io/badge/Yonomi-Device_Widgets:_Flutter-lightgrey.svg?colorA=ffd500&amp;colorB=5c5c5c" alt="Yonomi Device Widgets: Flutter"></a>
<a href="https://app.circleci.com/pipelines/github/Yonomi/yonomi-device-widgets"><img src="https://circleci.com/gh/Yonomi/yonomi-device-widgets/tree/main.svg?style=shield&amp;circle-token=fdd9d9b47626dbcace0c6bc927805c73f2233d25" alt="CircleCI"></a>
<a href="https://codecov.io/gh/Yonomi/yonomi-device-widgets"><img src="https://codecov.io/gh/Yonomi/yonomi-device-widgets/branch/main/graph/badge.svg?token=52WBYAD9H9" alt="codecov"></a></p>
<p>Device Widgets are rich UI components that represent traits supported by our platform (such as Lights, Locks, Thermostats).  They are composable and infinitely customizable.  They are open-source, and allow developers to build their own device UIs that are intuitive and inherently tied to the traits and actions featured in our platform's Graph API.</p>
<h1 id="table-of-contents">Table of contents</h1>
<ol>
<li><a href="#install">Setup</a></li>
<li><a href="#run-tests">Running tests</a></li>
</ol>
<h2 id="setup-a-nameinstalla">Setup <a name="install"></a></h2>
<h3 id="cloning-the-repo">Cloning the repo</h3>
<p>Clone the repo into your local machine:</p>
<pre class="language-dart"><code>git clone https://github.com/Yonomi/yonomi-device-widgets.git
</code></pre>
<h3 id="installing-the-package">Installing the package</h3>
<p>In your Flutter app, open your <code>pubspec.yaml</code> file and add the following entry under the <code>dependencies</code> section:</p>
<pre class="language-dart"><code>dependencies:
  ...    
  yonomi_device_widgets: ^1.0.0
</code></pre>
<h2 id="running-testsa-namerun-testsa">Running tests<a name="run-tests"></a></h2>
<h3 id="prerequisites">Prerequisites</h3>
<ul>
<li>Install lcov:</li>
</ul>
<h4 id="lcov-for-test-coverage">lcov (For test coverage)</h4>
<p><code>brew install lcov</code></p>
<h3 id="run-tests-with-coverage">Run tests with coverage</h3>
<pre class="language-dart"><code>flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
</code></pre>
<h2 id="license-a-namelicensea">License <a name="license"></a></h2>
<p>This application is released under the <a href="LICENSE">Apache license v2.0</a></p>
<p><a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License"></a></p>


## Libraries

##### [arc](components_arc/components_arc-library.md)
 


##### [color_constants](ui_color_constants/ui_color_constants-library.md)
 


##### [detail_screen](traits_detail_screen/traits_detail_screen-library.md)
 


##### [device_control](components_device_control/components_device_control-library.md)
 


##### [device_item_icon](assets_traits_device_item_icon/assets_traits_device_item_icon-library.md)
 


##### [lock](traits_lock/traits_lock-library.md)
 


##### [lock](devices_lock/devices_lock-library.md)
 


##### [lock_item_icon](assets_traits_lock_item_icon/assets_traits_lock_item_icon-library.md)
 


##### [lock_provider](providers_lock_provider/providers_lock_provider-library.md)
 


##### [lock_widget](components_lock_widget/components_lock_widget-library.md)
 


##### [modes_toolbar](components_modes_toolbar/components_modes_toolbar-library.md)
 


##### [ring_border](ui_ring_border/ui_ring_border-library.md)
 


##### [thermostat](devices_thermostat/devices_thermostat-library.md)
 


##### [thermostat_icon](assets_traits_thermostat_icon/assets_traits_thermostat_icon-library.md)
 


##### [thermostat_provider](providers_thermostat_provider/providers_thermostat_provider-library.md)
 


##### [thermostat_widget](components_thermostat_widget/components_thermostat_widget-library.md)
 


##### [trait_detail_provider](providers_trait_detail_provider/providers_trait_detail_provider-library.md)
 


##### [unknown_item_icon](assets_traits_unknown_item_icon/assets_traits_unknown_item_icon-library.md)
 


##### [widget_style_constants](ui_widget_style_constants/ui_widget_style_constants-library.md)
 








