


# getColorState property




    *[<Null safety>](https://dart.dev/null-safety)*




[GHSBColorValueInput](https://yonomi.co/third_party_yonomi_graphql_schema_schema.docs.schema.gql/GHSBColorValueInput-class.html)? getColorState
  







## Implementation

```dart
GHSBColorValueInput? get getColorState {
  final color = getColorTrait?.stateWhereType<HSBColor>();
  if (color is HSBColor) {
    return color.value;
  } else {
    return null;
  }
}
```








