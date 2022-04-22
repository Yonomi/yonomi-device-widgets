


# ColorSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ColorSlimWidget([ColorProvider](../../providers_color_provider/ColorProvider-class.md) _colorTraitProvider, {[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) backgroundColor = Colors.white70, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.darkTextColor})





## Implementation

```dart
ColorSlimWidget(ColorProvider _colorTraitProvider,
    {Key? key,
    Color backgroundColor = Colors.white70,
    Color textColor = WidgetStyleConstants.darkTextColor})
    : super(
          key: key,
          backgroundColor: backgroundColor,
          provider: _colorTraitProvider,
          leftIcon: Icon(
            BootstrapIcons.lightbulb,
            color: WidgetStyleConstants.deviceIconColor,
          ),
          headerText:
              Text('Color', style: TextStyle(fontSize: 20, color: textColor)),
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
                                  showParams: false,
                                  displayThumbColor: true,
                                  showSliderText: false,
                                  pickerColor: _hsbToColor(pickedColor),
                                  enableAlpha: false,
                                  onColorChanged: (color) {
                                    final calculatedColor =
                                        HSVColor.fromColor(color);
                                    _colorTraitProvider.setColorAction(
                                        HSBColor(
                                            calculatedColor.hue.toInt(),
                                            (calculatedColor.saturation * 100)
                                                .toInt(),
                                            (calculatedColor.value * 100)
                                                .toInt()));
                                  },
                                  colorModel: ColorModel.hsv,
                                )
                              ]));
                },
                child: SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: _hsbToColor(
                                _colorTraitProvider.getColorState),
                            radius: 14,
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Icon(
                            BootstrapIcons.pencil,
                            color: WidgetStyleConstants.globalSuccessColor,
                            size: 20.0,
                          )
                        ],
                      ),
                    ),
                    width: 60,
                    height: 28));
          })));
```







