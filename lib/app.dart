import 'package:flutter/material.dart';

import 'app_view.dart';
import 'screens/add_expense_income/add_expense.dart';
import 'screens/add_expense_income/add_income.dart';
 // Import หน้า AddExpense
// Import หน้า AddIncome

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppveiw();
  }
}
void main() {
  runApp(const MyApp());
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Finance Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ปุ่มสำหรับไปหน้า AddExpense
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddExpense()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // สีแดงสำหรับรายจ่าย
                padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'เพิ่มรายจ่าย',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20), // เว้นระยะห่างระหว่างปุ่ม
            // ปุ่มสำหรับไปหน้า AddIncome
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddIncome()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // สีเขียวสำหรับรายรับ
                padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'เพิ่มรายรับ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}