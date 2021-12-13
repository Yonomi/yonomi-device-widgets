// Mocks generated by Mockito 5.0.15 from annotations
// in yonomi_device_widgets/test/traits/detail_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i3;
import 'package:flutter/src/foundation/diagnostics.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:yonomi_device_widgets/providers/lock_provider.dart' as _i9;
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart'
    as _i11;
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart'
    as _i5;
import 'package:yonomi_platform_sdk/src/repository/devices/devices_repository.dart'
    as _i7;
import 'package:yonomi_platform_sdk/src/repository/traits/lock_repository.dart'
    as _i10;
import 'package:yonomi_platform_sdk/src/repository/traits/power_repository.dart'
    as _i12;
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDevice_0 extends _i1.Fake implements _i2.Device {}

class _FakeLockTrait_1 extends _i1.Fake implements _i2.LockTrait {}

class _FakeWidget_2 extends _i1.Fake implements _i3.Widget {
  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_3 extends _i1.Fake implements _i3.InheritedWidget {
  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_4 extends _i1.Fake implements _i3.DiagnosticsNode {
  @override
  String toString(
          {_i4.TextTreeConfiguration? parentConfiguration,
          _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [TraitDetailProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTraitDetailProvider extends _i1.Mock
    implements _i5.TraitDetailProvider {
  MockTraitDetailProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i6.Future<_i2.Device?> fetchData(
          {_i5.GetDetailsFunction? getDetails =
              _i7.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(#fetchData, [], {#getDetails: getDetails}),
          returnValue: Future<_i2.Device?>.value()) as _i6.Future<_i2.Device?>);
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

/// A class which mocks [LockProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockLockProvider extends _i1.Mock implements _i9.LockProvider {
  MockLockProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get loadingDetail =>
      (super.noSuchMethod(Invocation.getter(#loadingDetail), returnValue: false)
          as bool);
  @override
  set loadingDetail(bool? _loadingDetail) =>
      super.noSuchMethod(Invocation.setter(#loadingDetail, _loadingDetail),
          returnValueForMissingStub: null);
  @override
  bool get loadingAction =>
      (super.noSuchMethod(Invocation.getter(#loadingAction), returnValue: false)
          as bool);
  @override
  set loadingAction(bool? _loadingAction) =>
      super.noSuchMethod(Invocation.setter(#loadingAction, _loadingAction),
          returnValueForMissingStub: null);
  @override
  _i2.Device get deviceDetail =>
      (super.noSuchMethod(Invocation.getter(#deviceDetail),
          returnValue: _FakeDevice_0()) as _i2.Device);
  @override
  bool get isLocked =>
      (super.noSuchMethod(Invocation.getter(#isLocked), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i2.LockTrait getLockTrait() =>
      (super.noSuchMethod(Invocation.method(#getLockTrait, []),
          returnValue: _FakeLockTrait_1()) as _i2.LockTrait);
  @override
  _i6.Future<void> getDeviceDetail(String? deviceId,
          {_i9.GetLockDetailsFunction? getLockDetails =
              _i7.DevicesRepository.getLockDetails}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getDeviceDetail, [deviceId], {#getLockDetails: getLockDetails}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setLockUnlockAction(String? deviceId, bool? setLock,
          {_i9.GetLockDetailsFunction? lockDetails =
              _i7.DevicesRepository.getLockDetails,
          _i9.SendLockUnlockFunction? sendLockUnlock =
              _i10.LockRepository.sendLockUnlockAction}) =>
      (super.noSuchMethod(
          Invocation.method(#setLockUnlockAction, [deviceId, setLock],
              {#lockDetails: lockDetails, #sendLockUnlock: sendLockUnlock}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
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

/// A class which mocks [PowerTraitProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockPowerTraitProvider extends _i1.Mock
    implements _i11.PowerTraitProvider {
  MockPowerTraitProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get MAX_RETRIES =>
      (super.noSuchMethod(Invocation.getter(#MAX_RETRIES), returnValue: 0)
          as int);
  @override
  int get RETRY_DELAY_MS =>
      (super.noSuchMethod(Invocation.getter(#RETRY_DELAY_MS), returnValue: 0)
          as int);
  @override
  bool get getOnOffState =>
      (super.noSuchMethod(Invocation.getter(#getOnOffState), returnValue: false)
          as bool);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  bool get isPerformingAction =>
      (super.noSuchMethod(Invocation.getter(#isPerformingAction),
          returnValue: false) as bool);
  @override
  bool get isInErrorState => (super
          .noSuchMethod(Invocation.getter(#isInErrorState), returnValue: false)
      as bool);
  @override
  set setErrorMessage(String? errorMsg) =>
      super.noSuchMethod(Invocation.setter(#setErrorMessage, errorMsg),
          returnValueForMissingStub: null);
  @override
  String get getErrorMessage =>
      (super.noSuchMethod(Invocation.getter(#getErrorMessage), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i6.Future<_i2.Device?> fetchData(
          {_i11.GetDeviceDetailsMethod? getDeviceDetails =
              _i7.DevicesRepository.getDeviceDetails}) =>
      (super.noSuchMethod(
          Invocation.method(
              #fetchData, [], {#getDeviceDetails: getDeviceDetails}),
          returnValue: Future<_i2.Device?>.value()) as _i6.Future<_i2.Device?>);
  @override
  _i6.Future<void> sendPowerOnOffAction(bool? desiredOnOffState,
          {_i11.GetDeviceDetailsMethod? getDetails =
              _i7.DevicesRepository.getDeviceDetails,
          _i11.SendPowerMethod? sendPowerMethod =
              _i12.PowerRepository.sendPowerAction}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPowerOnOffAction, [desiredOnOffState],
              {#getDetails: getDetails, #sendPowerMethod: sendPowerMethod}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
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

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i3.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Widget get widget => (super.noSuchMethod(Invocation.getter(#widget),
      returnValue: _FakeWidget_2()) as _i3.Widget);
  @override
  bool get debugDoingBuild => (super
          .noSuchMethod(Invocation.getter(#debugDoingBuild), returnValue: false)
      as bool);
  @override
  _i3.InheritedWidget dependOnInheritedElement(_i3.InheritedElement? ancestor,
          {Object? aspect}) =>
      (super.noSuchMethod(
          Invocation.method(
              #dependOnInheritedElement, [ancestor], {#aspect: aspect}),
          returnValue: _FakeInheritedWidget_3()) as _i3.InheritedWidget);
  @override
  void visitAncestorElements(bool Function(_i3.Element)? visitor) =>
      super.noSuchMethod(Invocation.method(#visitAncestorElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  void visitChildElements(_i3.ElementVisitor? visitor) =>
      super.noSuchMethod(Invocation.method(#visitChildElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  _i3.DiagnosticsNode describeElement(String? name,
          {_i4.DiagnosticsTreeStyle? style =
              _i4.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeElement, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_4()) as _i3.DiagnosticsNode);
  @override
  _i3.DiagnosticsNode describeWidget(String? name,
          {_i4.DiagnosticsTreeStyle? style =
              _i4.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeWidget, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_4()) as _i3.DiagnosticsNode);
  @override
  List<_i3.DiagnosticsNode> describeMissingAncestor(
          {Type? expectedAncestorType}) =>
      (super.noSuchMethod(
          Invocation.method(#describeMissingAncestor, [],
              {#expectedAncestorType: expectedAncestorType}),
          returnValue: <_i3.DiagnosticsNode>[]) as List<_i3.DiagnosticsNode>);
  @override
  _i3.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(Invocation.method(#describeOwnershipChain, [name]),
          returnValue: _FakeDiagnosticsNode_4()) as _i3.DiagnosticsNode);
  @override
  String toString() => super.toString();
}
