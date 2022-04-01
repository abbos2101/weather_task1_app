import 'package:get_it/get_it.dart';
import 'package:weather_task1_app/data/api/api_base.dart';
import 'package:weather_task1_app/data/api/task_api.dart';
import 'package:weather_task1_app/data/hive/hive_base.dart';
import 'package:weather_task1_app/data/hive/task_hive.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  di.registerSingleton(ApiBase());
  di.registerFactory(() => TaskApi(di.get<ApiBase>().dio));
  di.registerSingleton(HiveBase());
  await di.get<HiveBase>().ensureInitialized();
  di.registerFactory(() => TaskHive(di.get<HiveBase>().taskBox));
}
