// Mocks generated by Mockito 5.0.15 from annotations
// in yonomi_device_widgets/test/traits/mixins/power_widget_testing.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yonomi_device_widgets/providers/device_provider.dart' as _i5;
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart'
    as _i2;
import 'package:yonomi_device_widgets/providers/widget_state.dart' as _i3;
import 'package:yonomi_platform_sdk/src/repository/devices/devices_repository.dart'
    as _i6;
import 'package:yonomi_platform_sdk/src/repository/traits/power_repository.dart'
    as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [PowerTraitProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockPowerTraitProvider extends _i1.Mock
    implements _i2.PowerTraitProvider {
  MockPowerTraitProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get getOnOffState =>
      (super.noSuchMethod(Invocation.getter(#getOnOffState), returnValue: false)
          as bool);
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
  _i4.Future<void> sendPowerOnOffAction(bool? desiredOnOffState,
          {_i5.GetDeviceDetailsMethod? getDetails =
              _i6.DevicesRepository.getDeviceDetails,
          _i2.SendPowerMethod? sendPowerMethod =
              _i7.PowerRepository.sendPowerAction}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPowerOnOffAction, [desiredOnOffState],
              {#getDetails: getDetails, #sendPowerMethod: sendPowerMethod}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> fetchData(
          {_i5.GetDeviceDetailsMethod? getDetails =
              _i6.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> performAction<T>(T? state, T? desiredState, Function? action,
          {_i5.GetDeviceDetailsMethod? getDetails =
              _i6.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [state, desiredState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void addListener(_i8.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i8.VoidCallback? listener) =>
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
