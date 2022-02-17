import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a widget to represent a horizontal and wide notification.
/// Includes an 'X' icon that hides the notification when pressed.
///
/// Pass a [messageText] as the text for the notification widget
///
class NotificationBar extends StatefulWidget {
  static const String NOTIFICATION_BAR_KEY = "NotificationBar";

  const NotificationBar({
    Key? key,
    required String messageText,
    required Color backgroundColor,
    IconData messageIcon = BootstrapIcons.exclamation_diamond_fill,
  })  : _messageText = messageText,
        _backgroundColor = backgroundColor,
        _messageIcon = messageIcon,
        super(key: key);

  final String _messageText;
  final Color _backgroundColor;
  final IconData _messageIcon;

  @override
  State<NotificationBar> createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Icon(widget._messageIcon),
                  SizedBox(width: 8),
                  Text(widget._messageText),
                ],
              ),
              GestureDetector(
                key: const Key(NotificationBar.NOTIFICATION_BAR_KEY),
                onTap: () => _hideNotification(),
                child: Container(
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 1.0, color: Colors.white))),
                  child: Icon(BootstrapIcons.x),
                ),
              ),
            ],
          ),
          color: widget._backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
      ),
    );
  }

  _hideNotification() {
    setState(() {
      _isVisible = false;
    });
  }
}
