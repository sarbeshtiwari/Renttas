part of 'addpropertybill_bloc.dart';

@immutable
class AddpropertybillEvent {}

final class AddBillRequestEvent extends AddpropertybillEvent {
  final AddPropertyBillModel model;

  AddBillRequestEvent({required this.model});
}
