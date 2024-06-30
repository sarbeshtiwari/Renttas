part of 'addproperty_bloc.dart';

@immutable
class AddpropertyEvent {}

final class AddPropertyRequstEvent extends AddpropertyEvent {
  final AddPropertyModel model;

  AddPropertyRequstEvent({required this.model});
}

final class FetchPropertyEvent extends AddpropertyEvent {
  final String uid;
  FetchPropertyEvent({required this.uid});
}

final class UpdatePropertyBlocEvent extends AddpropertyEvent {
  final UpdatePropertyModel model;
  UpdatePropertyBlocEvent({required this.model});
}
