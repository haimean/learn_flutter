import 'package:flutter/material.dart';
import 'package:learn_flutter/model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('${expense.amount.toStringAsFixed(2)} vnd'),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(expense.date.toUtc().toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
