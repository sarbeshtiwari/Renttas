// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:renttas/domain/models/getTenant/models.dart';
// import 'package:renttas/infrastructure/repository/getTenant/repo.dart';

// part 'fetchtenant_event.dart';
// part 'fetchtenant_state.dart';

// class FetchtenantBloc extends Bloc<FetchtenantEvent, FetchtenantState> {
//   FetchtenantBloc() : super(FetchtenantInitial()) {
//     on<FetchtenantEvent>((event, emit) {
//       emit(FetchtenantInitial());
//     });
//     on<FetchtenantreqEvent>((event, emit) async {
//       emit(FetchingLoading());
//       try {
//         List<GetTenantModel> list =
//             await GetTenantRepo.getTenantReq(event.uid, event.uid); //might throw error
//         list.isEmpty
//             ? emit(EmptyList())
//             : emit(FetchingSuccessState(list: list));
//       } catch (e) {
//         emit(FetchingErrorState(error: 'Some error Found $e'));
//       }
//     });
//   }
// }
