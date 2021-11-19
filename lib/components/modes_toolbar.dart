import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/ui/ring_border.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';

class ModesToolbar extends StatelessWidget {
  final String? deviceId;

  ModesToolbar({this.deviceId});

  @override
  Widget build(BuildContext context) {
    final ThermostatProvider thermostatProvider =
        Provider.of<ThermostatProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ModeIconButton(
          icon: Text("A"),
          onPressed: () {
            if (deviceId != null) {
              thermostatProvider.setThermostatMode(
                  deviceId!, GThermostatMode.AUTO);
            }
          },
        ),
        ModeIconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {
            if (deviceId != null) {
              thermostatProvider.setThermostatMode(
                  deviceId!, GThermostatMode.COOL);
            }
          },
        ),
        ModeIconButton(
          icon: Icon(Icons.whatshot),
          onPressed: () {
            if (deviceId != null) {
              thermostatProvider.setThermostatMode(
                  deviceId!, GThermostatMode.HEAT);
            }
          },
        ),
        ModeIconButton(
          icon: Icon(Icons.eco),
          onPressed: () {
            if (deviceId != null) {
              thermostatProvider.setThermostatMode(
                  deviceId!, GThermostatMode.AIRFLOW);
            }
          },
        ),
      ],
    );
  }
}

class ModeIconButton extends ElevatedButton {
  ModeIconButton({
    Key? key,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    required Widget icon,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return WidgetStyleConstants.modesButtonPressedColor;
                }
                return WidgetStyleConstants.modesButtonUnpressedColor;
              },
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return RingBorder(
                  side: BorderSide(
                      color: WidgetStyleConstants.modesButtonUnpressedColor,
                      width: 2.0),
                );
              }
              return CircleBorder(side: BorderSide());
            }),
            minimumSize: MaterialStateProperty.all<Size>(Size.square(48.0)),
          ),
          child: ModeButtonIconChild(icon: icon),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
    return super.defaultStyleOf(context).copyWith(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(scaledPadding));
  }
}

class ModeButtonIconChild extends StatelessWidget {
  ModeButtonIconChild({Key? key, required this.icon}) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon],
    );
  }
}
