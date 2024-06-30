// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:renttas/domain/models/bill_fetch/model.dart';
// import 'package:renttas/infrastructure/repository/fetchBill/repo.dart';

// part 'propertybillfetch_event.dart';
// part 'propertybillfetch_state.dart';

// class PropertybillfetchBloc
//     extends Bloc<PropertybillfetchEvent, PropertybillfetchState> {
//   PropertybillfetchBloc() : super(PropertybillfetchInitial()) {
//     on<PropertybillfetchEvent>((event, emit) {
//       emit(PropertybillfetchInitial());
//     });

//     on<PropertyBillFetchEvent>((event, emit) async {
//       try {
//         final resposne = await FetchBillRepo.billFetch(
//             event.propertyId, event.subpropertyId);
//         if (resposne.isEmpty) {
//           emit(EmptyState());
//         } else {
//           emit(BillLoadedSucussState(billList: resposne));
//         }
//       } catch (e) {
//         emit(ErrorState(message: "Some Error Occur"));
//         print('sdjfkasfslaf$e');
//       }
//     });
//   }
// }
