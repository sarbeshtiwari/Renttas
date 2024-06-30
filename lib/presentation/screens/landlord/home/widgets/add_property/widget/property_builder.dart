import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/fetch_property/model.dart';
import 'package:renttas/domain/models/update_property/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/delete_property/repo.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/widget/new.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/appbar.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

dynamic currectProperty;

class PropertyBuilderLandlord extends StatelessWidget {
  const PropertyBuilderLandlord({required this.state, super.key});
  final List<FetchPropertyModel> state;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.3;
    return SizedBox(
      height: 340,
      child: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<PropertyselecterBloc>(context).add(
                            PropertySelectEvent(
                                subPropertyName: state[index].subPrpertyName,
                                subpropertyId: state[index].subpropertyId,
                                property: state[index].propertyName,
                                id: state[index].id));
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: containerWidth,
                        height: 50,
                        decoration: BoxDecoration(
                            color: state[index].id == selectedPropertyId
                                ? Colors.green[100]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state[index].propertyName,
                                style: GoogleFonts.urbanist(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                              state[index].id == selectedPropertyId
                                  ? const Icon(
                                      Icons.check_circle_outline_sharp,
                                      color: Colors.green,
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        UpdatePropertyModel model = UpdatePropertyModel(
                            landlordId: userModel!.uid,
                            propertyName: state[index].propertyName,
                            location: state[index].location,
                            propertyTypeId: state[index].propertyTypeId,
                            subPropertyName: state[index].subPrpertyName,
                            pin: state[index].pin,
                            id: state[index].id);

                        customNavPush(
                            context,
                            AddNewProperty(
                              editModel: model,
                              isEdit: true,
                            ));

                        // print(state[index].id);
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.amber,
                              ))),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => deleteProperty(context, state[index].id),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }

  void deleteProperty(context, id) {
    alertsWithButtons(context, 'Do you want to Detete..?', () {
      DeletePropertyRepo.deleteProperty(id);
      Navigator.pop(context);
      BlocProvider.of<FetchpropertyBloc>(context)
          .add(FetchPropertyreqEvent(uid: userModel!.uid));
    }, "Delete Property");
  }
}
