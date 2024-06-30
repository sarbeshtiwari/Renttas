part of 'fetchproperty_bloc.dart';

@immutable
sealed class FetchpropertyEvent {}

final class FetchPropertyreqEvent extends FetchpropertyEvent {
  final String uid;

  FetchPropertyreqEvent({required this.uid});
}
