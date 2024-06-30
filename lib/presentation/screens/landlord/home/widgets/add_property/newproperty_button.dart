import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/add_property.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/widget/new.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class NewPropertyButton extends StatefulWidget {
  const NewPropertyButton({super.key});

  @override
  State<NewPropertyButton> createState() => _NewPropertyButtonState();
}

class _NewPropertyButtonState extends State<NewPropertyButton> {
  @override
  Widget build(BuildContext context) {
    return propertyloading
        ? const SizedBox()
        : CustomButton(
            isNetwork: false,
            isRow: false,
            onTap: () => customNavPush(
                context,
                AddNewProperty(
                  isEdit: false,
                )),
            textclr: Colors.white,
            borderclr: contsGreen,
            color: contsGreen,
            fontweight: FontWeight.w500,
            name: 'New Property',
            height: 50,
            radius: 10,
            textsize: 16,
            width: double.infinity,
          );
  }
}
