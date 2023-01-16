import 'package:permission_handler/permission_handler.dart';

class CheckSmsPermissionHelper {
  static Future<bool> checkSMSPermission() async {
    final permission = await Permission.sms.status;

    if (permission.isGranted) {
      return true;
    } else if (permission.isPermanentlyDenied) {
      return false;
    } else {
      return Permission.sms.request().isGranted;
    }
  }
}
