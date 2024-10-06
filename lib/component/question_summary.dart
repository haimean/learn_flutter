import 'package:flutter/material.dart';
import 'package:learn_flutter/component/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
