import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/rate_app.dart/widget/column.dart';

void rateApp(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Color.fromARGB(255, 200, 193, 193),
        backgroundColor: Color.fromARGB(255, 229, 223, 223),
        title: Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.clear, color: Colors.black),
            ),
          ],
        ),
        content: const RatingColum(),
      );
    },
  );
}
