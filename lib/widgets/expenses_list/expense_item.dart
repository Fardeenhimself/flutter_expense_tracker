import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('৳ ${expense.amout.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    //Goto category icons and bring icons as like expense from category
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


                                            //---| Notes |---///
//This page is taking expense as input. It takes items from the expense model and displays them in a card.
//It then passes it to the expense list, where the expense list builds the expense_item widget (card) acco-
//-rding to the index from the list of dummy data from home.

//--Data Flow--
//Models(expense.dart) -> Expense List(expense_item.dart) -> (expense_list.dart) -> Widgets(home.dart)