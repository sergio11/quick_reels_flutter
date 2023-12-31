// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainUiData {
  List<IconData> get tabMenuItems => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isKeyboardVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainUiDataCopyWith<MainUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainUiDataCopyWith<$Res> {
  factory $MainUiDataCopyWith(
          MainUiData value, $Res Function(MainUiData) then) =
      _$MainUiDataCopyWithImpl<$Res, MainUiData>;
  @useResult
  $Res call(
      {List<IconData> tabMenuItems, int currentPage, bool isKeyboardVisible});
}

/// @nodoc
class _$MainUiDataCopyWithImpl<$Res, $Val extends MainUiData>
    implements $MainUiDataCopyWith<$Res> {
  _$MainUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabMenuItems = null,
    Object? currentPage = null,
    Object? isKeyboardVisible = null,
  }) {
    return _then(_value.copyWith(
      tabMenuItems: null == tabMenuItems
          ? _value.tabMenuItems
          : tabMenuItems // ignore: cast_nullable_to_non_nullable
              as List<IconData>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isKeyboardVisible: null == isKeyboardVisible
          ? _value.isKeyboardVisible
          : isKeyboardVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainUiDataImplCopyWith<$Res>
    implements $MainUiDataCopyWith<$Res> {
  factory _$$MainUiDataImplCopyWith(
          _$MainUiDataImpl value, $Res Function(_$MainUiDataImpl) then) =
      __$$MainUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IconData> tabMenuItems, int currentPage, bool isKeyboardVisible});
}

/// @nodoc
class __$$MainUiDataImplCopyWithImpl<$Res>
    extends _$MainUiDataCopyWithImpl<$Res, _$MainUiDataImpl>
    implements _$$MainUiDataImplCopyWith<$Res> {
  __$$MainUiDataImplCopyWithImpl(
      _$MainUiDataImpl _value, $Res Function(_$MainUiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabMenuItems = null,
    Object? currentPage = null,
    Object? isKeyboardVisible = null,
  }) {
    return _then(_$MainUiDataImpl(
      tabMenuItems: null == tabMenuItems
          ? _value._tabMenuItems
          : tabMenuItems // ignore: cast_nullable_to_non_nullable
              as List<IconData>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isKeyboardVisible: null == isKeyboardVisible
          ? _value.isKeyboardVisible
          : isKeyboardVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainUiDataImpl implements _MainUiData {
  const _$MainUiDataImpl(
      {final List<IconData> tabMenuItems = const [],
      this.currentPage = 0,
      this.isKeyboardVisible = false})
      : _tabMenuItems = tabMenuItems;

  final List<IconData> _tabMenuItems;
  @override
  @JsonKey()
  List<IconData> get tabMenuItems {
    if (_tabMenuItems is EqualUnmodifiableListView) return _tabMenuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabMenuItems);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isKeyboardVisible;

  @override
  String toString() {
    return 'MainUiData(tabMenuItems: $tabMenuItems, currentPage: $currentPage, isKeyboardVisible: $isKeyboardVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainUiDataImpl &&
            const DeepCollectionEquality()
                .equals(other._tabMenuItems, _tabMenuItems) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isKeyboardVisible, isKeyboardVisible) ||
                other.isKeyboardVisible == isKeyboardVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabMenuItems),
      currentPage,
      isKeyboardVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainUiDataImplCopyWith<_$MainUiDataImpl> get copyWith =>
      __$$MainUiDataImplCopyWithImpl<_$MainUiDataImpl>(this, _$identity);
}

abstract class _MainUiData implements MainUiData {
  const factory _MainUiData(
      {final List<IconData> tabMenuItems,
      final int currentPage,
      final bool isKeyboardVisible}) = _$MainUiDataImpl;

  @override
  List<IconData> get tabMenuItems;
  @override
  int get currentPage;
  @override
  bool get isKeyboardVisible;
  @override
  @JsonKey(ignore: true)
  _$$MainUiDataImplCopyWith<_$MainUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
