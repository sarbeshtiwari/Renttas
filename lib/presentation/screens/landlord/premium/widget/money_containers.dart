import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/premium/widget/money.dart';

class MoneyCustomContainers extends StatefulWidget {
  final void Function(String) onDurationSelected;
  final void Function(String) onPriceSelect;

  const MoneyCustomContainers(
      {Key? key, required this.onDurationSelected, required this.onPriceSelect})
      : super(key: key);

  @override
  State<MoneyCustomContainers> createState() => _MoneyCustomContainersState();
}

class _MoneyCustomContainersState extends State<MoneyCustomContainers> {
  String selectedDuration = ''; // Track the selected duration
  String selectedPrice = '';

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
                  selected: selectedDuration == '3 Months',
                  onTap: () {
                    setState(() {
                      selectedDuration = '3 Months';
                    });
                    widget.onDurationSelected('3 Months');
                    widget.onPriceSelect('1199');
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
                      selectedDuration = '6 Months';
                    });
                    widget.onDurationSelected('6 Months');
                    widget.onPriceSelect('1999');
                  },
                  currentPrize: '1999',
                  oldPrize: '2499',
                  validFor: '6 Months',
                  selected: selectedDuration == '6 Months',
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
                      selectedDuration = '1 Year';
                    });
                    widget.onDurationSelected('1 Year');
                    widget.onPriceSelect('3599');
                  },
                  currentPrize: '3599',
                  oldPrize: '4999',
                  selected: selectedDuration == '1 Year',
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
                      selectedDuration = '2 Year';
                    });
                    widget.onDurationSelected('2 Year');
                    widget.onPriceSelect('5999');
                  },
                  selected: selectedDuration == '2 Year',
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
