import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _formKey = GlobalKey<FormState>();
  late final PhoneNumber _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// params
            Form(
              key: _formKey,
              child: InternationalPhoneNumberInput(
                onSaved: (value) {
                  _phoneNumber = value;
                },
                onInputChanged: (value) {},
                selectorTextStyle: const TextStyle(color: AppColor.goldOrange),
                textStyle: const TextStyle(color: Colors.white),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                initialValue: PhoneNumber(dialCode: "+20", isoCode: "EG"),
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,

                  useEmoji: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  log(_phoneNumber.phoneNumber!);
                  await context.read<PhoneAuthCubit>().sendCode(
                    _phoneNumber.phoneNumber!,
                  );
                  if (context.mounted) {
                    context.push(PageName.otpVerification);
                  }
                }
              },
              child: const Text('Send  SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
