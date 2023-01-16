import 'dart:async';

import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:sms_demo/features/sms/data/repository/sms_repository_abs.dart';

class SmsRepo extends SmsRepoAbs {
  @override
  Future<dynamic> getSms() async {
    final query = SmsQuery();

    // final permission = await Permission.sms.status;
    //
    // if (permission.isGranted) {
    return query.querySms(
      kinds: [SmsQueryKind.inbox],
    );
    // } else {
    //   await getSms();
    // }
  }
}
