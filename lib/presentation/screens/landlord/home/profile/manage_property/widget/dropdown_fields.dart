import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/application/getReport/get_report.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/manage_property/widget/dropdown.dart';

class CustomDropDownFields extends StatefulWidget {
  const CustomDropDownFields({super.key});

  @override
  State<CustomDropDownFields> createState() => _CustomDropDownFieldsState();
}

class _CustomDropDownFieldsState extends State<CustomDropDownFields> {
  String selectedProperty = ''; // Track the selected duration
  String selectedPeriod = '';

  final getReport = Get.put(GetReportController());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchpropertyBloc>(context)
        .add(FetchPropertyreqEvent(uid: userModel!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchpropertyBloc, FetchpropertyState>(
      builder: (context, state) {
        List<String> propertyItems = [];

        if (state is FetchingLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchingSuccessState) {
          propertyItems =
              state.list.map((property) => property.propertyName).toList();
        } else if (state is FetchingErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is EmptyList) {
          return Center(child: Text('No properties available'));
        }

        return Column(
          children: [
            ManageDropDownFields(
              period: false,
              name: 'Property/Unit',
              hintText: 'All Properties',
              icon: const Icon(Icons.home),
              items: propertyItems,
              onTap: (String value) {
                setState(() {
                  selectedProperty = value;
                });
                print('Selected Property: $value');
                //widget.onDurationSelected(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ManageDropDownFields(
              period: true,
              name: 'Selected Period',
              hintText: 'Select Period (in Years)',
              icon: const Icon(Icons.watch_later_outlined),
              items: ['2023', '2024'],
              onTap: (String value) {
                setState(() {
                  selectedPeriod = value;
                });
                print('Selected Period: $value');
                getReport.getReportYear(selectedPeriod);
                //widget.onDurationSelected(value);
              },
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        );
      },
    );
  }
}
