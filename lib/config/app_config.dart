import '../data/repositories/user_repository_impl.dart';
import '../data/data_sources/remote_data_source.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/use_cases/login_use_case.dart';

class AppConfig {
  final LoginUseCase loginUseCase;

  AppConfig({required this.loginUseCase});

  static Future<AppConfig> create() async {
    // Initialization logic if needed
    RemoteDataSource remoteDataSource = RemoteDataSourceImpl();
    UserRepository userRepository =
        UserRepositoryImpl(remoteDataSource: remoteDataSource);
    LoginUseCase loginUseCase = LoginUseCase(userRepository);

    return AppConfig(loginUseCase: loginUseCase);
  }

  static AppConfig? _instance;

  static Future<AppConfig> getInstance() async {
    if (_instance == null) {
      _instance = await create();
    }
    return _instance!;
  }
}
