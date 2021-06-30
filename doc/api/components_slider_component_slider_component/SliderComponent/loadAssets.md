


# loadAssets method








void loadAssets
()








## Implementation

```dart
void loadAssets() async {
  if (selectorSvgString == null) {
    selectorSvgString = await rootBundle.loadString(
        "packages/device_widgets/assets/components/slider_selector_icon.svg");

    DrawableRoot svgRoot =
        await svg.fromSvgString(selectorSvgString, "slider_selector");
    ui.Picture svgAsPicture = svgRoot.toPicture();
    selectorSvgImage = await svgAsPicture.toImage(
        svgRoot.viewport.width.round(), svgRoot.viewport.height.round());
  }
}
```







