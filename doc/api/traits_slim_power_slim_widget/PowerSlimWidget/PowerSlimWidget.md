


# PowerSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



PowerSlimWidget([PowerTraitProvider](../../providers_power_trait_provider/PowerTraitProvider-class.md) powerProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
PowerSlimWidget(PowerTraitProvider powerProvider,
    {Color? backgroundColor, Key? key})
    : super(
          provider: powerProvider,
          leftIcon: PowerItemIcon(powerProvider.getOnOffState,
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          rightIcon: CupertinoSwitch(
            activeColor: WidgetStyleConstants.traitDetailSwitchPressedColor,
            onChanged: (bool onOff) {
              powerProvider.sendPowerOnOffAction(onOff);
            },
            value: powerProvider.getOnOffState,
          ),
          headerText: Text(
              powerProvider.deviceDetail?.displayName ?? 'POWER',
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          key: key);
```







