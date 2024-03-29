import 'package:flutter/material.dart';

mixin ToastNotifications {
  void showToast(BuildContext context, String message,
      {SnackBarBehavior? behavior}) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                behavior: behavior,
              ),
            ));
  }
}
