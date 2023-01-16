import 'package:flutter/material.dart';
import 'package:sms_demo/app/view/resources/styles/color_manager.dart';
import 'package:sms_demo/app/view/resources/values_manager.dart';
import 'package:sms_demo/features/sms/presentation/widgets/custom_text_widget.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({Key? key, required this.total}) : super(key: key);

  final String total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppPadding.p10,
        AppPadding.p10,
        AppPadding.p10,
        AppPadding.p5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: "Total",
            fontColor: ColorManager.black,
          ),
          CustomText(
            text: total + ' AED',
            fontColor: ColorManager.black,
          ),
        ],
      ),
    );
  }
}
