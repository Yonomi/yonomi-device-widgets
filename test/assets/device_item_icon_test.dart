// import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart'
//     as Devices;

// Widget createIconWidget(List<Devices.Trait> traits) {
//   return MaterialApp(
//     home: Scaffold(
//       body: Container(child: DeviceItemIcon.getIcon(traits)),
//     ),
//   );
// }
//
// class UnknownTrait extends Devices.Trait {
//   UnknownTrait(String name, Devices.State state) : super(name, state);
// }
//
// void main() {
//   testWidgets('should render correct thermostat trait icon',
//       (WidgetTester tester) async {
//     final thermostatDevice = [
//       Devices.ThermostatTrait('thermostat', Devices.TargetTemperature(22))
//     ];
//     await tester.pumpWidget(createIconWidget(thermostatDevice));
//     expect(find.widgetWithText(Center, '22'), findsOneWidget);
//   });
//
//   testWidgets('should render n/a if target temperature is null',
//       (WidgetTester tester) async {
//     final thermostatDevice = [
//       Devices.ThermostatTrait('thermostat', Devices.TargetTemperature(null))
//     ];
//     await tester.pumpWidget(createIconWidget(thermostatDevice));
//     expect(find.widgetWithText(Center, 'N/A'), findsOneWidget);
//   });
//
//   testWidgets('should render correct Lock trait icon when unlocked',
//       (WidgetTester tester) async {
//     final lockDevice = [
//       Devices.LockUnlockTrait('lockunlock', Devices.IsLocked(false))
//     ];
//     await tester.pumpWidget(createIconWidget(lockDevice));
//     expect(find.byIcon(Icons.lock_open), findsOneWidget);
//   });
//
//   testWidgets('should render correct Lock trait icon when locked',
//       (WidgetTester tester) async {
//     final lockDevice = [
//       Devices.LockUnlockTrait('lockunlock', Devices.IsLocked(true))
//     ];
//     await tester.pumpWidget(createIconWidget(lockDevice));
//     expect(find.byIcon(Icons.lock), findsOneWidget);
//   });
//
//   testWidgets('should render unknown icon if trait not found',
//       (WidgetTester tester) async {
//     final unknownDevice = [UnknownTrait('unknown', Devices.IsLocked(true))];
//     await tester.pumpWidget(createIconWidget(unknownDevice));
//     expect(find.byIcon(Icons.device_unknown), findsOneWidget);
//   });
// }
