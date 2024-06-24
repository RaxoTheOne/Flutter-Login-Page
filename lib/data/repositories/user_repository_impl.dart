import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> authenticate(String email, String password) async {
    UserModel userModel = await remoteDataSource.authenticate(email, password);
    return userModel;
  }
}
