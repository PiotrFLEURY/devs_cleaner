// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dev_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DevProject {

 String get path; String get technology; double get sizeInBytes;
/// Create a copy of DevProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevProjectCopyWith<DevProject> get copyWith => _$DevProjectCopyWithImpl<DevProject>(this as DevProject, _$identity);

  /// Serializes this DevProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevProject&&(identical(other.path, path) || other.path == path)&&(identical(other.technology, technology) || other.technology == technology)&&(identical(other.sizeInBytes, sizeInBytes) || other.sizeInBytes == sizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,technology,sizeInBytes);

@override
String toString() {
  return 'DevProject(path: $path, technology: $technology, sizeInBytes: $sizeInBytes)';
}


}

/// @nodoc
abstract mixin class $DevProjectCopyWith<$Res>  {
  factory $DevProjectCopyWith(DevProject value, $Res Function(DevProject) _then) = _$DevProjectCopyWithImpl;
@useResult
$Res call({
 String path, String technology, double sizeInBytes
});




}
/// @nodoc
class _$DevProjectCopyWithImpl<$Res>
    implements $DevProjectCopyWith<$Res> {
  _$DevProjectCopyWithImpl(this._self, this._then);

  final DevProject _self;
  final $Res Function(DevProject) _then;

/// Create a copy of DevProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? technology = null,Object? sizeInBytes = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,technology: null == technology ? _self.technology : technology // ignore: cast_nullable_to_non_nullable
as String,sizeInBytes: null == sizeInBytes ? _self.sizeInBytes : sizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DevProject].
extension DevProjectPatterns on DevProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevProject value)  $default,){
final _that = this;
switch (_that) {
case _DevProject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevProject value)?  $default,){
final _that = this;
switch (_that) {
case _DevProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String technology,  double sizeInBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevProject() when $default != null:
return $default(_that.path,_that.technology,_that.sizeInBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String technology,  double sizeInBytes)  $default,) {final _that = this;
switch (_that) {
case _DevProject():
return $default(_that.path,_that.technology,_that.sizeInBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String technology,  double sizeInBytes)?  $default,) {final _that = this;
switch (_that) {
case _DevProject() when $default != null:
return $default(_that.path,_that.technology,_that.sizeInBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DevProject implements DevProject {
  const _DevProject({required this.path, required this.technology, required this.sizeInBytes});
  factory _DevProject.fromJson(Map<String, dynamic> json) => _$DevProjectFromJson(json);

@override final  String path;
@override final  String technology;
@override final  double sizeInBytes;

/// Create a copy of DevProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevProjectCopyWith<_DevProject> get copyWith => __$DevProjectCopyWithImpl<_DevProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevProject&&(identical(other.path, path) || other.path == path)&&(identical(other.technology, technology) || other.technology == technology)&&(identical(other.sizeInBytes, sizeInBytes) || other.sizeInBytes == sizeInBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,technology,sizeInBytes);

@override
String toString() {
  return 'DevProject(path: $path, technology: $technology, sizeInBytes: $sizeInBytes)';
}


}

/// @nodoc
abstract mixin class _$DevProjectCopyWith<$Res> implements $DevProjectCopyWith<$Res> {
  factory _$DevProjectCopyWith(_DevProject value, $Res Function(_DevProject) _then) = __$DevProjectCopyWithImpl;
@override @useResult
$Res call({
 String path, String technology, double sizeInBytes
});




}
/// @nodoc
class __$DevProjectCopyWithImpl<$Res>
    implements _$DevProjectCopyWith<$Res> {
  __$DevProjectCopyWithImpl(this._self, this._then);

  final _DevProject _self;
  final $Res Function(_DevProject) _then;

/// Create a copy of DevProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? technology = null,Object? sizeInBytes = null,}) {
  return _then(_DevProject(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,technology: null == technology ? _self.technology : technology // ignore: cast_nullable_to_non_nullable
as String,sizeInBytes: null == sizeInBytes ? _self.sizeInBytes : sizeInBytes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DevProjectCollection {

 List<DevProject> get projects;
/// Create a copy of DevProjectCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevProjectCollectionCopyWith<DevProjectCollection> get copyWith => _$DevProjectCollectionCopyWithImpl<DevProjectCollection>(this as DevProjectCollection, _$identity);

  /// Serializes this DevProjectCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevProjectCollection&&const DeepCollectionEquality().equals(other.projects, projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'DevProjectCollection(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $DevProjectCollectionCopyWith<$Res>  {
  factory $DevProjectCollectionCopyWith(DevProjectCollection value, $Res Function(DevProjectCollection) _then) = _$DevProjectCollectionCopyWithImpl;
@useResult
$Res call({
 List<DevProject> projects
});




}
/// @nodoc
class _$DevProjectCollectionCopyWithImpl<$Res>
    implements $DevProjectCollectionCopyWith<$Res> {
  _$DevProjectCollectionCopyWithImpl(this._self, this._then);

  final DevProjectCollection _self;
  final $Res Function(DevProjectCollection) _then;

/// Create a copy of DevProjectCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<DevProject>,
  ));
}

}


/// Adds pattern-matching-related methods to [DevProjectCollection].
extension DevProjectCollectionPatterns on DevProjectCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevProjectCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevProjectCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevProjectCollection value)  $default,){
final _that = this;
switch (_that) {
case _DevProjectCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevProjectCollection value)?  $default,){
final _that = this;
switch (_that) {
case _DevProjectCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DevProject> projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevProjectCollection() when $default != null:
return $default(_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DevProject> projects)  $default,) {final _that = this;
switch (_that) {
case _DevProjectCollection():
return $default(_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DevProject> projects)?  $default,) {final _that = this;
switch (_that) {
case _DevProjectCollection() when $default != null:
return $default(_that.projects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DevProjectCollection implements DevProjectCollection {
  const _DevProjectCollection({required final  List<DevProject> projects}): _projects = projects;
  factory _DevProjectCollection.fromJson(Map<String, dynamic> json) => _$DevProjectCollectionFromJson(json);

 final  List<DevProject> _projects;
@override List<DevProject> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of DevProjectCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevProjectCollectionCopyWith<_DevProjectCollection> get copyWith => __$DevProjectCollectionCopyWithImpl<_DevProjectCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevProjectCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevProjectCollection&&const DeepCollectionEquality().equals(other._projects, _projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'DevProjectCollection(projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$DevProjectCollectionCopyWith<$Res> implements $DevProjectCollectionCopyWith<$Res> {
  factory _$DevProjectCollectionCopyWith(_DevProjectCollection value, $Res Function(_DevProjectCollection) _then) = __$DevProjectCollectionCopyWithImpl;
@override @useResult
$Res call({
 List<DevProject> projects
});




}
/// @nodoc
class __$DevProjectCollectionCopyWithImpl<$Res>
    implements _$DevProjectCollectionCopyWith<$Res> {
  __$DevProjectCollectionCopyWithImpl(this._self, this._then);

  final _DevProjectCollection _self;
  final $Res Function(_DevProjectCollection) _then;

/// Create a copy of DevProjectCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(_DevProjectCollection(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<DevProject>,
  ));
}


}

// dart format on
