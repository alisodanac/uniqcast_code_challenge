// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) {
  return _ChannelModel.fromJson(json);
}

/// @nodoc
mixin _$ChannelModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get logo => throw _privateConstructorUsedError;
  @HiveField(3)
  String get url => throw _privateConstructorUsedError;
  @HiveField(4)
  List<ProgramModel> get programs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelModelCopyWith<ChannelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelModelCopyWith<$Res> {
  factory $ChannelModelCopyWith(
          ChannelModel value, $Res Function(ChannelModel) then) =
      _$ChannelModelCopyWithImpl<$Res, ChannelModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String logo,
      @HiveField(3) String url,
      @HiveField(4) List<ProgramModel> programs});
}

/// @nodoc
class _$ChannelModelCopyWithImpl<$Res, $Val extends ChannelModel>
    implements $ChannelModelCopyWith<$Res> {
  _$ChannelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? url = null,
    Object? programs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      programs: null == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<ProgramModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelModelImplCopyWith<$Res>
    implements $ChannelModelCopyWith<$Res> {
  factory _$$ChannelModelImplCopyWith(
          _$ChannelModelImpl value, $Res Function(_$ChannelModelImpl) then) =
      __$$ChannelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String logo,
      @HiveField(3) String url,
      @HiveField(4) List<ProgramModel> programs});
}

/// @nodoc
class __$$ChannelModelImplCopyWithImpl<$Res>
    extends _$ChannelModelCopyWithImpl<$Res, _$ChannelModelImpl>
    implements _$$ChannelModelImplCopyWith<$Res> {
  __$$ChannelModelImplCopyWithImpl(
      _$ChannelModelImpl _value, $Res Function(_$ChannelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? url = null,
    Object? programs = null,
  }) {
    return _then(_$ChannelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      programs: null == programs
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<ProgramModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelModelImpl implements _ChannelModel {
  _$ChannelModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.logo,
      @HiveField(3) required this.url,
      @HiveField(4) final List<ProgramModel> programs = const []})
      : _programs = programs;

  factory _$ChannelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String logo;
  @override
  @HiveField(3)
  final String url;
  final List<ProgramModel> _programs;
  @override
  @JsonKey()
  @HiveField(4)
  List<ProgramModel> get programs {
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programs);
  }

  @override
  String toString() {
    return 'ChannelModel(id: $id, name: $name, logo: $logo, url: $url, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo, url,
      const DeepCollectionEquality().hash(_programs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelModelImplCopyWith<_$ChannelModelImpl> get copyWith =>
      __$$ChannelModelImplCopyWithImpl<_$ChannelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelModelImplToJson(
      this,
    );
  }
}

abstract class _ChannelModel implements ChannelModel {
  factory _ChannelModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String logo,
      @HiveField(3) required final String url,
      @HiveField(4) final List<ProgramModel> programs}) = _$ChannelModelImpl;

  factory _ChannelModel.fromJson(Map<String, dynamic> json) =
      _$ChannelModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get logo;
  @override
  @HiveField(3)
  String get url;
  @override
  @HiveField(4)
  List<ProgramModel> get programs;
  @override
  @JsonKey(ignore: true)
  _$$ChannelModelImplCopyWith<_$ChannelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
