// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'npm_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NpmCache {

 String get path; double get totalSizeInBytes;
/// Create a copy of NpmCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NpmCacheCopyWith<NpmCache> get copyWith => _$NpmCacheCopyWithImpl<NpmCache>(this as NpmCache, _$identity);

  /// Serializes this NpmCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NpmCache&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'NpmCache(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class $NpmCacheCopyWith<$Res>  {
  factory $NpmCacheCopyWith(NpmCache value, $Res Function(NpmCache) _then) = _$NpmCacheCopyWithImpl;
@useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class _$NpmCacheCopyWithImpl<$Res>
    implements $NpmCacheCopyWith<$Res> {
  _$NpmCacheCopyWithImpl(this._self, this._then);

  final NpmCache _self;
  final $Res Function(NpmCache) _then;

/// Create a copy of NpmCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NpmCache].
extension NpmCachePatterns on NpmCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NpmCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NpmCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NpmCache value)  $default,){
final _that = this;
switch (_that) {
case _NpmCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NpmCache value)?  $default,){
final _that = this;
switch (_that) {
case _NpmCache() when $default != null:
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
case _NpmCache() when $default != null:
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
case _NpmCache():
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
case _NpmCache() when $default != null:
return $default(_that.path,_that.totalSizeInBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NpmCache implements NpmCache {
   _NpmCache({required this.path, required this.totalSizeInBytes});
  factory _NpmCache.fromJson(Map<String, dynamic> json) => _$NpmCacheFromJson(json);

@override final  String path;
@override final  double totalSizeInBytes;

/// Create a copy of NpmCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NpmCacheCopyWith<_NpmCache> get copyWith => __$NpmCacheCopyWithImpl<_NpmCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NpmCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NpmCache&&(identical(other.path, path) || other.path == path)&&(identical(other.totalSizeInBytes, totalSizeInBytes) || other.totalSizeInBytes == totalSizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,totalSizeInBytes);

@override
String toString() {
  return 'NpmCache(path: $path, totalSizeInBytes: $totalSizeInBytes)';
}


}

/// @nodoc
abstract mixin class _$NpmCacheCopyWith<$Res> implements $NpmCacheCopyWith<$Res> {
  factory _$NpmCacheCopyWith(_NpmCache value, $Res Function(_NpmCache) _then) = __$NpmCacheCopyWithImpl;
@override @useResult
$Res call({
 String path, double totalSizeInBytes
});




}
/// @nodoc
class __$NpmCacheCopyWithImpl<$Res>
    implements _$NpmCacheCopyWith<$Res> {
  __$NpmCacheCopyWithImpl(this._self, this._then);

  final _NpmCache _self;
  final $Res Function(_NpmCache) _then;

/// Create a copy of NpmCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? totalSizeInBytes = null,}) {
  return _then(_NpmCache(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,totalSizeInBytes: null == totalSizeInBytes ? _self.totalSizeInBytes : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
