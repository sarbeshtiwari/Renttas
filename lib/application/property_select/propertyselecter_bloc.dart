import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'propertyselecter_event.dart';
part 'propertyselecter_state.dart';

dynamic currentSubpropertyId = '';
dynamic currentPropertyId = '';

class PropertyselecterBloc
    extends Bloc<PropertyselecterEvent, PropertyselecterState> {
  PropertyselecterBloc() : super(PropertyselecterInitial()) {
    on<PropertyselecterEvent>((event, emit) {});
    on<PropertySelectEvent>((event, emit) {
      currentPropertyId = event.id;
      currentSubpropertyId = event.subpropertyId;

      emit(PropertySelectedState(
          subPropertyName: event.subPropertyName,
          selectedProperty: event.property,
          id: event.id));
    });
  }
}
