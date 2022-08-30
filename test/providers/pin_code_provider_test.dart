import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/pin_code_testing.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendAddPinCodeMethod extends Mock {
  Future<void> call(
      Request request, String id, String pinCode, String pinCodeName);
}

class PinCodeTraitProviderTest with DeviceTesting, PinCodeTesting {}

@GenerateMocks([GetDeviceDetailsMethod, SendAddPinCodeMethod])
void main() {
  final pinCodeTest = PinCodeTraitProviderTest();
  final defaultPinCodeDevice = TestPinCodeDevice(pinCodeTest.device());

  group('For PinCodeTraitProvider', () {});
}
