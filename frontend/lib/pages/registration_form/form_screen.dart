import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sync_fit/pages/registration_form/widgets/form_widget.dart';
import 'package:sync_fit/utils/app_colors.dart';

final userEmailControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final mobileNumberControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final doctorEmailControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final doctorNameControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

class FormScreen extends ConsumerWidget {
  static const routename = '/form-screen';
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEmailController = ref.watch(userEmailControllerProvider);
    final mobileNumberController = ref.watch(mobileNumberControllerProvider);
    final doctorEmailController = ref.watch(doctorEmailControllerProvider);
    final doctorNameController = ref.watch(doctorNameControllerProvider);
    return Scaffold(
      body: LayoutBuilder(builder: (context, size) {
        return GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        'Doctor Details',
                        style: TextStyle(
                          fontFamily: 'SF-Pro Display',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      AutoSizeText(
                        'Just one more step to complete the registration. Tese details are requrired to deliver the regular health report to your medical server',
                        style: TextStyle(
                          fontFamily: 'SF-Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 30),
                      FormWidget(
                        label: 'Your email address',
                        controller: userEmailController,
                        type: TextInputType.emailAddress,
                      ),
                      FormWidget(
                          label: 'Mobile number',
                          controller: mobileNumberController,
                          type: TextInputType.number),
                      FormWidget(
                        label: 'Doctor Name',
                        controller: doctorNameController,
                      ),
                      FormWidget(
                        label: 'Doctor Email Address',
                        controller: doctorEmailController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          textTheme: ButtonTextTheme.primary,
                          minWidth: size.maxWidth / 2,
                          padding: const EdgeInsets.all(18),
                          color: AppColors.syncGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: AppColors.syncGreen),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
