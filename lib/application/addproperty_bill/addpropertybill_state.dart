part of 'addpropertybill_bloc.dart';

@immutable
sealed class AddpropertybillState {}

final class AddpropertybillInitial extends AddpropertybillState {}

final class AddpropertySuccessState extends AddpropertybillState {}

final class ErrorState extends AddpropertybillState {
  final String message;

  ErrorState({required this.message});
}
