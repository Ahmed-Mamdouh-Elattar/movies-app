import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final _phoneFormKey = GlobalKey<FormState>();
  PhoneNumber? _phoneNumber;

  void _sendSms() async {
    if (_phoneFormKey.currentState!.validate()) {
      _phoneFormKey.currentState!.save();
      if (_phoneNumber != null) {
        log(_phoneNumber!.phoneNumber!);
        await context.read<PhoneAuthCubit>().sendCode(
          _phoneNumber!.phoneNumber!,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _phoneFormKey,
      child: Column(
        children: [
          InternationalPhoneNumberInput(
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
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _sendSms, child: const Text('Send SMS')),
        ],
      ),
    );
  }
}
