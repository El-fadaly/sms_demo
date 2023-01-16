import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:sms_demo/app/dependencies/service_locator.dart';
import 'package:sms_demo/app/helpers/type_parser_helper/fetching_doubles.dart';
import 'package:sms_demo/app/helpers/type_parser_helper/list_parser.dart';
import 'package:sms_demo/features/sms/data/models/sms_model.dart';
import 'package:sms_demo/features/sms/data/repository/sms_repository_abs.dart';
import 'package:sms_demo/features/sms/domain/sms_usecase_abs.dart';

class SmsUsecase extends SmsUseCaseAbs {
  final SmsRepoAbs _smsRepo = serviceLocator<SmsRepoAbs>();
  List<SmsModel> smsModelList = [];

  @override
  Future<List<SmsModel>> getSms() async {
    var smsListDummy = List<SmsMessage>.empty();

    final response = await _smsRepo.getSms();

    if (response is List) {
      smsListDummy = response as List<SmsMessage>
        ..forEach((msg) {
          if (msg.body != null) {
            final smsModel = filterSms(msg);
            smsModelList.add(smsModel);
          }
        });
    }
    return smsModelList;
  }

  @override
  List<SmsModel> searchSenderName({required String name}) => smsModelList
      .where((msg) => msg.smsSender.toLowerCase().contains(name.toLowerCase()))
      .toList();

  @override
  SmsModel filterSms(SmsMessage msg) {
    /// Testing case: "Mac \n 28.0 AED \n 14/5/2022 \n balance is : 1510.0 AED \n balance:1510.0 AED \n balance: 1510.0 AED"
    var currentMsgPrice = 0.0;
    final msgStringListParsed = ListParser.parse(msg.body!);
    final pricesMap = FetchingDoubles.fetch(msgStringListParsed);
    if (pricesMap.isNotEmpty) {
      pricesMap.forEach(
        (key, value) {
          /// this IF is a brute force solution to check if  the number  is  the  transaction amount  or  the balance
          if ((key > 1 &&
                  (msgStringListParsed[key - 1].contains('balance') ||
                      (msgStringListParsed[key - 1].contains('رصيد')))) ||
              (key > 3 &&
                  (msgStringListParsed[key - 2].contains('balance') ||
                      (msgStringListParsed[key - 2].contains('رصيد')))) ||
              (key > 3 &&
                  (msgStringListParsed[key - 3].contains('balance') ||
                      (msgStringListParsed[key - 3].contains('رصيد'))))) {
            //..do Nothing as this number is a balance not the withdrew one;
          } else if ((key > 1 && key != msgStringListParsed.length - 1) &&
              (msgStringListParsed[key - 1].contains('EGP') ||
                  msgStringListParsed[key - 1].contains('درهم') ||
                  msgStringListParsed[key + 1].contains('ج') ||
                  msgStringListParsed[key + 1].contains('جنيه') ||
                  msgStringListParsed[key + 1].contains('AED'))) {
            currentMsgPrice = value;
            return;
          }
        },
      );
    }

    return SmsModel(
      smsSender: msg.address ?? 'Unkown',
      moneyAmount: currentMsgPrice,
      dateTime: msg.dateSent ?? DateTime.now(),
      body: msg.body ?? '',
      isSelected: false,
    );
  }
}
