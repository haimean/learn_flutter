import 'package:flutter/material.dart';
import 'package:learn_flutter/model/expense.dart';
import 'package:learn_flutter/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesItem(
        expense: expenses[index],
      ),
    );
  }
}
