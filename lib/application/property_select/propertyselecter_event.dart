part of 'propertyselecter_bloc.dart';

@immutable
sealed class PropertyselecterEvent {}

final class PropertySelectEvent extends PropertyselecterEvent {
  final String property;
  final String id;
  final String subpropertyId;
  final String subPropertyName;

  PropertySelectEvent(
      {required this.subPropertyName,
      required this.subpropertyId,
      required this.id,
      required this.property});
}
