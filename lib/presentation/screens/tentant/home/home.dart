import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renttas/presentation/screens/tentant/home/about/about.dart';
import 'package:renttas/presentation/screens/tentant/home/bills/bills.dart';
import 'package:renttas/presentation/screens/tentant/home/documents/documents.dart';
import 'package:renttas/presentation/screens/tentant/home/widget/appbar.dart';

class TenantWelcomeHomeScreen extends StatelessWidget {
  const TenantWelcomeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: TenantappBar()),
      body: const DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    height: 50,
                    child: TabBar(
                        indicatorColor: Color.fromARGB(255, 82, 144, 83),
                        labelColor: Color.fromARGB(255, 82, 144, 83),
                        unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                        isScrollable: true,
                        tabs: [
                          Text('Bills', style: TextStyle(fontSize: 18)),
                          Text('Documents', style: TextStyle(fontSize: 18)),
                          Text('About', style: TextStyle(fontSize: 18)),
                        ]))),
            Expanded(
                child: TabBarView(children: [
              LatestBillTenant(),
              DocumentsAddAndViewScreenTenant(),
              AboutDetailsTenant()
            ])),
          ],
        ),
      ),
    );
  }
}
