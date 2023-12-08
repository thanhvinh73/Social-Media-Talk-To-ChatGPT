// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bot_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatBotScreenState {
  List<Message> get savedTextList => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get needScroll => throw _privateConstructorUsedError;
  Message? get currentAskMessage => throw _privateConstructorUsedError;
  List<Message> get askMessageList => throw _privateConstructorUsedError;
  List<Message> get openAiMessageList => throw _privateConstructorUsedError;
  int get currentAskAmount => throw _privateConstructorUsedError;
  int get speakingMessageAmount => throw _privateConstructorUsedError;
  int get maxLengthAskList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatBotScreenStateCopyWith<ChatBotScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotScreenStateCopyWith<$Res> {
  factory $ChatBotScreenStateCopyWith(
          ChatBotScreenState value, $Res Function(ChatBotScreenState) then) =
      _$ChatBotScreenStateCopyWithImpl<$Res, ChatBotScreenState>;
  @useResult
  $Res call(
      {List<Message> savedTextList,
      String? errorMessage,
      bool? needScroll,
      Message? currentAskMessage,
      List<Message> askMessageList,
      List<Message> openAiMessageList,
      int currentAskAmount,
      int speakingMessageAmount,
      int maxLengthAskList});
}

/// @nodoc
class _$ChatBotScreenStateCopyWithImpl<$Res, $Val extends ChatBotScreenState>
    implements $ChatBotScreenStateCopyWith<$Res> {
  _$ChatBotScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedTextList = null,
    Object? errorMessage = freezed,
    Object? needScroll = freezed,
    Object? currentAskMessage = freezed,
    Object? askMessageList = null,
    Object? openAiMessageList = null,
    Object? currentAskAmount = null,
    Object? speakingMessageAmount = null,
    Object? maxLengthAskList = null,
  }) {
    return _then(_value.copyWith(
      savedTextList: null == savedTextList
          ? _value.savedTextList
          : savedTextList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      needScroll: freezed == needScroll
          ? _value.needScroll
          : needScroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentAskMessage: freezed == currentAskMessage
          ? _value.currentAskMessage
          : currentAskMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
      askMessageList: null == askMessageList
          ? _value.askMessageList
          : askMessageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      openAiMessageList: null == openAiMessageList
          ? _value.openAiMessageList
          : openAiMessageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      currentAskAmount: null == currentAskAmount
          ? _value.currentAskAmount
          : currentAskAmount // ignore: cast_nullable_to_non_nullable
              as int,
      speakingMessageAmount: null == speakingMessageAmount
          ? _value.speakingMessageAmount
          : speakingMessageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      maxLengthAskList: null == maxLengthAskList
          ? _value.maxLengthAskList
          : maxLengthAskList // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ChatBotScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Message> savedTextList,
      String? errorMessage,
      bool? needScroll,
      Message? currentAskMessage,
      List<Message> askMessageList,
      List<Message> openAiMessageList,
      int currentAskAmount,
      int speakingMessageAmount,
      int maxLengthAskList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatBotScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedTextList = null,
    Object? errorMessage = freezed,
    Object? needScroll = freezed,
    Object? currentAskMessage = freezed,
    Object? askMessageList = null,
    Object? openAiMessageList = null,
    Object? currentAskAmount = null,
    Object? speakingMessageAmount = null,
    Object? maxLengthAskList = null,
  }) {
    return _then(_$InitialImpl(
      savedTextList: null == savedTextList
          ? _value._savedTextList
          : savedTextList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      needScroll: freezed == needScroll
          ? _value.needScroll
          : needScroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentAskMessage: freezed == currentAskMessage
          ? _value.currentAskMessage
          : currentAskMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
      askMessageList: null == askMessageList
          ? _value._askMessageList
          : askMessageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      openAiMessageList: null == openAiMessageList
          ? _value._openAiMessageList
          : openAiMessageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      currentAskAmount: null == currentAskAmount
          ? _value.currentAskAmount
          : currentAskAmount // ignore: cast_nullable_to_non_nullable
              as int,
      speakingMessageAmount: null == speakingMessageAmount
          ? _value.speakingMessageAmount
          : speakingMessageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      maxLengthAskList: null == maxLengthAskList
          ? _value.maxLengthAskList
          : maxLengthAskList // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Message> savedTextList = const [],
      this.errorMessage,
      this.needScroll = true,
      this.currentAskMessage,
      final List<Message> askMessageList = const [],
      final List<Message> openAiMessageList = const [],
      this.currentAskAmount = 0,
      this.speakingMessageAmount = 0,
      this.maxLengthAskList = 5})
      : _savedTextList = savedTextList,
        _askMessageList = askMessageList,
        _openAiMessageList = openAiMessageList;

  final List<Message> _savedTextList;
  @override
  @JsonKey()
  List<Message> get savedTextList {
    if (_savedTextList is EqualUnmodifiableListView) return _savedTextList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedTextList);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool? needScroll;
  @override
  final Message? currentAskMessage;
  final List<Message> _askMessageList;
  @override
  @JsonKey()
  List<Message> get askMessageList {
    if (_askMessageList is EqualUnmodifiableListView) return _askMessageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_askMessageList);
  }

  final List<Message> _openAiMessageList;
  @override
  @JsonKey()
  List<Message> get openAiMessageList {
    if (_openAiMessageList is EqualUnmodifiableListView)
      return _openAiMessageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openAiMessageList);
  }

  @override
  @JsonKey()
  final int currentAskAmount;
  @override
  @JsonKey()
  final int speakingMessageAmount;
  @override
  @JsonKey()
  final int maxLengthAskList;

  @override
  String toString() {
    return 'ChatBotScreenState.initial(savedTextList: $savedTextList, errorMessage: $errorMessage, needScroll: $needScroll, currentAskMessage: $currentAskMessage, askMessageList: $askMessageList, openAiMessageList: $openAiMessageList, currentAskAmount: $currentAskAmount, speakingMessageAmount: $speakingMessageAmount, maxLengthAskList: $maxLengthAskList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._savedTextList, _savedTextList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.needScroll, needScroll) ||
                other.needScroll == needScroll) &&
            (identical(other.currentAskMessage, currentAskMessage) ||
                other.currentAskMessage == currentAskMessage) &&
            const DeepCollectionEquality()
                .equals(other._askMessageList, _askMessageList) &&
            const DeepCollectionEquality()
                .equals(other._openAiMessageList, _openAiMessageList) &&
            (identical(other.currentAskAmount, currentAskAmount) ||
                other.currentAskAmount == currentAskAmount) &&
            (identical(other.speakingMessageAmount, speakingMessageAmount) ||
                other.speakingMessageAmount == speakingMessageAmount) &&
            (identical(other.maxLengthAskList, maxLengthAskList) ||
                other.maxLengthAskList == maxLengthAskList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_savedTextList),
      errorMessage,
      needScroll,
      currentAskMessage,
      const DeepCollectionEquality().hash(_askMessageList),
      const DeepCollectionEquality().hash(_openAiMessageList),
      currentAskAmount,
      speakingMessageAmount,
      maxLengthAskList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)
        initial,
  }) {
    return initial(
        savedTextList,
        errorMessage,
        needScroll,
        currentAskMessage,
        askMessageList,
        openAiMessageList,
        currentAskAmount,
        speakingMessageAmount,
        maxLengthAskList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)?
        initial,
  }) {
    return initial?.call(
        savedTextList,
        errorMessage,
        needScroll,
        currentAskMessage,
        askMessageList,
        openAiMessageList,
        currentAskAmount,
        speakingMessageAmount,
        maxLengthAskList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Message> savedTextList,
            String? errorMessage,
            bool? needScroll,
            Message? currentAskMessage,
            List<Message> askMessageList,
            List<Message> openAiMessageList,
            int currentAskAmount,
            int speakingMessageAmount,
            int maxLengthAskList)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          savedTextList,
          errorMessage,
          needScroll,
          currentAskMessage,
          askMessageList,
          openAiMessageList,
          currentAskAmount,
          speakingMessageAmount,
          maxLengthAskList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatBotScreenState {
  const factory _Initial(
      {final List<Message> savedTextList,
      final String? errorMessage,
      final bool? needScroll,
      final Message? currentAskMessage,
      final List<Message> askMessageList,
      final List<Message> openAiMessageList,
      final int currentAskAmount,
      final int speakingMessageAmount,
      final int maxLengthAskList}) = _$InitialImpl;

  @override
  List<Message> get savedTextList;
  @override
  String? get errorMessage;
  @override
  bool? get needScroll;
  @override
  Message? get currentAskMessage;
  @override
  List<Message> get askMessageList;
  @override
  List<Message> get openAiMessageList;
  @override
  int get currentAskAmount;
  @override
  int get speakingMessageAmount;
  @override
  int get maxLengthAskList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
