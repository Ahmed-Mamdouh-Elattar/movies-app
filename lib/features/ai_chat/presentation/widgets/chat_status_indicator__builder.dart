import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/thinking_indicator.dart';

class ChatStatusIndicatorBuilder extends StatelessWidget {
  const ChatStatusIndicatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatCubit, AiChatState>(
      builder: (context, state) {
        return state.whenOrNull(
              loading: (chatMessages) {
                return const ThinkingIndicator();
              },
              failure: (message, chatMessages) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(message),
                  ),
                );
              },
            ) ??
            const SizedBox();
      },
    );
  }
}
