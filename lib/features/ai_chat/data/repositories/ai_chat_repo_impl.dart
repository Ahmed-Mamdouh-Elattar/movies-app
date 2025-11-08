import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/data/datasources/ai_chat_source.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/domain/repositories/ai_chat_repo.dart';

class AiChatRepoImpl extends AiChatRepo {
  final AiChatSource _source;

  AiChatRepoImpl(this._source);

  @override
  Future<ResponseResult<ChatEntity>> getAIChatResponse(String query) async {
    try {
      final response = await _source.getAIChatResponse(query);
      return ResponseResult.success(
        ChatEntity(message: response, isUser: false),
      );
    } catch (e) {
      return ResponseResult.failure(Failures(errMessage: e.toString()));
    }
  }
}
