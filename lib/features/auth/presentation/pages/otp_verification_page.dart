import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/utils/app_toast.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController? otpFieldController = TextEditingController();
  @override
  void dispose() {
    otpFieldController?.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColor.goldOrange,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
            listener: (context, state) {
              if (state is Failure) {
                showAppToast(context, state.message);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    controller: otpFieldController,
                    defaultPinTheme: defaultPinTheme,

                    showCursor: true,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () async {
                      log(state.toString());
                      log(otpFieldController!.text.length.toString());
                      if (state is Success &&
                          otpFieldController!.text.length == 6) {
                        await context.read<PhoneAuthCubit>().verifyCode(
                          state.verificationId,
                          otpFieldController!.text,
                        );
                      }
                    },
                    child: const Text('Verify OTP'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
