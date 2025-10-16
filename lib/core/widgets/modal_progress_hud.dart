import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';

class ModalProgressHud extends StatelessWidget {
  const ModalProgressHud({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(10),
        ),

        child: const CircularProgressIndicator(color: AppColor.blue),
      ),
    );
  }
}
