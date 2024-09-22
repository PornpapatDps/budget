import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home/main_screen.dart';
import 'package:project/screens/stats/stat.dart';
import 'package:project/screens/add_expense_income/add_income.dart';
import 'package:project/screens/add_expense_income/add_expense.dart';
import 'package:project/screens/manage_budget.dart';  // Import the new Budget Management screen

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedColor = Colors.grey;
  Color green = Colors.green;
  Color red = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0
          ? const MainScreen()
          : index == 1
              ? AddIncome()
              : index == 2
                  ? AddExpense()
                  : index == 3
                      ? StatScreen()
                      : BudgetManagement(),  // Navigate to Budget Management page
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 4,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: index == 0 ? selectedItem : unselectedColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_up_circle_fill,
                color: index == 1 ? green : unselectedColor,
              ),
              label: 'Income',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_down_circle_fill,
                color: index == 2 ? red : unselectedColor,
              ),
              label: 'Expense',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.graph_square_fill,
                color: index == 3 ? selectedItem : unselectedColor,
              ),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: index == 4 ? selectedItem : unselectedColor,
              ),
              label: 'Budget',
            ),
          ],
        ),
      ),
    );
  }
}
