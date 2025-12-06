import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';
import 'package:movies_app/features/ai_chat/presentation/pages/ai_chat_page.dart';

final aiChatRoute = GoRoute(
  path: PageName.aiChat,
  builder: (context, state) => BlocProvider(
    create: (context) => getIt.get<AiChatCubit>(),
    child: const AiChatPage(),
  ),
);
