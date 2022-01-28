// Mocks generated by Mockito 5.0.15 from annotations
// in yonomi_device_widgets/test/traits/detail_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i10;

import 'package:flutter/material.dart' as _i2;
import 'package:flutter/src/foundation/diagnostics.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart'
    as _i15;
import 'package:yonomi_device_widgets/providers/device_provider.dart' as _i7;
import 'package:yonomi_device_widgets/providers/lock_provider.dart' as _i11;
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart'
    as _i13;
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart'
    as _i4;
import 'package:yonomi_device_widgets/providers/widget_state.dart' as _i5;
import 'package:yonomi_platform_sdk/src/repository/devices/devices_repository.dart'
    as _i8;
import 'package:yonomi_platform_sdk/src/repository/traits/lock_repository.dart'
    as _i12;
import 'package:yonomi_platform_sdk/src/repository/traits/power_repository.dart'
    as _i14;
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as _i9;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeWidget_0 extends _i1.Fake implements _i2.Widget {
  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_1 extends _i1.Fake implements _i2.InheritedWidget {
  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_2 extends _i1.Fake implements _i2.DiagnosticsNode {
  @override
  String toString(
          {_i3.TextTreeConfiguration? parentConfiguration,
          _i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [TraitDetailProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTraitDetailProvider extends _i1.Mock
    implements _i4.TraitDetailProvider {
  MockTraitDetailProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
  @override
  set setState(_i5.WidgetState? newState) =>
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
  _i6.Future<void> fetchData(
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> performAction<T>(
          T? desiredState, Function? getState, Function? action,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [desiredState, getState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  Set<S> properties<T extends _i9.Trait, S extends _i9.Property<dynamic>>() =>
      (super.noSuchMethod(Invocation.method(#properties, []),
          returnValue: <S>{}) as Set<S>);
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

/// A class which mocks [LockProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockLockProvider extends _i1.Mock implements _i11.LockProvider {
  MockLockProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLocked =>
      (super.noSuchMethod(Invocation.getter(#isLocked), returnValue: false)
          as bool);
  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
  @override
  set setState(_i5.WidgetState? newState) =>
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
  _i6.Future<void> setLockUnlockAction(String? deviceId, bool? setLock,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails,
          _i11.SendLockUnlockFunction? sendLockUnlock =
              _i12.LockRepository.sendLockUnlockAction}) =>
      (super.noSuchMethod(
          Invocation.method(#setLockUnlockAction, [deviceId, setLock],
              {#getDetails: getDetails, #sendLockUnlock: sendLockUnlock}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> fetchData(
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> performAction<T>(
          T? desiredState, Function? getState, Function? action,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [desiredState, getState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  Set<S> properties<T extends _i9.Trait, S extends _i9.Property<dynamic>>() =>
      (super.noSuchMethod(Invocation.method(#properties, []),
          returnValue: <S>{}) as Set<S>);
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

/// A class which mocks [PowerTraitProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockPowerTraitProvider extends _i1.Mock
    implements _i13.PowerTraitProvider {
  MockPowerTraitProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get getOnOffState =>
      (super.noSuchMethod(Invocation.getter(#getOnOffState), returnValue: false)
          as bool);
  @override
  bool get supportsDiscreteOnOff =>
      (super.noSuchMethod(Invocation.getter(#supportsDiscreteOnOff),
          returnValue: false) as bool);
  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
  @override
  set setState(_i5.WidgetState? newState) =>
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
  _i6.Future<void> sendPowerOnOffAction(bool? desiredOnOffState,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails,
          _i13.SendPowerMethod? sendPowerMethod =
              _i14.PowerRepository.sendPowerAction}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPowerOnOffAction, [desiredOnOffState],
              {#getDetails: getDetails, #sendPowerMethod: sendPowerMethod}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> fetchData(
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> performAction<T>(
          T? desiredState, Function? getState, Function? action,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [desiredState, getState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  Set<S> properties<T extends _i9.Trait, S extends _i9.Property<dynamic>>() =>
      (super.noSuchMethod(Invocation.method(#properties, []),
          returnValue: <S>{}) as Set<S>);
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

/// A class which mocks [BatteryLevelProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockBatteryLevelProvider extends _i1.Mock
    implements _i15.BatteryLevelProvider {
  MockBatteryLevelProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get getBatteryLevel =>
      (super.noSuchMethod(Invocation.getter(#getBatteryLevel), returnValue: 0)
          as int);
  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
  @override
  set setState(_i5.WidgetState? newState) =>
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
  _i6.Future<void> fetchData(
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void setErrorState(String? errorMsg) =>
      super.noSuchMethod(Invocation.method(#setErrorState, [errorMsg]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> performAction<T>(
          T? desiredState, Function? getState, Function? action,
          {_i7.GetDeviceDetailsMethod? getDetails =
              _i8.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#performAction, [desiredState, getState, action],
              {#getDetails: getDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  Set<S> properties<T extends _i9.Trait, S extends _i9.Property<dynamic>>() =>
      (super.noSuchMethod(Invocation.method(#properties, []),
          returnValue: <S>{}) as Set<S>);
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

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i2.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Widget get widget => (super.noSuchMethod(Invocation.getter(#widget),
      returnValue: _FakeWidget_0()) as _i2.Widget);
  @override
  bool get debugDoingBuild => (super
          .noSuchMethod(Invocation.getter(#debugDoingBuild), returnValue: false)
      as bool);
  @override
  _i2.InheritedWidget dependOnInheritedElement(_i2.InheritedElement? ancestor,
          {Object? aspect}) =>
      (super.noSuchMethod(
          Invocation.method(
              #dependOnInheritedElement, [ancestor], {#aspect: aspect}),
          returnValue: _FakeInheritedWidget_1()) as _i2.InheritedWidget);
  @override
  void visitAncestorElements(bool Function(_i2.Element)? visitor) =>
      super.noSuchMethod(Invocation.method(#visitAncestorElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  void visitChildElements(_i2.ElementVisitor? visitor) =>
      super.noSuchMethod(Invocation.method(#visitChildElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  _i2.DiagnosticsNode describeElement(String? name,
          {_i3.DiagnosticsTreeStyle? style =
              _i3.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeElement, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_2()) as _i2.DiagnosticsNode);
  @override
  _i2.DiagnosticsNode describeWidget(String? name,
          {_i3.DiagnosticsTreeStyle? style =
              _i3.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeWidget, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_2()) as _i2.DiagnosticsNode);
  @override
  List<_i2.DiagnosticsNode> describeMissingAncestor(
          {Type? expectedAncestorType}) =>
      (super.noSuchMethod(
          Invocation.method(#describeMissingAncestor, [],
              {#expectedAncestorType: expectedAncestorType}),
          returnValue: <_i2.DiagnosticsNode>[]) as List<_i2.DiagnosticsNode>);
  @override
  _i2.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(Invocation.method(#describeOwnershipChain, [name]),
          returnValue: _FakeDiagnosticsNode_2()) as _i2.DiagnosticsNode);
  @override
  String toString() => super.toString();
}
