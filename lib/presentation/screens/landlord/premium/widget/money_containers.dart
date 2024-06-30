import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money.dart';

class MoneyCustomContainers extends StatefulWidget {
  const MoneyCustomContainers({super.key});

  @override
  State<MoneyCustomContainers> createState() => _MoneyCustomContainersState();
}

class _MoneyCustomContainersState extends State<MoneyCustomContainers> {
  bool threeMonths = false;
  bool sixMonths = false;
  bool oneYear = false;
  bool twoYear = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: PremiumMoneyContainer(
                  selected: threeMonths,
                  onTap: () {
                    setState(() {
                      threeMonths = true;
                      sixMonths = false;
                      oneYear = false;
                      twoYear = false;
                    });
                  },
                  currentPrize: '1199',
                  oldPrize: '1499',
                  validFor: '3 Months',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PremiumMoneyContainer(
                  onTap: () {
                    setState(() {
                      threeMonths = false;
                      sixMonths = true;
                      oneYear = false;
                      twoYear = false;
                    });
                  },
                  currentPrize: '1999',
                  oldPrize: '2499',
                  validFor: '6 Months',
                  selected: sixMonths,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: PremiumMoneyContainer(
                  onTap: () {
                    setState(() {
                      threeMonths = false;
                      sixMonths = false;
                      oneYear = true;
                      twoYear = false;
                    });
                  },
                  currentPrize: '3599',
                  oldPrize: '4999',
                  selected: oneYear,
                  validFor: '1 Year',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PremiumMoneyContainer(
                  onTap: () {
                    setState(() {
                      threeMonths = false;
                      sixMonths = false;
                      oneYear = false;
                      twoYear = true;
                    });
                  },
                  selected: twoYear,
                  currentPrize: '5999',
                  oldPrize: '7999',
                  validFor: '2 Year',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
