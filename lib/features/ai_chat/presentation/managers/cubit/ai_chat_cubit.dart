import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/domain/usecases/get_ai_chat_response_use_case.dart';

part 'ai_chat_state.dart';
part 'ai_chat_cubit.freezed.dart';

class AiChatCubit extends Cubit<AiChatState> {
  AiChatCubit(this._getAiChatResponseUseCase)
    : super(const AiChatState.initial());

  final GetAiChatResponseUseCase _getAiChatResponseUseCase;
  final List<ChatEntity> _chatMessages = [];
  Future<void> getAIChatResponse(ChatEntity chatEntity) async {
    if (chatEntity.message.isEmpty) {
      return;
    }
    _chatMessages.add(chatEntity);
    emit(AiChatState.loaded(chatMessages: [..._chatMessages]));
    emit(AiChatState.loading(chatMessages: [..._chatMessages]));
    final response = await _getAiChatResponseUseCase.call(chatEntity.message);
    response.when(
      success: (message) {
        _chatMessages.add(message);
        emit(AiChatState.loaded(chatMessages: [..._chatMessages]));
      },
      failure: (failure) {
        emit(
          AiChatState.failure(
            message: failure.errMessage,
            chatMessages: [..._chatMessages],
          ),
        );
      },
    );
  }
}
