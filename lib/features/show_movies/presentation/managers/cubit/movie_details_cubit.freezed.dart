// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsState {

 bool get isMovieCast; bool get isMovieReviews; bool get isMovieDetails;
/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsStateCopyWith<MovieDetailsState> get copyWith => _$MovieDetailsStateCopyWithImpl<MovieDetailsState>(this as MovieDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsState&&(identical(other.isMovieCast, isMovieCast) || other.isMovieCast == isMovieCast)&&(identical(other.isMovieReviews, isMovieReviews) || other.isMovieReviews == isMovieReviews)&&(identical(other.isMovieDetails, isMovieDetails) || other.isMovieDetails == isMovieDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isMovieCast,isMovieReviews,isMovieDetails);

@override
String toString() {
  return 'MovieDetailsState(isMovieCast: $isMovieCast, isMovieReviews: $isMovieReviews, isMovieDetails: $isMovieDetails)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsStateCopyWith<$Res>  {
  factory $MovieDetailsStateCopyWith(MovieDetailsState value, $Res Function(MovieDetailsState) _then) = _$MovieDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isMovieCast, bool isMovieReviews, bool isMovieDetails
});




}
/// @nodoc
class _$MovieDetailsStateCopyWithImpl<$Res>
    implements $MovieDetailsStateCopyWith<$Res> {
  _$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final MovieDetailsState _self;
  final $Res Function(MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMovieCast = null,Object? isMovieReviews = null,Object? isMovieDetails = null,}) {
  return _then(_self.copyWith(
isMovieCast: null == isMovieCast ? _self.isMovieCast : isMovieCast // ignore: cast_nullable_to_non_nullable
as bool,isMovieReviews: null == isMovieReviews ? _self.isMovieReviews : isMovieReviews // ignore: cast_nullable_to_non_nullable
as bool,isMovieDetails: null == isMovieDetails ? _self.isMovieDetails : isMovieDetails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsState].
extension MovieDetailsStatePatterns on MovieDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  initial,TResult Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  loading,TResult Function( MovieDetailsEntity? movieDetails,  List<MovieCastEntity>? movieCast,  List<MovieReviewsEntity>? movieReviews,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  loaded,TResult Function( String errMessage,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loading() when loading != null:
return loading(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loaded() when loaded != null:
return loaded(_that.movieDetails,_that.movieCast,_that.movieReviews,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Failure() when failure != null:
return failure(_that.errMessage,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)  initial,required TResult Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)  loading,required TResult Function( MovieDetailsEntity? movieDetails,  List<MovieCastEntity>? movieCast,  List<MovieReviewsEntity>? movieReviews,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)  loaded,required TResult Function( String errMessage,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loading():
return loading(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loaded():
return loaded(_that.movieDetails,_that.movieCast,_that.movieReviews,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Failure():
return failure(_that.errMessage,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  initial,TResult? Function( bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  loading,TResult? Function( MovieDetailsEntity? movieDetails,  List<MovieCastEntity>? movieCast,  List<MovieReviewsEntity>? movieReviews,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  loaded,TResult? Function( String errMessage,  bool isMovieCast,  bool isMovieReviews,  bool isMovieDetails)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loading() when loading != null:
return loading(_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Loaded() when loaded != null:
return loaded(_that.movieDetails,_that.movieCast,_that.movieReviews,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case Failure() when failure != null:
return failure(_that.errMessage,_that.isMovieCast,_that.isMovieReviews,_that.isMovieDetails);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements MovieDetailsState {
  const Initial({this.isMovieCast = false, this.isMovieReviews = false, this.isMovieDetails = false});
  

@override@JsonKey() final  bool isMovieCast;
@override@JsonKey() final  bool isMovieReviews;
@override@JsonKey() final  bool isMovieDetails;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.isMovieCast, isMovieCast) || other.isMovieCast == isMovieCast)&&(identical(other.isMovieReviews, isMovieReviews) || other.isMovieReviews == isMovieReviews)&&(identical(other.isMovieDetails, isMovieDetails) || other.isMovieDetails == isMovieDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isMovieCast,isMovieReviews,isMovieDetails);

@override
String toString() {
  return 'MovieDetailsState.initial(isMovieCast: $isMovieCast, isMovieReviews: $isMovieReviews, isMovieDetails: $isMovieDetails)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool isMovieCast, bool isMovieReviews, bool isMovieDetails
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMovieCast = null,Object? isMovieReviews = null,Object? isMovieDetails = null,}) {
  return _then(Initial(
isMovieCast: null == isMovieCast ? _self.isMovieCast : isMovieCast // ignore: cast_nullable_to_non_nullable
as bool,isMovieReviews: null == isMovieReviews ? _self.isMovieReviews : isMovieReviews // ignore: cast_nullable_to_non_nullable
as bool,isMovieDetails: null == isMovieDetails ? _self.isMovieDetails : isMovieDetails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Loading implements MovieDetailsState {
  const Loading({this.isMovieCast = false, this.isMovieReviews = false, this.isMovieDetails = false});
  

@override@JsonKey() final  bool isMovieCast;
@override@JsonKey() final  bool isMovieReviews;
@override@JsonKey() final  bool isMovieDetails;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.isMovieCast, isMovieCast) || other.isMovieCast == isMovieCast)&&(identical(other.isMovieReviews, isMovieReviews) || other.isMovieReviews == isMovieReviews)&&(identical(other.isMovieDetails, isMovieDetails) || other.isMovieDetails == isMovieDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isMovieCast,isMovieReviews,isMovieDetails);

@override
String toString() {
  return 'MovieDetailsState.loading(isMovieCast: $isMovieCast, isMovieReviews: $isMovieReviews, isMovieDetails: $isMovieDetails)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 bool isMovieCast, bool isMovieReviews, bool isMovieDetails
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMovieCast = null,Object? isMovieReviews = null,Object? isMovieDetails = null,}) {
  return _then(Loading(
isMovieCast: null == isMovieCast ? _self.isMovieCast : isMovieCast // ignore: cast_nullable_to_non_nullable
as bool,isMovieReviews: null == isMovieReviews ? _self.isMovieReviews : isMovieReviews // ignore: cast_nullable_to_non_nullable
as bool,isMovieDetails: null == isMovieDetails ? _self.isMovieDetails : isMovieDetails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Loaded implements MovieDetailsState {
  const Loaded({this.movieDetails, final  List<MovieCastEntity>? movieCast, final  List<MovieReviewsEntity>? movieReviews, this.isMovieCast = false, this.isMovieReviews = false, this.isMovieDetails = false}): _movieCast = movieCast,_movieReviews = movieReviews;
  

 final  MovieDetailsEntity? movieDetails;
 final  List<MovieCastEntity>? _movieCast;
 List<MovieCastEntity>? get movieCast {
  final value = _movieCast;
  if (value == null) return null;
  if (_movieCast is EqualUnmodifiableListView) return _movieCast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MovieReviewsEntity>? _movieReviews;
 List<MovieReviewsEntity>? get movieReviews {
  final value = _movieReviews;
  if (value == null) return null;
  if (_movieReviews is EqualUnmodifiableListView) return _movieReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isMovieCast;
@override@JsonKey() final  bool isMovieReviews;
@override@JsonKey() final  bool isMovieDetails;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&const DeepCollectionEquality().equals(other._movieCast, _movieCast)&&const DeepCollectionEquality().equals(other._movieReviews, _movieReviews)&&(identical(other.isMovieCast, isMovieCast) || other.isMovieCast == isMovieCast)&&(identical(other.isMovieReviews, isMovieReviews) || other.isMovieReviews == isMovieReviews)&&(identical(other.isMovieDetails, isMovieDetails) || other.isMovieDetails == isMovieDetails));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetails,const DeepCollectionEquality().hash(_movieCast),const DeepCollectionEquality().hash(_movieReviews),isMovieCast,isMovieReviews,isMovieDetails);

@override
String toString() {
  return 'MovieDetailsState.loaded(movieDetails: $movieDetails, movieCast: $movieCast, movieReviews: $movieReviews, isMovieCast: $isMovieCast, isMovieReviews: $isMovieReviews, isMovieDetails: $isMovieDetails)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 MovieDetailsEntity? movieDetails, List<MovieCastEntity>? movieCast, List<MovieReviewsEntity>? movieReviews, bool isMovieCast, bool isMovieReviews, bool isMovieDetails
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieDetails = freezed,Object? movieCast = freezed,Object? movieReviews = freezed,Object? isMovieCast = null,Object? isMovieReviews = null,Object? isMovieDetails = null,}) {
  return _then(Loaded(
movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity?,movieCast: freezed == movieCast ? _self._movieCast : movieCast // ignore: cast_nullable_to_non_nullable
as List<MovieCastEntity>?,movieReviews: freezed == movieReviews ? _self._movieReviews : movieReviews // ignore: cast_nullable_to_non_nullable
as List<MovieReviewsEntity>?,isMovieCast: null == isMovieCast ? _self.isMovieCast : isMovieCast // ignore: cast_nullable_to_non_nullable
as bool,isMovieReviews: null == isMovieReviews ? _self.isMovieReviews : isMovieReviews // ignore: cast_nullable_to_non_nullable
as bool,isMovieDetails: null == isMovieDetails ? _self.isMovieDetails : isMovieDetails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Failure implements MovieDetailsState {
  const Failure({required this.errMessage, this.isMovieCast = false, this.isMovieReviews = false, this.isMovieDetails = false});
  

 final  String errMessage;
@override@JsonKey() final  bool isMovieCast;
@override@JsonKey() final  bool isMovieReviews;
@override@JsonKey() final  bool isMovieDetails;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.errMessage, errMessage) || other.errMessage == errMessage)&&(identical(other.isMovieCast, isMovieCast) || other.isMovieCast == isMovieCast)&&(identical(other.isMovieReviews, isMovieReviews) || other.isMovieReviews == isMovieReviews)&&(identical(other.isMovieDetails, isMovieDetails) || other.isMovieDetails == isMovieDetails));
}


@override
int get hashCode => Object.hash(runtimeType,errMessage,isMovieCast,isMovieReviews,isMovieDetails);

@override
String toString() {
  return 'MovieDetailsState.failure(errMessage: $errMessage, isMovieCast: $isMovieCast, isMovieReviews: $isMovieReviews, isMovieDetails: $isMovieDetails)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@override @useResult
$Res call({
 String errMessage, bool isMovieCast, bool isMovieReviews, bool isMovieDetails
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errMessage = null,Object? isMovieCast = null,Object? isMovieReviews = null,Object? isMovieDetails = null,}) {
  return _then(Failure(
errMessage: null == errMessage ? _self.errMessage : errMessage // ignore: cast_nullable_to_non_nullable
as String,isMovieCast: null == isMovieCast ? _self.isMovieCast : isMovieCast // ignore: cast_nullable_to_non_nullable
as bool,isMovieReviews: null == isMovieReviews ? _self.isMovieReviews : isMovieReviews // ignore: cast_nullable_to_non_nullable
as bool,isMovieDetails: null == isMovieDetails ? _self.isMovieDetails : isMovieDetails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
