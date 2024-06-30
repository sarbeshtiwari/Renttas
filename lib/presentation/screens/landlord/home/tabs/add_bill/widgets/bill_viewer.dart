import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/domain/models/bill_fetch/model.dart';
import 'package:renttas/domain/models/getTenant/models.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';

import '../../../../../../../infrastructure/repository/fetchBill/repo.dart';

class BillPaymentDetails extends StatefulWidget {
  final PropertyBillFetchModel bill;

  BillPaymentDetails({super.key, required this.bill});

  @override
  State<BillPaymentDetails> createState() => _BillPaymentDetailsState();
}

class _BillPaymentDetailsState extends State<BillPaymentDetails> {
  final billManagementController = Get.put(FetchBillRepo());

  final tenantController = Get.put(GetTenantRepo());
  @override
  void initState() {
    super.initState();
    tenantController.getTenantReq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bill & Payment Details',
        ),
        backgroundColor: Color.fromARGB(255, 82, 144, 83),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Paid Date'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Paid By Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Rent Paid'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Balance'),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(widget.bill.createdAt),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('N/A'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('₹ ${widget.bill.rentAmount}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('₹ ${widget.bill.previousBalance}'),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Rent Bill Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow('Rent Bill Number', '401_1'),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow('Rent Bill Date', widget.bill.createdAt),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow('Total Rent', '₹${widget.bill.totalAmount}'),
            Divider(thickness: 1, height: 15),
            // _buildDetailsRow('Rent Period', tenant.startDate.toString()),
            // Divider(thickness: 1, height: 15),
            // _buildDetailsRow('Rent Due Date', '10-Jul-2024'),
            // Divider(thickness: 1, height: 15),

            // Rent & Maintenance Details
            Align(
                alignment: Alignment.center,
                child: Text('Rent & Maintenance',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            Divider(thickness: 1, height: 20),
            _buildDetailsRow('Rent', '₹${widget.bill.rentAmount}'),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow(
                'Maintenance', '₹${widget.bill.maintenanceAmount}'),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow(
                'Previous Balance', '₹${widget.bill.previousBalance}'),
            Divider(thickness: 1, height: 15),
            _buildDetailsRow('Adjustment', '₹0'),
            Divider(thickness: 1, height: 20),

            // Electricity Details
            Align(
                alignment: Alignment.center,
                child: Text('Electricity',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            Divider(thickness: 1, height: 20),
            _buildDetailsRow('Electricity Type', widget.bill.electricityType),
            Divider(thickness: 1, height: 15),
            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     billManagementController.deleteBill(widget.bill.billId);
                //     Navigator.pop(context);
                //   },
                //   child: Text('Delete'),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    try {} catch (e) {
                      print('Error sharing PDF: $e');
                    }
                  },
                  child: Text('Share'),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: Text('Download'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
