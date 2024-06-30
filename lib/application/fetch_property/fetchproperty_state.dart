part of 'fetchproperty_bloc.dart';

@immutable
sealed class FetchpropertyState {}

final class FetchpropertyInitial extends FetchpropertyState {}

final class FetchingLoading extends FetchpropertyState {}

final class FetchingSuccessState extends FetchpropertyState {
  final List<FetchPropertyModel> list;

  FetchingSuccessState({required this.list});
}

final class FetchingErrorState extends FetchpropertyState {
  final String error;

  FetchingErrorState({required this.error});
}

final class EmptyList extends FetchpropertyState {}
