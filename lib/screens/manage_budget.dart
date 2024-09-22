import 'package:flutter/material.dart';

class BudgetManagement extends StatefulWidget {
  const BudgetManagement({super.key});

  @override
  State<BudgetManagement> createState() => _BudgetManagementState();
}

class _BudgetManagementState extends State<BudgetManagement> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  
  // List to hold budgets
  List<Map<String, dynamic>> budgets = [];

  void _addBudget() {
    if (categoryController.text.isNotEmpty && budgetController.text.isNotEmpty) {
      setState(() {
        budgets.add({
          'category': categoryController.text,
          'budget': double.tryParse(budgetController.text) ?? 0,
        });
        categoryController.clear();
        budgetController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Budgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: budgetController,
              decoration: const InputDecoration(
                labelText: 'Budget Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addBudget,
              child: const Text('Add Budget'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(budgets[index]['category']),
                    subtitle: Text('Budget: ${budgets[index]['budget']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
