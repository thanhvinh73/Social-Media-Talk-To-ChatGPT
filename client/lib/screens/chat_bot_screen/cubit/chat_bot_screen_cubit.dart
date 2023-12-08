import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../models/message/message.dart';

part 'chat_bot_screen_state.dart';
part 'chat_bot_screen_cubit.freezed.dart';

class ChatBotScreenCubit extends Cubit<ChatBotScreenState> {
  ChatBotScreenCubit() : super(const ChatBotScreenState.initial()) {
    emit(state.copyWith(needScroll: true));
  }

  void updateNeedScroll(bool scroll) =>
      emit(state.copyWith(needScroll: scroll));

  Message addNewMessage(bool isSentByMe) {
    List<Message> list = [...state.savedTextList];
    Message result = Message(
        id: const Uuid().v4(),
        message: "",
        isSentByMe: isSentByMe,
        isGenerating: !isSentByMe,
        isDone: false);

    if (isSentByMe) {
      list.add(result);
    } else {
      int index = list.indexWhere((element) =>
          element.id!.compareTo(state.currentAskMessage!.id!) == 0);
      list.insert(index + 1, result);
    }

    emit(state.copyWith(needScroll: true, savedTextList: list));
    return result;
  }

  Message? updateNewMessage(Message message) {
    List<Message> list = [...state.savedTextList];
    final index = list.indexWhere((element) => element.id == message.id);
    if (index >= 0) {
      if (message.message == null || message.message!.isEmpty) {
        list.removeAt(index);
        emit(state.copyWith(
          needScroll: true,
          savedTextList: list,
        ));
      } else {
        list[index] = message;
        if (message.isSentByMe) {
          emit(state.copyWith(currentAskMessage: message));
        }
        emit(state.copyWith(
          needScroll: true,
          savedTextList: list,
        ));
        return message;
      }
      return null;
    } else {
      return null;
    }
  }

  void updateAskMessageList({Message? message, required bool isAdd}) {
    debugPrint("UPDATE ASK MESSAGE LIST WITH ${isAdd ? "ADD" : "REMOVE"}");

    List<Message> list = [...state.askMessageList];
    if (isAdd && message != null && list.length < state.maxLengthAskList) {
      list.add(message);
    } else if (!isAdd && list.isNotEmpty) {
      emit(state.copyWith(currentAskMessage: state.askMessageList.first));
      list.removeAt(0);
    }
    debugPrint("--- Check current ask amount: ${list.length}");
    emit(state.copyWith(askMessageList: list, currentAskAmount: list.length));
  }

  void updateOpenAiMessageList({Message? message, required bool isAdd}) {
    debugPrint("UPDATE OPEN AI MESSAGE LIST WITH ${isAdd ? "ADD" : "REMOVE"}");

    List<Message> list = [...state.openAiMessageList];
    if (isAdd && message != null) {
      list.add(message);
    } else if (!isAdd && list.isNotEmpty) {
      list.removeAt(0);
    }
    debugPrint("--- Check current speaking amount: ${list.length}");
    emit(state.copyWith(openAiMessageList: list));
  }

  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
}
