import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/signup_models/models.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/signup_repo/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });

    on<SignUpRequestEvent>((event, emit) async {
      emit(SignUpEventCalled());
      try {
        final reqbody = await SignUpRepo().signupReq(event.user);
        addValuesToUserModel(reqbody);
        if (reqbody != 'You are already registered') {
          if (reqbody["data"]["role"] == '2') {
            emit(SignupSuccesState(user: false));
          } else {
            emit(SignupSuccesState(user: true));
          }
        } else {
          emit(AuthErrorState(message: reqbody));
        }
      } catch (e) {
        emit(AuthErrorState(message: 'You are already registered.'));
      }
    });
  }
}
