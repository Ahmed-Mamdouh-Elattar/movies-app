import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/ai_chat/presentation/pages/ai_chat_page.dart';

final aiChatRoute = GoRoute(
  path: PageName.aiChat,
  builder: (context, state) => const AiChatPage(),
);
