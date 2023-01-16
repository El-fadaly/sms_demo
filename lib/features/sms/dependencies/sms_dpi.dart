import 'package:sms_demo/app/dependencies/service_locator.dart';
import 'package:sms_demo/features/sms/data/repository/sms_repository.dart';
import 'package:sms_demo/features/sms/data/repository/sms_repository_abs.dart';
import 'package:sms_demo/features/sms/domain/sms_usecase.dart';
import 'package:sms_demo/features/sms/domain/sms_usecase_abs.dart';

class SmsDpi extends ServiceLocator {
  SmsDpi() {
    init();
  }

  @override
  void init() {
    serviceLocator.registerLazySingleton<SmsRepoAbs>(() => SmsRepo());
    serviceLocator.registerLazySingleton<SmsUseCaseAbs>(() => SmsUsecase());
  }
}
