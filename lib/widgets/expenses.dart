import 'package:flutter/material.dart';
import 'package:learn_flutter/model/expense.dart';
import 'package:learn_flutter/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: "title 1",
      amount: 12.3,
      date: DateTime.now(),
      category: Categories.travel,
    ),
    Expense(
      title: "title 2",
      amount: 1234.3,
      date: DateTime.now(),
      category: Categories.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('The chart'),
            Expanded(
              child: ExpensesList(expenses: _registerExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
