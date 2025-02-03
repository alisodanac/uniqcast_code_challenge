// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) {
  return _ProgramModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramModel {
  @HiveField(0)
  String get channelId => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get startTime => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get endTime => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramModelCopyWith<ProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramModelCopyWith<$Res> {
  factory $ProgramModelCopyWith(
          ProgramModel value, $Res Function(ProgramModel) then) =
      _$ProgramModelCopyWithImpl<$Res, ProgramModel>;
  @useResult
  $Res call(
      {@HiveField(0) String channelId,
      @HiveField(1) DateTime startTime,
      @HiveField(2) DateTime endTime,
      @HiveField(3) String title,
      @HiveField(4) String description});
}

/// @nodoc
class _$ProgramModelCopyWithImpl<$Res, $Val extends ProgramModel>
    implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramModelImplCopyWith<$Res>
    implements $ProgramModelCopyWith<$Res> {
  factory _$$ProgramModelImplCopyWith(
          _$ProgramModelImpl value, $Res Function(_$ProgramModelImpl) then) =
      __$$ProgramModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String channelId,
      @HiveField(1) DateTime startTime,
      @HiveField(2) DateTime endTime,
      @HiveField(3) String title,
      @HiveField(4) String description});
}

/// @nodoc
class __$$ProgramModelImplCopyWithImpl<$Res>
    extends _$ProgramModelCopyWithImpl<$Res, _$ProgramModelImpl>
    implements _$$ProgramModelImplCopyWith<$Res> {
  __$$ProgramModelImplCopyWithImpl(
      _$ProgramModelImpl _value, $Res Function(_$ProgramModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$ProgramModelImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramModelImpl implements _ProgramModel {
  _$ProgramModelImpl(
      {@HiveField(0) required this.channelId,
      @HiveField(1) required this.startTime,
      @HiveField(2) required this.endTime,
      @HiveField(3) required this.title,
      @HiveField(4) required this.description});

  factory _$ProgramModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramModelImplFromJson(json);

  @override
  @HiveField(0)
  final String channelId;
  @override
  @HiveField(1)
  final DateTime startTime;
  @override
  @HiveField(2)
  final DateTime endTime;
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String description;

  @override
  String toString() {
    return 'ProgramModel(channelId: $channelId, startTime: $startTime, endTime: $endTime, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramModelImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, channelId, startTime, endTime, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramModelImplCopyWith<_$ProgramModelImpl> get copyWith =>
      __$$ProgramModelImplCopyWithImpl<_$ProgramModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramModelImplToJson(
      this,
    );
  }
}

abstract class _ProgramModel implements ProgramModel {
  factory _ProgramModel(
      {@HiveField(0) required final String channelId,
      @HiveField(1) required final DateTime startTime,
      @HiveField(2) required final DateTime endTime,
      @HiveField(3) required final String title,
      @HiveField(4) required final String description}) = _$ProgramModelImpl;

  factory _ProgramModel.fromJson(Map<String, dynamic> json) =
      _$ProgramModelImpl.fromJson;

  @override
  @HiveField(0)
  String get channelId;
  @override
  @HiveField(1)
  DateTime get startTime;
  @override
  @HiveField(2)
  DateTime get endTime;
  @override
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$ProgramModelImplCopyWith<_$ProgramModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
