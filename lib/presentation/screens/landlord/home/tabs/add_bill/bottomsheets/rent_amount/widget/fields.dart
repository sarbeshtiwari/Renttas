import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renttas/main.dart';

class RentAmountCustomFields extends StatelessWidget {
  RentAmountCustomFields(
      {required this.rentAmountController,
      required this.maintenanceAmountcontroller,
      super.key});
  TextEditingController rentAmountController = TextEditingController();
  TextEditingController maintenanceAmountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Card(
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: rentAmountController,
                decoration: InputDecoration(
                    hintText: '  Rent Amount*',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.money,
                      color: contsGreen,
                    )),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: maintenanceAmountcontroller,
                decoration: InputDecoration(
                    hintText: '  Maintenance Amount*',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.money,
                      color: contsGreen,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
