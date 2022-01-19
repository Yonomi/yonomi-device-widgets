// Mocks generated by Mockito 5.0.15 from annotations
// in yonomi_device_widgets/test/components/modes_toolbar_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i10;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yonomi_device_widgets/providers/device_provider.dart' as _i8;
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart'
    as _i2;
import 'package:yonomi_device_widgets/providers/widget_state.dart' as _i3;
import 'package:yonomi_platform_sdk/src/repository/devices/devices_repository.dart'
    as _i9;
import 'package:yonomi_platform_sdk/src/repository/devices/thermostat_repository.dart'
    as _i6;
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart'
    as _i7;
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ThermostatProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockThermostatProvider extends _i1.Mock
    implements _i2.ThermostatProvider {
  MockThermostatProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double get targetTemperature => (super
          .noSuchMethod(Invocation.getter(#targetTemperature), returnValue: 0.0)
      as double);
  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
  @override
  set setState(_i3.WidgetState? newState) =>
      super.noSuchMethod(Invocation.setter(#setState, newState),
          returnValueForMissingStub: null);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  bool get isPerformingAction =>
      (super.noSuchMethod(Invocation.getter(#isPerformingAction),
          returnValue: false) as bool);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get isInErrorState => (super
          .noSuchMethod(Invocation.getter(#isInErrorState), returnValue: false)
      as bool);
  @override
  String get getErrorMessage =>
      (super.noSuchMethod(Invocation.getter(#getErrorMessage), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  List<_i4.ThermostatTrait> getThermostatTraits() =>
      (super.noSuchMethod(Invocation.method(#getThermostatTraits, []),
          returnValue: <_i4.ThermostatTrait>[]) as List<_i4.ThermostatTrait>);
  @override
  _i5.Future<void> setPointAction(String? deviceId, double? temperature,
          {_i2.SetPointActionFunction? setPoint =
              _i6.ThermostatRepository.setPointThermostat}) =>
      (super.noSuchMethod(
          Invocation.method(
              #setPointAction, [deviceId, temperature], {#setPoint: setPoint}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> setThermostatMode(
          String? deviceId, _i7.GThermostatMode? mode,
          {_i2.SetModeFunction? setMode = _i6.ThermostatRepository.setMode}) =>
      (super.noSuchMethod(
          Invocation.method(
              #setThermostatMode, [deviceId, mode], {#setMode: setMode}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> fetchData(
          {_i8.GetDeviceDetailsMethod? getDetails =
              _i9.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<void> performAction<T>(
          T? desiredState, Function? getState, Function? action,
          {_i8.GetDeviceDetailsMethod? getDetails =
              _i9.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [desiredState, getState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void addListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
