import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/fetch_property/model.dart';
import 'package:renttas/infrastructure/repository/fetch_property/repo.dart';

part 'fetchproperty_event.dart';
part 'fetchproperty_state.dart';

class FetchpropertyBloc extends Bloc<FetchpropertyEvent, FetchpropertyState> {
  FetchpropertyBloc() : super(FetchpropertyInitial()) {
    on<FetchpropertyEvent>((event, emit) {
      emit(FetchpropertyInitial());
    });
    on<FetchPropertyreqEvent>((event, emit) async {
      emit(FetchingLoading());
      try {
        List<FetchPropertyModel> list =
            await FetchPropertyRepo().fetchProperty(event.uid);
        list.isEmpty
            ? emit(EmptyList())
            : emit(FetchingSuccessState(list: list));
      } catch (e) {
        emit(FetchingErrorState(error: 'Some error Found $e'));
      }
    });
  }
}
