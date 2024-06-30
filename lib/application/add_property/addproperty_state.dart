part of 'addproperty_bloc.dart';

@immutable
sealed class AddpropertyState {}

final class AddpropertyInitial extends AddpropertyState {}

final class LoadingState extends AddpropertyState {}

final class AddpropertyErrorState extends AddpropertyState {
  final String message;

  AddpropertyErrorState({required this.message});
}

final class AddpropertySuccessState extends AddpropertyState {}

final class PostRequstedState extends AddpropertyState {}
