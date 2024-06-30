import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/add_property.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/newproperty_button.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/widget/property_builder.dart';

class AppBarAddPropertys extends StatefulWidget {
  const AppBarAddPropertys({super.key});

  @override
  State<AppBarAddPropertys> createState() => _AppBarAddPropertysState();
}

class _AppBarAddPropertysState extends State<AppBarAddPropertys> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchpropertyBloc, FetchpropertyState>(
      builder: (context, state) {
        if (state is FetchingSuccessState) {
          return PropertyBuilderLandlord(
            state: state.list,
          );
        } else if (state is EmptyList) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          propertyloading = true;
          return const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text("No propery is there Add new"),
                SizedBox(
                  height: 80,
                ),
                NewPropertyButton()
              ],
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: contsGreen,
          ),
        );
      },
    );
  }
}
