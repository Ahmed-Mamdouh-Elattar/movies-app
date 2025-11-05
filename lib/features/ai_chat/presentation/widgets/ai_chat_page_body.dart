import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';

class AiChatPageBody extends StatelessWidget {
  const AiChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: const Text("Movies Chat Bot")),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send, color: AppColor.blue),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
