// Mocks generated by Mockito 5.0.15 from annotations
// in yonomi_device_widgets/test/providers/trait_detail_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as _i2;

import 'trait_detail_provider_test.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDevice_0 extends _i1.Fake implements _i2.Device {}

/// A class which mocks [GetDetails].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetDetails extends _i1.Mock implements _i3.GetDetails {
  MockGetDetails() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Device> call(_i2.Request? request, String? id) =>
      (super.noSuchMethod(Invocation.method(#call, [request, id]),
              returnValue: Future<_i2.Device>.value(_FakeDevice_0()))
          as _i4.Future<_i2.Device>);
  @override
  String toString() => super.toString();
}
