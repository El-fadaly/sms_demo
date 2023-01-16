import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_demo/app/view/resources/strings_manager.dart';
import 'package:sms_demo/app/view/resources/styles/color_manager.dart';
import 'package:sms_demo/app/view/resources/values_manager.dart';
import 'package:sms_demo/features/sms/data/models/sms_model.dart';
import 'package:sms_demo/features/sms/presentation/state/sms_state.dart';
import 'package:sms_demo/features/sms/presentation/widgets/app_header.dart';
import 'package:sms_demo/features/sms/presentation/widgets/custom_text_widget.dart';
import 'package:sms_demo/features/sms/presentation/widgets/message_card.dart';
import 'package:sms_demo/features/sms/presentation/widgets/search_text_field.dart';
import 'package:sms_demo/features/sms/presentation/widgets/styled_spacers.dart';
import 'package:sms_demo/features/sms/presentation/widgets/total_amount_widget.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class SmsView extends StatefulWidget {
  const SmsView({Key? key}) : super(key: key);

  static const String id = 'SmsView';
  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  @override
  void initState() {
    super.initState();
    context.read<SmsState>().getSms(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: context.watch<SmsState>().isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorManager.grey,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  children: [
                    AppHeader(),
                    VSpace.lg,
                    SearchTextField(),
                    VSpace.lg,
                    Expanded(
                      child: context.watch<SmsState>().smsMsgs.isEmpty
                          ? const Center(
                              child: CustomText(
                                text: AppStrings.noSmsToShow,
                              ),
                            )
                          : StickyGroupedListView<SmsModel, DateTime>(
                              order: StickyGroupedListOrder.DESC,
                              elements: context.watch<SmsState>().smsMsgs,
                              groupBy: (SmsModel sms) => DateTime(
                                sms.dateTime.year,
                                sms.dateTime.month,
                                sms.dateTime.day,
                              ),
                              groupSeparatorBuilder: (sms) => SizedBox(
                                height: AppSize.s40,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorManager.grey,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(AppBorderRadius.r20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p8),
                                      child: CustomText(
                                        text:
                                            '${sms.dateTime.day} /  ${sms.dateTime.month}  / ${sms.dateTime.year}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              itemBuilder:
                                  (BuildContext context, SmsModel msg) {
                                return MessageCard(
                                  message: msg,
                                  onTapped: () => context
                                      .read<SmsState>()
                                      .onMessageTapped(sms: msg),
                                );
                              },
                            ),
                    ),
                    TotalAmountWidget(
                      total:
                          context.read<SmsState>().totalWithdrawal.toString(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
