import 'package:flutter/material.dart';
import 'package:sms_demo/app/view/resources/strings_manager.dart';
import 'package:sms_demo/app/view/resources/styles/color_manager.dart';
import 'package:sms_demo/features/sms/presentation/widgets/custom_text_widget.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: AppStrings.appHeaderTitle,
        fontSize: 20,
        fontColor: ColorManager.grey,
      ),
    );
  }
}
