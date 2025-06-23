import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Creating dummy data
  final List<Expense> _registeredExpense = [
    //First Dummy Expense
    Expense(
      title: 'Flutter Course',
      amout: 19.99,
      time: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movies',
      amout: 14.99,
      time: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openWhenAddClicked() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Text('Hello from below');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openWhenAddClicked, icon: Icon(Icons.add)),
        ],
        title: Text('Expense Tracker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Chart'),
            Expanded(child: ExpenseList(expenses: _registeredExpense)),
          ],
        ),
      ),
    );
  }
}
