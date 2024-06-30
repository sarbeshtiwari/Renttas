import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/add_property/models.dart';
import 'package:renttas/domain/models/add_property_bill/model.dart';
import 'package:renttas/infrastructure/repository/addBill/repo.dart';
import 'package:renttas/infrastructure/repository/add_property/repo.dart';

part 'addpropertybill_event.dart';
part 'addpropertybill_state.dart';

class AddpropertybillBloc
    extends Bloc<AddpropertybillEvent, AddpropertybillState> {
  AddpropertybillBloc() : super(AddpropertybillInitial()) {
    on<AddpropertybillEvent>((event, emit) {
      emit(AddpropertybillInitial());
    });

    on<AddBillRequestEvent>((event, emit) async {
      try {
        print("ivita");
        final response =
            await AddPropertyBillLandlordRepo.addPropertyBill(event.model);
        print(response);

        if (response && response != '') {
          emit(AddpropertySuccessState());
        } else {
          emit(ErrorState(message: 'Try Again!'));
        }
      } catch (e) {
        print(e.toString());
        emit(ErrorState(message: "some error Occuer $e"));
      }
    });
  }
}
