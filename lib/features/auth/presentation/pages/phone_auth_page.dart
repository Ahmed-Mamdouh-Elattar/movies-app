import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _formKey = GlobalKey<FormState>();

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
              child: PhoneFormField(
                initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: ""),
                style: const TextStyle(color: Colors.white),

                validator: PhoneValidator.compose([
                  PhoneValidator.required(context),
                  PhoneValidator.validMobile(context),
                ]),
                countrySelectorNavigator: const CountrySelectorNavigator.page(
                  titleStyle: TextStyle(color: Colors.white),
                  subtitleStyle: TextStyle(color: Colors.white60),
                ),

                enabled: true,
                isCountrySelectionEnabled: true,
                isCountryButtonPersistent: true,
                countryButtonStyle: const CountryButtonStyle(
                  showDialCode: true,
                  textStyle: TextStyle(color: AppColor.blue),
                  dropdownIconColor: AppColor.goldOrange,

                  showFlag: true,
                  flagSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.push(PageName.otpVerification);
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
