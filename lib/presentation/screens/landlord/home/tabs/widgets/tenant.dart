// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:renttas/application/fetch_tenants/fetchtenant_bloc.dart';
// import 'package:renttas/main.dart';
// import 'package:renttas/presentation/screens/landlord/home/tabs/tenants.dart';
// import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/tenantbuilder.dart';

// class AddTenants extends StatefulWidget {
//   const AddTenants({super.key});

//   @override
//   State<AddTenants> createState() => _AddTenantsState();
// }

// class _AddTenantsState extends State<AddTenants> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchtenantBloc, FetchtenantState>(
//       builder: (context, state) {
//         if (state is FetchingSuccessState) {
//           return tenantbuilder(
//             state: state.list,
//           );
//         } else if (state is EmptyList) {
//           // WidgetsBinding.instance.addPostFrameCallback((_) {
//           //tenantsloading = true;
//           return Scaffold(
//             // floatingActionButton: CustomTabsFloatingButton(
//             //   text: 'Tenant',
//             //   onTap: () => customNavPush(context, AddTenantScreen()),
//             // ),
//             body: Center(
//               child: Text('Tenant Not found!'),
//             ),
//           );
//         }

//         return Center(
//           child: CircularProgressIndicator(
//             color: contsGreen,
//           ),
//         );
//       },
//     );
//   }
// }
