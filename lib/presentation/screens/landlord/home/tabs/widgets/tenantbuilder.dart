import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/domain/models/getTenant/models.dart';
dynamic currectTenant;

class tenantbuilder extends StatelessWidget {
  const tenantbuilder({required this.state, super.key});
  final List<GetTenantModel> state;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.3;
    return SizedBox(
      height: 340,
      child: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      // onTap: () {
                      //   BlocProvider.of<TenantselecterBloc>(context).add(
                      //       TenantSelectEvent(
                      //           TenantName: state[index].tenantName,phone: state[index].phone,
                      //           id: state[index].id));
                                
                      //   Navigator.pop(context);
                      // },
                      child: Container(
                        width: containerWidth,
                        height: 50,
                        decoration: BoxDecoration(
                           
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state[index].tenantName,
                                style: GoogleFonts.urbanist(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                              const Icon(
                                      Icons.check_circle_outline_sharp,
                                      color: Colors.green,
                                    )
                                  
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     UpdateTenantModel model = UpdateTenantModel(
                    //         landlordId: userModel!.uid,
                    //         TenantName: state[index].TenantName,
                    //         location: state[index].location,
                    //         TenantTypeId: state[index].TenantTypeId,
                    //         subTenantName: state[index].subPrpertyName,
                    //         pin: state[index].pin,
                    //         id: state[index].id);

                    //     customNavPush(
                    //         context,
                    //         AddNewTenant(
                    //           editModel: model,
                    //           isEdit: true,
                    //         ));

                    //     // print(state[index].id);
                    //   },
                    //   child: Container(
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.black45),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       child: const Padding(
                    //           padding: EdgeInsets.all(10.0),
                    //           child: Icon(
                    //             Icons.edit,
                    //             color: Colors.amber,
                    //           ))),
                    // ),
                    const SizedBox(
                      width: 5,
                    ),
                    // InkWell(
                    //   onTap: () => deleteTenant(context, state[index].id),
                    //   child: Container(
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.black45),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       child: const Padding(
                    //           padding: EdgeInsets.all(10.0),
                    //           child: Icon(
                    //             Icons.delete,
                    //             color: Colors.red,
                    //           ))),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }

  // void deleteTenant(context, id) {
  //   alertsWithButtons(context, 'Do you want to Detete..?', () {
  //     DeleteTenantRepo.deleteTenant(id);
  //     Navigator.pop(context);
  //     BlocProvider.of<FetchTenantBloc>(context)
  //         .add(FetchTenantreqEvent(uid: userModel!.uid));
  //   }, "Delete Tenant");
  // }
}
