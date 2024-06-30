import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String language = '';

class LanguageFields extends StatefulWidget {
  const LanguageFields({super.key});

  @override
  State<LanguageFields> createState() => _LanguageFieldsState();
}

class _LanguageFieldsState extends State<LanguageFields> {
  bool english = false;
  bool arabia = false;
  bool hindi = false;
  bool germany = false;
  bool french = false;
  bool europe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                language = 'english';
                english = true;
                french = false;
                arabia = false;
                hindi = false;
                germany = false;
                europe = false;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: english ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: english ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'English',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    english
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              setState(() {
                language = 'arabia';
                english = false;
                french = false;
                arabia = true;
                hindi = false;
                germany = false;
                europe = false;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: arabia ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: arabia ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'Arabia',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    arabia
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              setState(() {
                language = 'hindi';
                english = false;
                french = false;
                arabia = false;
                hindi = true;
                germany = false;
                europe = false;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: hindi ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: hindi ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'Hindi',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    hindi
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              setState(() {
                language = 'germany';
                english = false;
                french = false;
                arabia = false;
                hindi = false;
                germany = true;
                europe = false;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: germany ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: germany ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'Germany',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    germany
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              setState(() {
                language = 'french';
                english = false;
                french = true;
                arabia = false;
                hindi = false;
                germany = false;
                europe = false;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: french ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: french ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'French',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    french
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              setState(() {
                language = 'europe';
                english = false;
                french = false;
                arabia = false;
                hindi = false;
                germany = false;
                europe = true;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: europe ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: europe ? Colors.green : Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Text(
                      'Europe',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    europe
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
