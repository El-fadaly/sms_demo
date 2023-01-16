import 'package:flutter/material.dart';
import 'package:sms_demo/app/view/resources/strings_manager.dart';
import 'package:sms_demo/features/sms/presentation/views/sms_search_view.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case SmsView.id:
        return MaterialPageRoute(
          builder: (_) => SmsView(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
