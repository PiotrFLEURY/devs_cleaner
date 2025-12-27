// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docker_system_df.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DockerSystemDf {

@JsonKey(name: 'Active') String get active;@JsonKey(name: 'Reclaimable') String get reclaimable;@JsonKey(name: 'Size') String get size;@JsonKey(name: 'TotalCount') String get totalCount;@JsonKey(name: 'Type') String get type;
/// Create a copy of DockerSystemDf
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DockerSystemDfCopyWith<DockerSystemDf> get copyWith => _$DockerSystemDfCopyWithImpl<DockerSystemDf>(this as DockerSystemDf, _$identity);

  /// Serializes this DockerSystemDf to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DockerSystemDf&&(identical(other.active, active) || other.active == active)&&(identical(other.reclaimable, reclaimable) || other.reclaimable == reclaimable)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,reclaimable,size,totalCount,type);

@override
String toString() {
  return 'DockerSystemDf(active: $active, reclaimable: $reclaimable, size: $size, totalCount: $totalCount, type: $type)';
}


}

/// @nodoc
abstract mixin class $DockerSystemDfCopyWith<$Res>  {
  factory $DockerSystemDfCopyWith(DockerSystemDf value, $Res Function(DockerSystemDf) _then) = _$DockerSystemDfCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Active') String active,@JsonKey(name: 'Reclaimable') String reclaimable,@JsonKey(name: 'Size') String size,@JsonKey(name: 'TotalCount') String totalCount,@JsonKey(name: 'Type') String type
});




}
/// @nodoc
class _$DockerSystemDfCopyWithImpl<$Res>
    implements $DockerSystemDfCopyWith<$Res> {
  _$DockerSystemDfCopyWithImpl(this._self, this._then);

  final DockerSystemDf _self;
  final $Res Function(DockerSystemDf) _then;

/// Create a copy of DockerSystemDf
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? reclaimable = null,Object? size = null,Object? totalCount = null,Object? type = null,}) {
  return _then(_self.copyWith(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as String,reclaimable: null == reclaimable ? _self.reclaimable : reclaimable // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DockerSystemDf].
extension DockerSystemDfPatterns on DockerSystemDf {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DockerSystemDf value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DockerSystemDf() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DockerSystemDf value)  $default,){
final _that = this;
switch (_that) {
case _DockerSystemDf():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DockerSystemDf value)?  $default,){
final _that = this;
switch (_that) {
case _DockerSystemDf() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Active')  String active, @JsonKey(name: 'Reclaimable')  String reclaimable, @JsonKey(name: 'Size')  String size, @JsonKey(name: 'TotalCount')  String totalCount, @JsonKey(name: 'Type')  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DockerSystemDf() when $default != null:
return $default(_that.active,_that.reclaimable,_that.size,_that.totalCount,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Active')  String active, @JsonKey(name: 'Reclaimable')  String reclaimable, @JsonKey(name: 'Size')  String size, @JsonKey(name: 'TotalCount')  String totalCount, @JsonKey(name: 'Type')  String type)  $default,) {final _that = this;
switch (_that) {
case _DockerSystemDf():
return $default(_that.active,_that.reclaimable,_that.size,_that.totalCount,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Active')  String active, @JsonKey(name: 'Reclaimable')  String reclaimable, @JsonKey(name: 'Size')  String size, @JsonKey(name: 'TotalCount')  String totalCount, @JsonKey(name: 'Type')  String type)?  $default,) {final _that = this;
switch (_that) {
case _DockerSystemDf() when $default != null:
return $default(_that.active,_that.reclaimable,_that.size,_that.totalCount,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DockerSystemDf implements DockerSystemDf {
  const _DockerSystemDf({@JsonKey(name: 'Active') required this.active, @JsonKey(name: 'Reclaimable') required this.reclaimable, @JsonKey(name: 'Size') required this.size, @JsonKey(name: 'TotalCount') required this.totalCount, @JsonKey(name: 'Type') required this.type});
  factory _DockerSystemDf.fromJson(Map<String, dynamic> json) => _$DockerSystemDfFromJson(json);

@override@JsonKey(name: 'Active') final  String active;
@override@JsonKey(name: 'Reclaimable') final  String reclaimable;
@override@JsonKey(name: 'Size') final  String size;
@override@JsonKey(name: 'TotalCount') final  String totalCount;
@override@JsonKey(name: 'Type') final  String type;

/// Create a copy of DockerSystemDf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DockerSystemDfCopyWith<_DockerSystemDf> get copyWith => __$DockerSystemDfCopyWithImpl<_DockerSystemDf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DockerSystemDfToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DockerSystemDf&&(identical(other.active, active) || other.active == active)&&(identical(other.reclaimable, reclaimable) || other.reclaimable == reclaimable)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,reclaimable,size,totalCount,type);

@override
String toString() {
  return 'DockerSystemDf(active: $active, reclaimable: $reclaimable, size: $size, totalCount: $totalCount, type: $type)';
}


}

/// @nodoc
abstract mixin class _$DockerSystemDfCopyWith<$Res> implements $DockerSystemDfCopyWith<$Res> {
  factory _$DockerSystemDfCopyWith(_DockerSystemDf value, $Res Function(_DockerSystemDf) _then) = __$DockerSystemDfCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Active') String active,@JsonKey(name: 'Reclaimable') String reclaimable,@JsonKey(name: 'Size') String size,@JsonKey(name: 'TotalCount') String totalCount,@JsonKey(name: 'Type') String type
});




}
/// @nodoc
class __$DockerSystemDfCopyWithImpl<$Res>
    implements _$DockerSystemDfCopyWith<$Res> {
  __$DockerSystemDfCopyWithImpl(this._self, this._then);

  final _DockerSystemDf _self;
  final $Res Function(_DockerSystemDf) _then;

/// Create a copy of DockerSystemDf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? reclaimable = null,Object? size = null,Object? totalCount = null,Object? type = null,}) {
  return _then(_DockerSystemDf(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as String,reclaimable: null == reclaimable ? _self.reclaimable : reclaimable // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
