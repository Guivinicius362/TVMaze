import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

void initCoreDependencies() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.tvmaze.com',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  _getIt.registerFactory<Dio>(() => dio);
}
