


# ThermostatSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ThermostatSlimWidget([ThermostatProvider](../../providers_thermostat_provider/ThermostatProvider-class.md) thermostatProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
ThermostatSlimWidget(ThermostatProvider thermostatProvider,
    {Color? backgroundColor, Key? key})
    : super(
          provider: thermostatProvider,
          leftIcon: Icon(BootstrapIcons.thermometer,
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          headerText: Text(
              'Target Temperature: ${thermostatProvider.getTargetTemperatureState.toInt()}\u{00B0}',
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          createContent: (context) => Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Fan: ',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(
                                color: WidgetStyleConstants.darkTextColor),
                      ),
                      Text(thermostatProvider.getFanModeState,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: WidgetStyleConstants.darkTextColor,
                                  fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Fan Modes: ',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(
                                color: WidgetStyleConstants.darkTextColor),
                      ),
                      Text(
                          thermostatProvider.getAvailableFanModes
                              .map((mode) => mode.name)
                              .join(', '),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: WidgetStyleConstants.darkTextColor,
                                  fontWeight: FontWeight.normal))
                    ],
                  ),
                ],
              ),
          key: key);
```







