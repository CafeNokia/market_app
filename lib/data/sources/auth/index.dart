import 'package:market_app/data/models/auth/index.dart';

abstract class ACAuthService {
  Future<void> signup(CCreateUserReq createUserReq);
  Future<void> signip();
}

class CAuthServiceImpl extends ACAuthService {
  @override
  Future<void> signup(CCreateUserReq createUserReq) {
    throw UnimplementedError();
  }

  @override
  Future<void> signin() {
    throw UnimplementedError();
  }
}