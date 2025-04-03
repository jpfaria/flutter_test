import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthBloc extends HydratedBloc<void, bool> {
  AuthBloc() : super(false);

  void login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(true);
    }
  }

  void logout() {
    emit(false);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isLoggedIn'] as bool?;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'isLoggedIn': state};
  }
}