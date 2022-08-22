import 'package:dio/dio.dart';
import 'package:pagination/core/models/user_model.dart';

import '../models/filter.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(
    this._dio,
  );

  Future<List<UserModel>> getUsers(PaginationFilter filter) {
    return _dio.get(
      '/users',
      queryParameters: {
        'page': filter.page,
        'limit': filter.limit,
      },
    ).then(
      (value) => value.data
          ?.map<UserModel>(
            (u) => UserModel.fromJson(u),
          )
          ?.toList(),
    );
  }
}
