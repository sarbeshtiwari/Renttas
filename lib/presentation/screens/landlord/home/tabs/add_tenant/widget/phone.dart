import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/add_tenant.dart';

class AddTenantPhoneField extends StatefulWidget {
  const AddTenantPhoneField({super.key});

  @override
  State<AddTenantPhoneField> createState() => _AddTenantPhoneFieldState();
}

class _AddTenantPhoneFieldState extends State<AddTenantPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        Text(
          'Mobile number*',
          style:
              GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // height: 0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                // color: Colors.pink[50],
                borderRadius: BorderRadius.circular(10)),
            child: IntlPhoneField(
              decoration: InputDecoration(
                fillColor: Colors.pink[50], // Set your desired color here
                filled: true,
                hintText: 'Phone Number',
                border: InputBorder.none,
                prefixIcon: Text('+'),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                setState(() {
                  addtenantphonenumberController.text = phone.completeNumber;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
