import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
      amout: 8000,
      time: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movies',
      amout: 545.38,
      time: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openWhenAddClicked() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: addNewExpense);
      },
    );
  }

  //Creating the new expense method that adds a new expense from the input to the list;
  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  //Remove a expense from the UI and _registeredList
  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(
      expense,
    ); //.insert needs index and item. index of expense from the list is stored here;
    setState(() {
      _registeredExpense.remove(expense);
    });

    //clears the snackbar;
    ScaffoldMessenger.of(context).clearSnackBars();

    //shows a snackbar and lets user do something with a button;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense removed.'),
        action: SnackBarAction(
          label: "Undo Change",
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This condition checks if the registered list is empty or not. If yes it sets the mainContent to ExpensesList.
    Widget mainContent = Center(
      child: Text('List is empty. Add by clicking the "+" icon.'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        onRemoveExpense: removeExpense,
        expenses: _registeredExpense,
      );
    }
    return Scaffold(
      //App Bar
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openWhenAddClicked, icon: Icon(Icons.add)),
        ],
        title: Text('Expense Tracker'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Your Expense List',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
