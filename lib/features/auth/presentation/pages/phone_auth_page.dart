import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/utils/app_toast.dart';
import 'package:movies_app/core/widgets/modal_progress_hud.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/widgets/otp_input.dart';
import 'package:movies_app/features/auth/presentation/widgets/phone_number_input.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is Success) {
              context.go(PageName.home);
            }
            if (state is Failure) {
              showAppToast(context, state.message);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                if (state is Loading) const ModalProgressHud(),
                const SingleChildScrollView(
                  child: Column(
                    children: [
                      PhoneNumberInput(),
                      SizedBox(height: 32),
                      OtpInput(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
