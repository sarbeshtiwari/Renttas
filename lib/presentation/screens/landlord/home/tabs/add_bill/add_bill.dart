import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/addproperty_bill/addpropertybill_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/add_property_bill/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/electricity/electricity.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/gas_bill/widgets/charges.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_amount/rent.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/custom_charges/charges.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/custom_charges.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/floating_button.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/monthly.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/other.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/rent_cycle.dart';

import '../../../../../../infrastructure/repository/fetchBill/repo.dart';

class TenantAddBillScreen extends StatefulWidget {
  const TenantAddBillScreen({super.key});

  @override
  State<TenantAddBillScreen> createState() => _TenantAddBillScreenState();
}

class _TenantAddBillScreenState extends State<TenantAddBillScreen> {
  final tenant = Get.put(GetTenantRepo());
  @override
  void initState() {
    tenant.getTenantReq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddBillCustomFloatingButton(
        ontap: () {
          var tenantMobileNumber = tenant.tenantList.first.phone;
          // Ensure these variables are defined and initialized correctly
          AddPropertyBillModel model = AddPropertyBillModel(
              electricityType: electrycityBill,
              extraCharges: waterbillController.text,
              gasBillType: gasBill,
              landlordId: userModel!.uid,
              maintananceAmount: maintenanceAmountController.text,
              propertyId: currentPropertyId,
              rentAmount: rentAmountController.text,
              rentCycle: rentCycle,
              waterbillType: waterbillController.text,
              subpropertyId: currentSubpropertyId,
              totalamount: "",
              mobileNumber: tenantMobileNumber);

          // Dispatching the event to add a new bill
          BlocProvider.of<AddpropertybillBloc>(context)
              .add(AddBillRequestEvent(model: model));

          // Clearing the input fields after the operation
          electrycityBill = '';
          waterbillController.clear();
          gasBill = '';
          maintenanceAmountController.clear();
          rentAmountController.clear();
          rentCycle = '';
          waterbillController.clear();

          // Fetching the updated property bills
          // BlocProvider.of<PropertybillfetchBloc>(context).add(
          //   PropertyBillFetchEvent(
          //     propertyId: currentPropertyId,
          //     subpropertyId: currentSubpropertyId,
          //   ),
          // );
          late FetchBillRepo billManagementController;
          billManagementController = Get.put(FetchBillRepo());
          billManagementController.billFetch(
              //(
              currentPropertyId,
              currentSubpropertyId);

          // Only pop once after everything is done
          Navigator.pop(context);
        },
      ),
      backgroundColor: const Color.fromARGB(255, 242, 239, 239),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Bill',
          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: contsGreen,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddbillRentCycle(),
              AddBillMonthlyChargesScreen(),
              AddBillOtherChargesScreen(),
              AddBillCustomChargesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
