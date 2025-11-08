import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';

abstract class AiChatRepo {
  Future<ResponseResult<ChatEntity>> getAIChatResponse(String query);
}
