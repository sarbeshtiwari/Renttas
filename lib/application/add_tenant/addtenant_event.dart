part of 'addtenant_bloc.dart';

@immutable
sealed class AddtenantEvent {}

class AddTenantRequstEvent extends AddtenantEvent {
  final AddTenantModel model;

  AddTenantRequstEvent({required this.model});
}
