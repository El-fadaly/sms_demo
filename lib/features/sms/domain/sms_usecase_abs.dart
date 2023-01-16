import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

import '../data/models/sms_model.dart';

abstract class SmsUseCaseAbs{
  Future<List<SmsModel>> getSms();
  List<SmsModel> searchSenderName({required String name});
  SmsModel filterSms(SmsMessage msg);
}