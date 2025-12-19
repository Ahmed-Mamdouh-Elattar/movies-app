import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/domain/usecases/get_ai_chat_response_use_case.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';

import 'ai_chat_cubit_test.mocks.dart';

@GenerateMocks([GetAiChatResponseUseCase])
void main() {
  late GetAiChatResponseUseCase mockGetAiChatResponseUseCase;
  late AiChatCubit aiChatCubit;

  setUp(() {
    mockGetAiChatResponseUseCase = MockGetAiChatResponseUseCase();
    aiChatCubit = AiChatCubit(mockGetAiChatResponseUseCase);
  });

  tearDown(() {
    aiChatCubit.close();
  });
  group("AiChatCubit", () {
    test("initial state is AiChatState.initial()", () {
      expect(aiChatCubit.state, const AiChatState.initial());
    });
    test(
      "should emit [loaded,loading,loaded] when getAIChatResponse is called successfully",
      () async {
        //arrange

        final chatEntityUser = ChatEntity(message: "Hello", isUser: true);
        final chatEntityAi = ChatEntity(message: "Hello", isUser: false);
        final expectedStates = [
          AiChatState.loaded(chatMessages: [chatEntityUser]),
          AiChatState.loading(chatMessages: [chatEntityUser]),
          AiChatState.loaded(chatMessages: [chatEntityUser, chatEntityAi]),
        ];
        provideDummy<ResponseResult<ChatEntity>>(
          ResponseResult.success(chatEntityAi),
        );
        when(
          mockGetAiChatResponseUseCase.call(chatEntityUser.message),
        ).thenAnswer((_) async => ResponseResult.success(chatEntityAi));
        //assert
        expectLater(aiChatCubit.stream, emitsInOrder(expectedStates));
        //act
        await aiChatCubit.getAIChatResponse(chatEntityUser);
      },
    );
    test(
      "should emit [loaded,loading,failure] when getAIChatResponse is called with failure",
      () async {
        //arrange
        const tFailure = ResponseResult<ChatEntity>.failure(
          Failures(errMessage: ""),
        );
        final chatEntityUser = ChatEntity(message: "Hello", isUser: true);
        final expectedStates = [
          AiChatState.loaded(chatMessages: [chatEntityUser]),
          AiChatState.loading(chatMessages: [chatEntityUser]),
          AiChatState.failure(message: "", chatMessages: [chatEntityUser]),
        ];
        provideDummy<ResponseResult<ChatEntity>>(tFailure);
        when(
          mockGetAiChatResponseUseCase.call(chatEntityUser.message),
        ).thenAnswer((_) async => tFailure);
        //assert
        expectLater(aiChatCubit.stream, emitsInOrder(expectedStates));
        //act
        await aiChatCubit.getAIChatResponse(chatEntityUser);
      },
    );
  });
}
