///
//  Generated code. Do not modify.
//  source: protos/person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UsaState extends $pb.ProtobufEnum {
  static const UsaState AZ = UsaState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AZ');
  static const UsaState CA = UsaState._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CA');
  static const UsaState WA = UsaState._(47, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA');
  static const UsaState WI = UsaState._(49, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WI');

  static const $core.List<UsaState> values = <UsaState> [
    AZ,
    CA,
    WA,
    WI,
  ];

  static final $core.Map<$core.int, UsaState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UsaState? valueOf($core.int value) => _byValue[value];

  const UsaState._($core.int v, $core.String n) : super(v, n);
}

