import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/add_docs.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import '../../../../../infrastructure/repository/getTenant/repo.dart';
import 'add_docs/widgets/fetchDocument.dart';

class HomeDocumentsTab extends StatefulWidget {
  const HomeDocumentsTab({super.key});

  @override
  State<HomeDocumentsTab> createState() => _HomeDocumentsTabState();
}

class _HomeDocumentsTabState extends State<HomeDocumentsTab> {
  final getDocumentController = Get.put(GetDocument());
  late GetTenantRepo tenant;

  @override
  void initState() {
    super.initState();
    getDocumentController.getDocument();
    tenant = Get.put(GetTenantRepo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
          text: 'Documents',
          onTap: () {
            if (tenant.tenantList.isEmpty) {
              Get.snackbar('Error', 'Add Tenant First');
            } else
              customNavPush(context, AddDocumentsScreen());
          }),
      body: Obx(() {
        if (getDocumentController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (getDocumentController.documentList.isEmpty) {
          return Center(child: Text('No Document Found'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust number of columns as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: getDocumentController.documentList.length,
            itemBuilder: (context, index) {
              final document = getDocumentController.documentList[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          document.imageName,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.insert_drive_file,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              document.docname,
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              getDocumentController.deleteDocument(document.id);
                            },
                          ),
                        ],
                      ),
                    ],
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
