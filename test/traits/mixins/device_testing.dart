import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

mixin DeviceTesting {
  Device device(
    List<Trait> traits, {
    String id = 'id',
    String name = 'name',
    String description = 'description',
    String manufacturerName = 'manufacturerName',
    String model = 'model',
    String? serialNumber,
  }) =>
      Device(id, name, description, manufacturerName, model, serialNumber,
          GDateTime('value'), GDateTime('value'), traits);
}
