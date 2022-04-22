


# ColorSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ColorSlimWidget([ColorProvider](../../providers_color_provider/ColorProvider-class.md) _colorTraitProvider, {[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) backgroundColor = Colors.white70})





## Implementation

```dart
ColorSlimWidget(ColorProvider _colorTraitProvider,
    {Key? key, Color backgroundColor = Colors.white70})
    : super(
          key: key,
          backgroundColor: backgroundColor,
          provider: _colorTraitProvider,
          leftIcon: Icon(BootstrapIcons.lightbulb, color: WidgetStyleConstants.deviceIconColor,),
          headerText: Text('Color'),
          rightIcon: Builder(builder: ((context) {
            return TextButton(
                onPressed: () {
                  final pickedColor = _colorTraitProvider.getColorState;
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                              backgroundColor: Colors.white,
                              children: [
                                SlidePicker(
                            pickerColor: _hsbToColor(pickedColor),
                            onColorChanged: (color) {
                              final calculatedColor =
                                  HSVColor.fromColor(color);
                              _colorTraitProvider.setColorAction(HSBColor(
                                  calculatedColor.hue.toInt(),
                                  (calculatedColor.saturation * 100).toInt(),
                                  (calculatedColor.value * 100).toInt()));
                            },
                            colorModel: ColorModel.hsv,
                                )
                              ]));
                },
                child: SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: _hsbToColor(
                                _colorTraitProvider.getColorState),
                            radius: 14,
                          ),
                          Icon(
                            BootstrapIcons.pencil,
                            color: WidgetStyleConstants.globalSuccessColor,
                            size: 14.0,
                          )
                        ],
                      ),
                    ),
                    width: 28,
                    height: 28));
          })));
```







