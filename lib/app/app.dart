import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_demo/app/view/routing/routes_manager.dart';
import 'package:sms_demo/features/sms/presentation/state/sms_state.dart';
import 'package:sms_demo/features/sms/presentation/views/sms_search_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SmsState(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: SmsView.id,
      ),
    );
  }
}
