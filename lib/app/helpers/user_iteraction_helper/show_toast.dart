import 'package:flutter/material.dart';
import 'package:sms_demo/features/sms/presentation/widgets/custom_text_widget.dart';

class UserInteraction {
  static void showSnackBar(
      {required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        content: CustomText(text: text),
        backgroundColor: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
