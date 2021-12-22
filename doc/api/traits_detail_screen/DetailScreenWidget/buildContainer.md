


# buildContainer method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildContainer
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
Widget buildContainer(List<Trait> traits) {
  return Container(
      alignment: Alignment.center,
      child: Center(
          child: Column(children: [
        createTraitWidget(traits.first.name, iconColor: Colors.white),
        Accordion(
            maxOpenSections: 1,
            headerPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            children: traits.skip(1).map((trait) {
              return AccordionSection(
                header: createTraitWidgetHeader(trait.name),
                content: createTraitWidget(trait.name),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: Colors.white,
                headerBackgroundColor: Colors.white,
                contentBackgroundColor: Colors.white,
              );
            }).toList())
      ])));
}
```







