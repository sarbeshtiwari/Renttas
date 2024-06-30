import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/infrastructure/repository/fetchBill/repo.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/add_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/bill_viewer.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeBillTab extends StatefulWidget {
  const HomeBillTab({super.key});

  @override
  State<HomeBillTab> createState() => _HomeBillTabState();
}

class _HomeBillTabState extends State<HomeBillTab> {
  late FetchBillRepo billManagementController;
  late GetTenantRepo tenant;

  @override
  void initState() {
    super.initState();
    billManagementController = Get.put(FetchBillRepo());
    tenant = Get.put(GetTenantRepo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
          text: 'Rent Bill',
          onTap: () {
            if (tenant.tenantList.isEmpty) {
              Get.snackbar('Error', 'Add Tenant First');
            } else {
              customNavPush(context, TenantAddBillScreen());
            }
          }),
      body: Obx(() {
        if (billManagementController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (billManagementController.billList.isEmpty) {
          return Center(
            child: Text('Bill Not found!'),
          );
        } else {
          return ListView.builder(
            itemCount: billManagementController.billList.length,
            itemBuilder: (context, index) {
              final bill = billManagementController.billList[index];
              //final tenant1 = tenant.tenantList[index];
              return GestureDetector(
                onTap: () {
                  customNavPush(
                    context,
                    BillPaymentDetails(
                      bill: bill,
                     
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                bill.createdAt,
                                style: TextStyle(fontSize: 15),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    bill.rentAmount.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'Amount',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  billManagementController
                                      .deleteBill(bill.billId);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
