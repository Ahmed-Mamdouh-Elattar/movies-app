// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchListState()';
}


}

/// @nodoc
class $WatchListStateCopyWith<$Res>  {
$WatchListStateCopyWith(WatchListState _, $Res Function(WatchListState) __);
}


/// Adds pattern-matching-related methods to [WatchListState].
extension WatchListStatePatterns on WatchListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Failure value)?  failure,TResult Function( AddOrDeleteMovieSuccess value)?  addOrDeleteMovieSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case AddOrDeleteMovieSuccess() when addOrDeleteMovieSuccess != null:
return addOrDeleteMovieSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Failure value)  failure,required TResult Function( AddOrDeleteMovieSuccess value)  addOrDeleteMovieSuccess,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Failure():
return failure(_that);case AddOrDeleteMovieSuccess():
return addOrDeleteMovieSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Failure value)?  failure,TResult? Function( AddOrDeleteMovieSuccess value)?  addOrDeleteMovieSuccess,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case AddOrDeleteMovieSuccess() when addOrDeleteMovieSuccess != null:
return addOrDeleteMovieSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MovieWatchListEntity> movies)?  success,TResult Function( String errMessage)?  failure,TResult Function( bool isExisted)?  addOrDeleteMovieSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.movies);case Failure() when failure != null:
return failure(_that.errMessage);case AddOrDeleteMovieSuccess() when addOrDeleteMovieSuccess != null:
return addOrDeleteMovieSuccess(_that.isExisted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MovieWatchListEntity> movies)  success,required TResult Function( String errMessage)  failure,required TResult Function( bool isExisted)  addOrDeleteMovieSuccess,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.movies);case Failure():
return failure(_that.errMessage);case AddOrDeleteMovieSuccess():
return addOrDeleteMovieSuccess(_that.isExisted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MovieWatchListEntity> movies)?  success,TResult? Function( String errMessage)?  failure,TResult? Function( bool isExisted)?  addOrDeleteMovieSuccess,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.movies);case Failure() when failure != null:
return failure(_that.errMessage);case AddOrDeleteMovieSuccess() when addOrDeleteMovieSuccess != null:
return addOrDeleteMovieSuccess(_that.isExisted);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements WatchListState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchListState.initial()';
}


}




/// @nodoc


class Loading implements WatchListState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchListState.loading()';
}


}




/// @nodoc


class Success implements WatchListState {
  const Success({required final  List<MovieWatchListEntity> movies}): _movies = movies;
  

 final  List<MovieWatchListEntity> _movies;
 List<MovieWatchListEntity> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'WatchListState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $WatchListStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<MovieWatchListEntity> movies
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(Success(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<MovieWatchListEntity>,
  ));
}


}

/// @nodoc


class Failure implements WatchListState {
  const Failure({required this.errMessage});
  

 final  String errMessage;

/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.errMessage, errMessage) || other.errMessage == errMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errMessage);

@override
String toString() {
  return 'WatchListState.failure(errMessage: $errMessage)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $WatchListStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String errMessage
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errMessage = null,}) {
  return _then(Failure(
errMessage: null == errMessage ? _self.errMessage : errMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddOrDeleteMovieSuccess implements WatchListState {
  const AddOrDeleteMovieSuccess({required this.isExisted});
  

 final  bool isExisted;

/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOrDeleteMovieSuccessCopyWith<AddOrDeleteMovieSuccess> get copyWith => _$AddOrDeleteMovieSuccessCopyWithImpl<AddOrDeleteMovieSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOrDeleteMovieSuccess&&(identical(other.isExisted, isExisted) || other.isExisted == isExisted));
}


@override
int get hashCode => Object.hash(runtimeType,isExisted);

@override
String toString() {
  return 'WatchListState.addOrDeleteMovieSuccess(isExisted: $isExisted)';
}


}

/// @nodoc
abstract mixin class $AddOrDeleteMovieSuccessCopyWith<$Res> implements $WatchListStateCopyWith<$Res> {
  factory $AddOrDeleteMovieSuccessCopyWith(AddOrDeleteMovieSuccess value, $Res Function(AddOrDeleteMovieSuccess) _then) = _$AddOrDeleteMovieSuccessCopyWithImpl;
@useResult
$Res call({
 bool isExisted
});




}
/// @nodoc
class _$AddOrDeleteMovieSuccessCopyWithImpl<$Res>
    implements $AddOrDeleteMovieSuccessCopyWith<$Res> {
  _$AddOrDeleteMovieSuccessCopyWithImpl(this._self, this._then);

  final AddOrDeleteMovieSuccess _self;
  final $Res Function(AddOrDeleteMovieSuccess) _then;

/// Create a copy of WatchListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isExisted = null,}) {
  return _then(AddOrDeleteMovieSuccess(
isExisted: null == isExisted ? _self.isExisted : isExisted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
