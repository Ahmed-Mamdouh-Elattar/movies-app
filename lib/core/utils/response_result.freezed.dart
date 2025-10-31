// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResponseResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseResult<$T>()';
}


}

/// @nodoc
class $ResponseResultCopyWith<T,$Res>  {
$ResponseResultCopyWith(ResponseResult<T> _, $Res Function(ResponseResult<T>) __);
}


/// Adds pattern-matching-related methods to [ResponseResult].
extension ResponseResultPatterns<T> on ResponseResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResponseResultSuccess<T> value)?  success,TResult Function( ResponseResultFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResponseResultSuccess() when success != null:
return success(_that);case ResponseResultFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResponseResultSuccess<T> value)  success,required TResult Function( ResponseResultFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case ResponseResultSuccess():
return success(_that);case ResponseResultFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResponseResultSuccess<T> value)?  success,TResult? Function( ResponseResultFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case ResponseResultSuccess() when success != null:
return success(_that);case ResponseResultFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( Failures failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResponseResultSuccess() when success != null:
return success(_that.data);case ResponseResultFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( Failures failure)  failure,}) {final _that = this;
switch (_that) {
case ResponseResultSuccess():
return success(_that.data);case ResponseResultFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( Failures failure)?  failure,}) {final _that = this;
switch (_that) {
case ResponseResultSuccess() when success != null:
return success(_that.data);case ResponseResultFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ResponseResultSuccess<T> implements ResponseResult<T> {
  const ResponseResultSuccess(this.data);
  

 final  T data;

/// Create a copy of ResponseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseResultSuccessCopyWith<T, ResponseResultSuccess<T>> get copyWith => _$ResponseResultSuccessCopyWithImpl<T, ResponseResultSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseResultSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResponseResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResponseResultSuccessCopyWith<T,$Res> implements $ResponseResultCopyWith<T, $Res> {
  factory $ResponseResultSuccessCopyWith(ResponseResultSuccess<T> value, $Res Function(ResponseResultSuccess<T>) _then) = _$ResponseResultSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ResponseResultSuccessCopyWithImpl<T,$Res>
    implements $ResponseResultSuccessCopyWith<T, $Res> {
  _$ResponseResultSuccessCopyWithImpl(this._self, this._then);

  final ResponseResultSuccess<T> _self;
  final $Res Function(ResponseResultSuccess<T>) _then;

/// Create a copy of ResponseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ResponseResultSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ResponseResultFailure<T> implements ResponseResult<T> {
  const ResponseResultFailure(this.failure);
  

 final  Failures failure;

/// Create a copy of ResponseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseResultFailureCopyWith<T, ResponseResultFailure<T>> get copyWith => _$ResponseResultFailureCopyWithImpl<T, ResponseResultFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseResultFailure<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ResponseResult<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ResponseResultFailureCopyWith<T,$Res> implements $ResponseResultCopyWith<T, $Res> {
  factory $ResponseResultFailureCopyWith(ResponseResultFailure<T> value, $Res Function(ResponseResultFailure<T>) _then) = _$ResponseResultFailureCopyWithImpl;
@useResult
$Res call({
 Failures failure
});




}
/// @nodoc
class _$ResponseResultFailureCopyWithImpl<T,$Res>
    implements $ResponseResultFailureCopyWith<T, $Res> {
  _$ResponseResultFailureCopyWithImpl(this._self, this._then);

  final ResponseResultFailure<T> _self;
  final $Res Function(ResponseResultFailure<T>) _then;

/// Create a copy of ResponseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ResponseResultFailure<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failures,
  ));
}


}

// dart format on
