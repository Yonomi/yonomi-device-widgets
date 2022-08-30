import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'pin_code_testing.mocks.dart';

@GenerateMocks([PinCodeProvider])
mixin PinCodeTesting {
  MockPinCodeProvider mockPinCodeProvider(TestPinCodeDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = '',
      bool isPerformingAction = false}) {
    final mockPinCodeTraitProvider = MockPinCodeProvider();
    when(mockPinCodeTraitProvider.isLoading).thenReturn(isLoading);
    when(mockPinCodeTraitProvider.isBusy).thenReturn(isBusy);
    when(mockPinCodeTraitProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockPinCodeTraitProvider.getErrorMessage).thenReturn(errorMessage);

    when(mockPinCodeTraitProvider.getPinCodeCredentials)
        .thenReturn(device.pinCodes);

    when(mockPinCodeTraitProvider.maxNumberOfCredentials)
        .thenReturn(device.maxNumberOfCredentials);
    when(mockPinCodeTraitProvider.nameLengthRange)
        .thenReturn(device.nameLengthRange);
    when(mockPinCodeTraitProvider.pinCodeLengthRange)
        .thenReturn(device.pinCodeLengthRange);

    when(mockPinCodeTraitProvider.isPerformingAction)
        .thenReturn(isPerformingAction);
    when(mockPinCodeTraitProvider.deviceDetail).thenReturn(device);

    return mockPinCodeTraitProvider;
  }
}

class TestPinCodeDevice extends Device {
  final int maxNumberOfCredentials;
  final PinCodeNameLengthRange? nameLengthRange;
  final PinCodeLengthRange? pinCodeLengthRange;
  final List<PinCodeCredential> pinCodes;

  TestPinCodeDevice(
    Device device, {
    this.maxNumberOfCredentials = 100,
    this.nameLengthRange = const PinCodeNameLengthRange(min: 1, max: 10),
    this.pinCodeLengthRange = const PinCodeLengthRange(min: 4, max: 50),
    this.pinCodes = const [],
  }) : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          PinCodeTrait({}, {}),
          ...device.traits.where((t) => t.runtimeType != PinCodeTrait)
        ]);

  TestPinCodeDevice withMaxNumberOfCredentials(int maxNumberOfCredentials) {
    return TestPinCodeDevice(this,
        maxNumberOfCredentials: maxNumberOfCredentials);
  }

  TestPinCodeDevice withNameLengthRange(PinCodeNameLengthRange range) {
    return TestPinCodeDevice(this, nameLengthRange: range);
  }

  TestPinCodeDevice withPinCodeLengthRange(PinCodeLengthRange range) {
    return TestPinCodeDevice(this, pinCodeLengthRange: range);
  }
}
