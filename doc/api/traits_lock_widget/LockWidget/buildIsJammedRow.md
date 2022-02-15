


# buildIsJammedRow method




    *[<Null safety>](https://dart.dev/null-safety)*




[Row](https://api.flutter.dev/flutter/widgets/Row-class.html) buildIsJammedRow
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)








## Implementation

```dart
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
```







