import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class TenantAddRoomScreen extends StatelessWidget {
  TenantAddRoomScreen({super.key});
  final roomNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Add Room',
          style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 144, 83),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                'Add Room :-',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 11.0, bottom: 7, top: 10),
              child: Text('Room Name'),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red[50]),
                child: CustomTextFormField(
                  prefixIcon: const Icon(
                    Icons.apartment,
                    color: Colors.black,
                  ),
                  obscureText: false,
                  hintText: '',
                  controller: roomNameController,
                  labelText: 'Add Room',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 14, right: 14),
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                borderclr: const Color.fromARGB(255, 73, 148, 74),
                color: const Color.fromARGB(255, 82, 144, 83),
                fontweight: FontWeight.w500,
                height: 50,
                name: 'Submit',
                onTap: () => customNavPush(context, ()),
                radius: 10,
                textclr: Colors.black,
                textsize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
