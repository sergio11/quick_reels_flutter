// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsUiState {
  String get reelUuid => throw _privateConstructorUsedError;
  String get authUserUuid => throw _privateConstructorUsedError;
  String get authUserImageUrl => throw _privateConstructorUsedError;
  List<CommentBO> get commentsByReel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsUiStateCopyWith<CommentsUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsUiStateCopyWith<$Res> {
  factory $CommentsUiStateCopyWith(
          CommentsUiState value, $Res Function(CommentsUiState) then) =
      _$CommentsUiStateCopyWithImpl<$Res, CommentsUiState>;
  @useResult
  $Res call(
      {String reelUuid,
      String authUserUuid,
      String authUserImageUrl,
      List<CommentBO> commentsByReel});
}

/// @nodoc
class _$CommentsUiStateCopyWithImpl<$Res, $Val extends CommentsUiState>
    implements $CommentsUiStateCopyWith<$Res> {
  _$CommentsUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelUuid = null,
    Object? authUserUuid = null,
    Object? authUserImageUrl = null,
    Object? commentsByReel = null,
  }) {
    return _then(_value.copyWith(
      reelUuid: null == reelUuid
          ? _value.reelUuid
          : reelUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserImageUrl: null == authUserImageUrl
          ? _value.authUserImageUrl
          : authUserImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commentsByReel: null == commentsByReel
          ? _value.commentsByReel
          : commentsByReel // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsUiStateImplCopyWith<$Res>
    implements $CommentsUiStateCopyWith<$Res> {
  factory _$$CommentsUiStateImplCopyWith(_$CommentsUiStateImpl value,
          $Res Function(_$CommentsUiStateImpl) then) =
      __$$CommentsUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reelUuid,
      String authUserUuid,
      String authUserImageUrl,
      List<CommentBO> commentsByReel});
}

/// @nodoc
class __$$CommentsUiStateImplCopyWithImpl<$Res>
    extends _$CommentsUiStateCopyWithImpl<$Res, _$CommentsUiStateImpl>
    implements _$$CommentsUiStateImplCopyWith<$Res> {
  __$$CommentsUiStateImplCopyWithImpl(
      _$CommentsUiStateImpl _value, $Res Function(_$CommentsUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelUuid = null,
    Object? authUserUuid = null,
    Object? authUserImageUrl = null,
    Object? commentsByReel = null,
  }) {
    return _then(_$CommentsUiStateImpl(
      reelUuid: null == reelUuid
          ? _value.reelUuid
          : reelUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserImageUrl: null == authUserImageUrl
          ? _value.authUserImageUrl
          : authUserImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commentsByReel: null == commentsByReel
          ? _value._commentsByReel
          : commentsByReel // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
    ));
  }
}

/// @nodoc

class _$CommentsUiStateImpl implements _CommentsUiState {
  const _$CommentsUiStateImpl(
      {this.reelUuid = "",
      this.authUserUuid = "",
      this.authUserImageUrl = "",
      final List<CommentBO> commentsByReel = const []})
      : _commentsByReel = commentsByReel;

  @override
  @JsonKey()
  final String reelUuid;
  @override
  @JsonKey()
  final String authUserUuid;
  @override
  @JsonKey()
  final String authUserImageUrl;
  final List<CommentBO> _commentsByReel;
  @override
  @JsonKey()
  List<CommentBO> get commentsByReel {
    if (_commentsByReel is EqualUnmodifiableListView) return _commentsByReel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsByReel);
  }

  @override
  String toString() {
    return 'CommentsUiState(reelUuid: $reelUuid, authUserUuid: $authUserUuid, authUserImageUrl: $authUserImageUrl, commentsByReel: $commentsByReel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsUiStateImpl &&
            (identical(other.reelUuid, reelUuid) ||
                other.reelUuid == reelUuid) &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid) &&
            (identical(other.authUserImageUrl, authUserImageUrl) ||
                other.authUserImageUrl == authUserImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._commentsByReel, _commentsByReel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelUuid, authUserUuid,
      authUserImageUrl, const DeepCollectionEquality().hash(_commentsByReel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsUiStateImplCopyWith<_$CommentsUiStateImpl> get copyWith =>
      __$$CommentsUiStateImplCopyWithImpl<_$CommentsUiStateImpl>(
          this, _$identity);
}

abstract class _CommentsUiState implements CommentsUiState {
  const factory _CommentsUiState(
      {final String reelUuid,
      final String authUserUuid,
      final String authUserImageUrl,
      final List<CommentBO> commentsByReel}) = _$CommentsUiStateImpl;

  @override
  String get reelUuid;
  @override
  String get authUserUuid;
  @override
  String get authUserImageUrl;
  @override
  List<CommentBO> get commentsByReel;
  @override
  @JsonKey(ignore: true)
  _$$CommentsUiStateImplCopyWith<_$CommentsUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
