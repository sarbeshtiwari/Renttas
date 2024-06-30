import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

class RatingColum extends StatefulWidget {
  const RatingColum({super.key});

  @override
  State<RatingColum> createState() => _RatingColumState();
}

class _RatingColumState extends State<RatingColum> {
  double rating = 0;

  void updateRating(double value) {
    setState(() {
      rating = value;
    });
  }

  final commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.asset(
            'assets/images/rateapp.png',
            fit: BoxFit.cover,
          ),
        ),
        Text("Renttas",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 10,
        ),
        Text("Rate out App ?",
            style:
                GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600)),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 10,
          ),
          child: PannableRatingBar(
            rate: rating,
            onChanged: updateRating,
            spacing: 0,
            items: List.generate(
              5,
              (index) => const RatingWidget(
                selectedColor: Color.fromARGB(255, 220, 198, 1),
                unSelectedColor: Colors.grey,
                child: Icon(
                  Icons.star,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        TextFormField(
          controller: commentsController,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
              hintText: 'Tell us your comments',
              border: UnderlineInputBorder()),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Submit',
                style: GoogleFonts.urbanist(
                    color: contsGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              )),
        )
      ],
    );
  }
}
