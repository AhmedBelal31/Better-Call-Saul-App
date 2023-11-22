import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      ApiService(),
    ),
  );
}
