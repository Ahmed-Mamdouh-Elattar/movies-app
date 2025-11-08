import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/chat_list_view.dart';

class ChatListBuilder extends StatelessWidget {
  const ChatListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatCubit, AiChatState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const Center(child: Text("Start Chatting With AI Chat Bot"));
          },
          loaded: (chatMessages) {
            if (chatMessages.isEmpty) {
              return const Center(
                child: Text("Start Chatting With AI Chat Bot"),
              );
            } else {
              return ChatListView(chatMessages: chatMessages);
            }
          },
          failure: (message, chatMessages) {
            return ChatListView(chatMessages: chatMessages);
          },
          loading: (chatMessages) {
            return ChatListView(chatMessages: chatMessages);
          },
        );
      },
    );
  }
}
