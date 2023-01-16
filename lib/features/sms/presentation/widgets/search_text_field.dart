import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_demo/app/view/resources/strings_manager.dart';
import 'package:sms_demo/app/view/resources/values_manager.dart';
import 'package:sms_demo/features/sms/presentation/state/sms_state.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String search) {
        context.read<SmsState>().searchSms(name: search);
      },
      controller: context.read<SmsState>().controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: context.read<SmsState>().onRemoveTapped,
          icon: Icon(Icons.close),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.r15),
          ),
        ),
        hintText: AppStrings.searchBySender,
      ),
    );
  }
}
