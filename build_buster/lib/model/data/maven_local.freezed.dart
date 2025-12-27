// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maven_local.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MavenLocal {

 String get path; double get totalSizeInBytes;
/// Create a copy of MavenLocal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MavenLocalCopyWith<MavenLocal> get copyWith => _$MavenLocalCopyWithImpl<MavenLocal>(this as MavenLocal, _$identity);

  /// Serializes this MavenLocal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MavenLocal&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'MavenLocal(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class $MavenLocalCopyWith<$Res>  {
  factory $MavenLocalCopyWith(MavenLocal value, $Res Function(MavenLocal) _then) = _$MavenLocalCopyWithImpl;
@useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class _$MavenLocalCopyWithImpl<$Res>
    implements $MavenLocalCopyWith<$Res> {
  _$MavenLocalCopyWithImpl(this._self, this._then);

  final MavenLocal _self;
  final $Res Function(MavenLocal) _then;

/// Create a copy of MavenLocal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MavenLocal].
extension MavenLocalPatterns on MavenLocal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MavenLocal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MavenLocal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MavenLocal value)  $default,){
final _that = this;
switch (_that) {
case _MavenLocal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MavenLocal value)?  $default,){
final _that = this;
switch (_that) {
case _MavenLocal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  double totalSizeInBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MavenLocal() when $default != null:
return $default(_that.path,_that.totalSizeInBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  double totalSizeInBytes)  $default,) {final _that = this;
switch (_that) {
case _MavenLocal():
return $default(_that.path,_that.totalSizeInBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  double totalSizeInBytes)?  $default,) {final _that = this;
switch (_that) {
case _MavenLocal() when $default != null:
return $default(_that.path,_that.totalSizeInBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MavenLocal implements MavenLocal {
  const _MavenLocal({required this.path, required this.totalSizeInBytes});
  factory _MavenLocal.fromJson(Map<String, dynamic> json) => _$MavenLocalFromJson(json);

@override final  String path;
@override final  double totalSizeInBytes;

/// Create a copy of MavenLocal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MavenLocalCopyWith<_MavenLocal> get copyWith => __$MavenLocalCopyWithImpl<_MavenLocal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MavenLocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MavenLocal&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'MavenLocal(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class _$MavenLocalCopyWith<$Res> implements $MavenLocalCopyWith<$Res> {
  factory _$MavenLocalCopyWith(_MavenLocal value, $Res Function(_MavenLocal) _then) = __$MavenLocalCopyWithImpl;
@override @useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class __$MavenLocalCopyWithImpl<$Res>
    implements _$MavenLocalCopyWith<$Res> {
  __$MavenLocalCopyWithImpl(this._self, this._then);

  final _MavenLocal _self;
  final $Res Function(_MavenLocal) _then;

/// Create a copy of MavenLocal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_MavenLocal(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
