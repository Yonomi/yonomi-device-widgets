


# getColorState property




    *[<Null safety>](https://dart.dev/null-safety)*




[GHSBColorValueInput](https://yonomi.co/third_party_yonomi_graphql_schema_schema.docs.schema.gql/GHSBColorValueInput-class.html)? getColorState
  







## Implementation

```dart
GHSBColorValueInput? get getColorState =>
    colorTrait?.stateWhereType<HSBColor>().value as GHSBColorValueInput?;
```








