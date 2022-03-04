///
//  Generated code. Do not modify.
//  source: protos/person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'person.pbenum.dart';

export 'person.pbenum.dart';

class Person extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Person', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<UsaAddress>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addresses', $pb.PbFieldType.PM, subBuilder: UsaAddress.create)
    ..pc<Person>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supervisorOf', $pb.PbFieldType.PM, protoName: 'supervisorOf', subBuilder: Person.create)
    ..hasRequiredFields = false
  ;

  Person._() : super();
  factory Person({
    $core.String? name,
    $core.Iterable<UsaAddress>? addresses,
    $core.Iterable<Person>? supervisorOf,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (addresses != null) {
      _result.addresses.addAll(addresses);
    }
    if (supervisorOf != null) {
      _result.supervisorOf.addAll(supervisorOf);
    }
    return _result;
  }
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person)) as Person; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<UsaAddress> get addresses => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Person> get supervisorOf => $_getList(2);
}

class UsaAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UsaAddress', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streetNameAndNumber', protoName: 'streetNameAndNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streetNameAndNumber2', protoName: 'streetNameAndNumber2')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'city')
    ..e<UsaState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: UsaState.AZ, valueOf: UsaState.valueOf, enumValues: UsaState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postCode', $pb.PbFieldType.OU3, protoName: 'postCode')
    ..hasRequiredFields = false
  ;

  UsaAddress._() : super();
  factory UsaAddress({
    $core.String? streetNameAndNumber,
    $core.String? streetNameAndNumber2,
    $core.String? city,
    UsaState? state,
    $core.int? postCode,
  }) {
    final _result = create();
    if (streetNameAndNumber != null) {
      _result.streetNameAndNumber = streetNameAndNumber;
    }
    if (streetNameAndNumber2 != null) {
      _result.streetNameAndNumber2 = streetNameAndNumber2;
    }
    if (city != null) {
      _result.city = city;
    }
    if (state != null) {
      _result.state = state;
    }
    if (postCode != null) {
      _result.postCode = postCode;
    }
    return _result;
  }
  factory UsaAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsaAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsaAddress clone() => UsaAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsaAddress copyWith(void Function(UsaAddress) updates) => super.copyWith((message) => updates(message as UsaAddress)) as UsaAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UsaAddress create() => UsaAddress._();
  UsaAddress createEmptyInstance() => create();
  static $pb.PbList<UsaAddress> createRepeated() => $pb.PbList<UsaAddress>();
  @$core.pragma('dart2js:noInline')
  static UsaAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsaAddress>(create);
  static UsaAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get streetNameAndNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set streetNameAndNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreetNameAndNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreetNameAndNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get streetNameAndNumber2 => $_getSZ(1);
  @$pb.TagNumber(2)
  set streetNameAndNumber2($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStreetNameAndNumber2() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreetNameAndNumber2() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  UsaState get state => $_getN(3);
  @$pb.TagNumber(4)
  set state(UsaState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get postCode => $_getIZ(4);
  @$pb.TagNumber(5)
  set postCode($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPostCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearPostCode() => clearField(5);
}

