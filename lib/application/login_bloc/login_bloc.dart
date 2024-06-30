import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/signin_models/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/signin_repo/repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      emit(LoginInitial());
    });
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginRequsted());
      try {
        final response = await LoginRepo().loginRequest(event.model);
        addValuesToUserModel(response);
        if (response == 'Invalid inputs') {
          emit(LoginErrorState(message: response));
        } else {
          if (response["data"]["role"] == '2') {
            emit(LoginSuccesState(user: false));
          } else {
            emit(LoginSuccesState(user: true));
          }
        }
      } catch (e) {
        emit(LoginErrorState(message: 'Invalid inputs$e'));
      }
    });
  }
}
