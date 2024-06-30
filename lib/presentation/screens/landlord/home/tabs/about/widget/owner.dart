import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';

class OwnerAddressAddScreenFields extends StatelessWidget {
  OwnerAddressAddScreenFields(
      {required this.ownerAddressController,
      required this.pincodeController,
      super.key});
  TextEditingController ownerAddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AddExpenseFields(
        keyboardType: TextInputType.name,
        controller: ownerAddressController,
        hitText: 'Owner Address',
        icon: Icon(
          Icons.location_city,
          color: contsGreen,
        ),
        name: 'Owner Address*',
      ),
      AddExpenseFields(
        keyboardType: TextInputType.number,
        controller: pincodeController,
        hitText: 'Pincode',
        icon: Icon(
          Icons.location_on_outlined,
          color: contsGreen,
        ),
        name: 'Pincode*',
      ),
    ]);
  }
}
