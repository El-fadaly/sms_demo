import 'package:get_it/get_it.dart';


// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
GetIt serviceLocator = GetIt.instance;

abstract class ServiceLocator {
  void init();
}