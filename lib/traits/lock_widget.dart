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
              if (_lockProvider.getLockTrait()?.supportsIsJammed ?? false) ...[
                SizedBox(height: 20),
                buildIsJammedRow(context),
                SizedBox(height: 10),
              ],
            ],
          );
  }

  Row buildIsJammedRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConstants.IS_LOCK_JAMMED,
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: _getJammedStateColor(_lockProvider.getIsJammedState)),
        ),
        Text(
          _lockProvider.getIsJammedState.toString(),
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: _getJammedStateColor(_lockProvider.getIsJammedState)),
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
