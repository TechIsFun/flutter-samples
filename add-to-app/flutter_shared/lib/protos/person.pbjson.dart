///
//  Generated code. Do not modify.
//  source: protos/person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use usaStateDescriptor instead')
const UsaState$json = const {
  '1': 'UsaState',
  '2': const [
    const {'1': 'AZ', '2': 0},
    const {'1': 'CA', '2': 5},
    const {'1': 'WA', '2': 47},
    const {'1': 'WI', '2': 49},
  ],
};

/// Descriptor for `UsaState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List usaStateDescriptor = $convert.base64Decode('CghVc2FTdGF0ZRIGCgJBWhAAEgYKAkNBEAUSBgoCV0EQLxIGCgJXSRAx');
@$core.Deprecated('Use personDescriptor instead')
const Person$json = const {
  '1': 'Person',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'addresses', '3': 2, '4': 3, '5': 11, '6': '.UsaAddress', '10': 'addresses'},
    const {'1': 'supervisorOf', '3': 3, '4': 3, '5': 11, '6': '.Person', '10': 'supervisorOf'},
  ],
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode('CgZQZXJzb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIpCglhZGRyZXNzZXMYAiADKAsyCy5Vc2FBZGRyZXNzUglhZGRyZXNzZXMSKwoMc3VwZXJ2aXNvck9mGAMgAygLMgcuUGVyc29uUgxzdXBlcnZpc29yT2Y=');
@$core.Deprecated('Use usaAddressDescriptor instead')
const UsaAddress$json = const {
  '1': 'UsaAddress',
  '2': const [
    const {'1': 'streetNameAndNumber', '3': 1, '4': 1, '5': 9, '10': 'streetNameAndNumber'},
    const {'1': 'streetNameAndNumber2', '3': 2, '4': 1, '5': 9, '10': 'streetNameAndNumber2'},
    const {'1': 'city', '3': 3, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.UsaState', '10': 'state'},
    const {'1': 'postCode', '3': 5, '4': 1, '5': 13, '10': 'postCode'},
  ],
};

/// Descriptor for `UsaAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usaAddressDescriptor = $convert.base64Decode('CgpVc2FBZGRyZXNzEjAKE3N0cmVldE5hbWVBbmROdW1iZXIYASABKAlSE3N0cmVldE5hbWVBbmROdW1iZXISMgoUc3RyZWV0TmFtZUFuZE51bWJlcjIYAiABKAlSFHN0cmVldE5hbWVBbmROdW1iZXIyEhIKBGNpdHkYAyABKAlSBGNpdHkSHwoFc3RhdGUYBCABKA4yCS5Vc2FTdGF0ZVIFc3RhdGUSGgoIcG9zdENvZGUYBSABKA1SCHBvc3RDb2Rl');
