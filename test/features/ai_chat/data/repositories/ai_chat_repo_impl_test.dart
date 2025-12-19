import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/data/datasources/ai_chat_source.dart';
import 'package:movies_app/features/ai_chat/data/repositories/ai_chat_repo_impl.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';

import 'ai_chat_repo_impl_test.mocks.dart';

@GenerateMocks([AiChatSource])
void main() {
  late AiChatRepoImpl repo;
  late MockAiChatSource source;

  setUp(() {
    source = MockAiChatSource();
    repo = AiChatRepoImpl(source);
  });

  group("AiChatRepoImpl", () {
    test(
      "should return a ResponseResult<ChatEntity> when getAIChatResponse is called",
      () async {
        //arrange
        final query = "query";
        final response = "response";
        final chatEntity = ChatEntity(message: response, isUser: false);
        when(source.getAIChatResponse(query)).thenAnswer((_) async => response);

        //act
        final result = await repo.getAIChatResponse(query);

        //assert
        expect(
          result,
          isA<ResponseResult<ChatEntity>>().having(
            (result) => result.when(
              success: (data) => data.message,
              failure: (failure) => failure.errMessage,
            ),
            "check data",
            chatEntity.message,
          ),
        );
      },
    );
    test(
      "should return a ResponseResult<ChatEntity> when getAIChatResponse is failed",
      () async {
        //arrange
        final query = "query";
        when(
          source.getAIChatResponse(query),
        ).thenAnswer((_) async => throw Exception("error"));

        //act
        final result = await repo.getAIChatResponse(query);

        //assert
        expect(
          result,

          isA<ResponseResult<ChatEntity>>().having(
            (result) => result.when(
              success: (data) => data.message,
              failure: (failure) => failure.errMessage,
            ),
            "check data",
            "Exception: error",
          ),
        );
      },
    );
  });
}
