import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/controller/getExpenses.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/expense.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeExpenseTab extends StatefulWidget {
  const HomeExpenseTab({super.key});

  @override
  State<HomeExpenseTab> createState() => _HomeExpenseTabState();
}

class _HomeExpenseTabState extends State<HomeExpenseTab> {
  final getExpensesController = Get.put(GetExpenses());

  @override
  void initState() {
    super.initState();
    getExpensesController.getExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Expense',
        onTap: () => customNavPush(context, AddExpenseScreen()),
      ),
      body: Obx(() {
        if (getExpensesController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (getExpensesController.expensesList.isEmpty) {
          return Center(child: Text('No Expenses Found'));
        } else {
          return ListView.builder(
            itemCount: getExpensesController.expensesList.length,
            itemBuilder: (context, index) {
              final expense = getExpensesController.expensesList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${expense.expensesDate.day}/${expense.expensesDate.month}',
                              style: TextStyle(fontSize: 15),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  expense.amount,
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
                        Text(expense.description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                getExpensesController.deleteExpense(expense.id);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.update,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Update',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                getExpensesController.deleteExpense(expense.id);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
