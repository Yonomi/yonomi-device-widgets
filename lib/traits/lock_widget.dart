import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockWidget extends StatelessWidget {
  final LockProvider _lockProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final Color _warningTextColor;
  late final double _iconSize;

  LockWidget(this._lockProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.darkTextColor,
      Color warningTextColor = WidgetStyleConstants.globalWarningColor,
      double iconSize = 100,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._warningTextColor = warningTextColor;
    this._iconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    return _lockProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Text(
                    'LOCK',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: _textColor),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                child: Center(
                  child: SizedBox(
                      width: _iconSize,
                      height: _iconSize,
                      child: _lockProvider.isPerformingAction
                          ? CircularProgressIndicator()
                          : _lockProvider.getIsLockedState
                              ? LockIcon(true,
                                  size: _iconSize, color: _iconColor)
                              : LockIcon(false,
                                  size: _iconSize, color: _iconColor)),
                ),
              ),
              SizedBox(height: 10),
              CupertinoSwitch(
                onChanged: (bool value) {
                  _lockTap(_lockProvider);
                },
                value: _lockProvider.getIsLockedState,
              ),
              if (shouldDisplayJammedState()) ...[
                SizedBox(height: 20),
                buildIsJammedRow(context),
                SizedBox(height: 10),
              ],
            ],
          );
  }

  bool shouldDisplayJammedState() {
    final bool supportsIsJammed =
        _lockProvider.getLockTrait()?.supportsIsJammed ?? false;
    return supportsIsJammed && _lockProvider.getIsJammedState;
  }

  Row buildIsJammedRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 50,
          child: Card(
            child: Row(children: [
              SizedBox(width: 8),
              Icon(BootstrapIcons.exclamation_diamond_fill),
              SizedBox(width: 8),
              Text(
                StringConstants.DEVICE_IS_JAMMED,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: WidgetStyleConstants.jammedStateTextColor),
              ),
            ]),
            color: _warningTextColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            )),
            elevation: 2,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: Card(
            child: Align(
              alignment: Alignment.center,
              child: Icon(BootstrapIcons.x),
            ),
            color: _warningTextColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            )),
            elevation: 2,
          ),
        ),
      ],
    );
  }

  _getJammedStateColor(bool isJammed) {
    return isJammed ? _warningTextColor : _textColor;
  }

  void _lockTap(LockProvider provider) {
    bool setLock = !provider.getIsLockedState;
    provider.setLockUnlockAction(provider.deviceDetail?.id ?? '', setLock);
  }
}
