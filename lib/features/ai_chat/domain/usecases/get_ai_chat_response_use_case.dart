import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/domain/repositories/ai_chat_repo.dart';

class GetAiChatResponseUseCase {
  final AiChatRepo _aiChatRepo;

  GetAiChatResponseUseCase(this._aiChatRepo);

  Future<ResponseResult<ChatEntity>> call(String query) async {
    return await _aiChatRepo.getAIChatResponse(query);
  }
}
