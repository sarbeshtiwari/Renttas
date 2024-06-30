// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/bills.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/documents.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/expense.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/tenants.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/appbar.dart';

class LandlordHomeScreen extends StatelessWidget {
  const LandlordHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 5,
            child: Column(children: const [
              TenantHomeScreenCustomAppBar(),
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
                            Text('Tenants', style: TextStyle(fontSize: 18)),
                            Text('Expense', style: TextStyle(fontSize: 18)),
                            Text('Documents', style: TextStyle(fontSize: 18)),
                            Text('About', style: TextStyle(fontSize: 18)),
                          ]))),
              Expanded(
                  child: TabBarView(children: [
                HomeBillTab(),
                HomeTenantsTab(),
                HomeExpenseTab(),
                HomeDocumentsTab(),
                HomeAboutTab()
              ])),
            ])));
  }
}
