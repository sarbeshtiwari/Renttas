import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import 'package:renttas/infrastructure/repository/add_tenant/repo.dart';

part 'addtenant_event.dart';
part 'addtenant_state.dart';

class AddtenantBloc extends Bloc<AddtenantEvent, AddtenantState> {
  AddtenantBloc() : super(AddtenantInitial()) {
    on<AddtenantEvent>((event, emit) {
      emit(AddtenantInitial());
    });
    on<AddTenantRequstEvent>((event, emit) async {
      try {
        final response = await AddTenantRepo.addTenant(event.model);
        if (response) {
          print("done");
        } else {
          print("false");
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
