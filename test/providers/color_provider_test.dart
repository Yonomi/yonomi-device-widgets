import 'package:flutter_test/flutter_test.dart';

import '../mixins/color_testing.dart';
import '../mixins/device_testing.dart';

class BatteryLevelProviderTest with DeviceTesting, ColorTesting {}

void main() {
  group('For ColorProvider', () {
    test("""When loading device data, we are notified that it is loading
        through isLoading.""", () async {});
    test("""After successfully loading device data, should be in idle state
        when done.""", () async {});
    test("""When an error occurs loading device data, we are notified
        an error occurred using isInErrorState and get
        an error message with getErrorMessage.""", () async {});
  });
}
