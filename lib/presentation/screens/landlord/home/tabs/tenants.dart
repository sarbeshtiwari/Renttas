import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/add_tenant.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/updateTenant/updateTenantModel.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeTenantsTab extends StatefulWidget {
  const HomeTenantsTab({super.key});

  @override
  State<HomeTenantsTab> createState() => _HomeTenantsTabState();
}

class _HomeTenantsTabState extends State<HomeTenantsTab> {
  final GetTenantRepo tenantManagementController  = Get.put(GetTenantRepo());

  @override
  void initState() {
    super.initState();

    tenantManagementController.getTenantReq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Tenant',
        onTap: () => customNavPush(
            context,
            AddTenantScreen(
              isEdit: false,
            )),
      ),
      body: Obx(() {
        if (tenantManagementController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (tenantManagementController.tenantList.isEmpty) {
          return Center(
            child: Text('Tenant Not found!'),
          );
        } else {
          return ListView.builder(
            itemCount: tenantManagementController.tenantList.length,
            itemBuilder: (context, index) {
              final tenant = tenantManagementController.tenantList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black38),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tenant.tenantName,
                              style: TextStyle(fontSize: 24),  //
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  tenant.phone,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Mobile Number',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                tenantManagementController
                                    .deleteTenant(tenant.id);
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
                            TextButton(
                              onPressed: () {
                                UpdateTenantModel model = UpdateTenantModel(
                                  tenantid: tenantManagementController
                                      .tenantList[index].id,
                                  tenantName: tenantManagementController
                                      .tenantList[index].tenantName,
                                  phone: tenantManagementController
                                      .tenantList[index].phone,
                                  email: tenantManagementController
                                      .tenantList[index].email,
                                  advanceAmount: tenantManagementController
                                      .tenantList[index].advanceAmount,
                                );

                                customNavPush(
                                    context,
                                    AddTenantScreen(
                                      editModel: model,
                                      isEdit: true,
                                    ));

                                // print(state[index].id);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.pencil_circle,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  Text(
                                    'Update',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(
                                    tenant.phone);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.phone_fill,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  Text(
                                    'Call',
                                    style: TextStyle(color: Colors.blue),
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
              );
              // ListTile(
              //   title: Text(
              //       tenant.tenantName), // Adjust this according to your model
              //   subtitle:
              //       Text(tenant.phone), // Adjust this according to your model
              // );

            },
          );

        }
      }),
    );
  }

}
