


# PowerExpandWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



PowerExpandWidget([PowerTraitProvider](../../providers_power_trait_provider/PowerTraitProvider-class.md) _powerProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
PowerExpandWidget(PowerTraitProvider _powerProvider,
    {Color? backgroundColor, Key? key})
    : super(
          leftIcon: PowerItemIcon(_powerProvider.getOnOffState,
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          rightIcon: CupertinoSwitch(
            activeColor: WidgetStyleConstants.traitDetailSwitchPressedColor,
            onChanged: (bool onOff) {
              _powerProvider.sendPowerOnOffAction(onOff);
            },
            value: _powerProvider.getOnOffState,
          ),
          headerText: Text(
              _powerProvider.getPowerTrait()?.name ?? 'Power Switch',
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          key: key);
```







