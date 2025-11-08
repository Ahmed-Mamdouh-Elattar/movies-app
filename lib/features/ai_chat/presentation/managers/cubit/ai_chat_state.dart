part of 'ai_chat_cubit.dart';

@freezed
abstract class AiChatState with _$AiChatState {
  const factory AiChatState.initial() = Initial;
  const factory AiChatState.loading({required List<ChatEntity> chatMessages}) =
      Loading;
  const factory AiChatState.loaded({required List<ChatEntity> chatMessages}) =
      Loaded;
  const factory AiChatState.failure({
    required String message,
    required List<ChatEntity> chatMessages,
  }) = Failure;
}
