


# buildIsJammedRow method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildIsJammedRow
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)








## Implementation

```dart
Widget buildIsJammedRow(BuildContext context) {
  return Container(
    height: 48,
    margin: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 16),
              Icon(BootstrapIcons.exclamation_diamond_fill),
              SizedBox(width: 8),
              Text(StringConstants.DEVICE_IS_JAMMED),
            ],
          ),
          Container(
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 1.0, color: Colors.white))),
            child: Icon(BootstrapIcons.x),
          ),
        ],
      ),
      color: _warningTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
    ),
  );
}
```







