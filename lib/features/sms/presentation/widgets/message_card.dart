import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sms_demo/app/view/resources/constants_manager.dart';
import 'package:sms_demo/app/view/resources/styles/color_manager.dart';
import 'package:sms_demo/app/view/resources/values_manager.dart';
import 'package:sms_demo/features/sms/data/models/sms_model.dart';
import 'package:sms_demo/features/sms/presentation/widgets/custom_text_widget.dart';
import 'package:sms_demo/features/sms/presentation/widgets/styled_spacers.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
    required this.onTapped,
  });

  final SmsModel message;
  final Function() onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        // curve: Curves.linear,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(AppPadding.p10),
        margin: const EdgeInsets.all(AppMargin.m5),
        decoration: BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.r15),
          ),
        ),
        // duration: const Duration(milliseconds: 3000),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: message.smsSender,
                ),
                CustomText(
                  text: DateFormat(AppConstants.dateFormat)
                      .format(message.dateTime),
                ),
              ],
            ),
            VSpace.sm,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '${message.moneyAmount}'),
                CustomText(
                    text: "${message.isSelected ? 'hide' : 'show'} message"),
              ],
            ),
            VSpace.sm,
            if (message.isSelected)
              Container(
                padding: const EdgeInsets.all(AppPadding.p10),
                margin: const EdgeInsets.all(AppMargin.m5),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppBorderRadius.r15),
                  ),
                ),
                child: CustomText(
                  text: message.body,
                  maxLines: AppConstants.maxLinesCount,
                  fontWeight: FontWeight.normal,
                  fontColor: ColorManager.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
