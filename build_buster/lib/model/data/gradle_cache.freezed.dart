// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gradle_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GradleCache {

 String get path; double get totalSizeInBytes;
/// Create a copy of GradleCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradleCacheCopyWith<GradleCache> get copyWith => _$GradleCacheCopyWithImpl<GradleCache>(this as GradleCache, _$identity);

  /// Serializes this GradleCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradleCache&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'GradleCache(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class $GradleCacheCopyWith<$Res>  {
  factory $GradleCacheCopyWith(GradleCache value, $Res Function(GradleCache) _then) = _$GradleCacheCopyWithImpl;
@useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class _$GradleCacheCopyWithImpl<$Res>
    implements $GradleCacheCopyWith<$Res> {
  _$GradleCacheCopyWithImpl(this._self, this._then);

  final GradleCache _self;
  final $Res Function(GradleCache) _then;

/// Create a copy of GradleCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GradleCache].
extension GradleCachePatterns on GradleCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GradleCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GradleCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GradleCache value)  $default,){
final _that = this;
switch (_that) {
case _GradleCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GradleCache value)?  $default,){
final _that = this;
switch (_that) {
case _GradleCache() when $default != null:
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
case _GradleCache() when $default != null:
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
case _GradleCache():
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
case _GradleCache() when $default != null:
return $default(_that.path,_that.totalSizeInBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GradleCache implements GradleCache {
  const _GradleCache({required this.path, required this.totalSizeInBytes});
  factory _GradleCache.fromJson(Map<String, dynamic> json) => _$GradleCacheFromJson(json);

@override final  String path;
@override final  double totalSizeInBytes;

/// Create a copy of GradleCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradleCacheCopyWith<_GradleCache> get copyWith => __$GradleCacheCopyWithImpl<_GradleCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradleCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GradleCache&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'GradleCache(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class _$GradleCacheCopyWith<$Res> implements $GradleCacheCopyWith<$Res> {
  factory _$GradleCacheCopyWith(_GradleCache value, $Res Function(_GradleCache) _then) = __$GradleCacheCopyWithImpl;
@override @useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class __$GradleCacheCopyWithImpl<$Res>
    implements _$GradleCacheCopyWith<$Res> {
  __$GradleCacheCopyWithImpl(this._self, this._then);

  final _GradleCache _self;
  final $Res Function(_GradleCache) _then;

/// Create a copy of GradleCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_GradleCache(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
