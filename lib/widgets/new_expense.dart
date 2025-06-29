import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category? _selectedCategory;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      initialDate: now,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //Checks if the form fields are empty or not
  void _selectExpenseData() {
    final eneterdAmount = double.tryParse(
      _amountController.text,
    ); //tryParse converts text amount to number. tryParse will return 'abc' as null; '123.11' as 123.11
    final amountIsInvalid = eneterdAmount == null || eneterdAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: (Text('Please select name, amount and date correctly')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    //Invoke the addExpense method to add new items from form to list
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amout: eneterdAmount,
        time: _selectedDate!,
        category: _selectedCategory!,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            style: Theme.of(context).textTheme.displayMedium,
            decoration: InputDecoration(
              label: Text(
                'Name of Expense',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  style: Theme.of(context).textTheme.displayMedium,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: Text('৳'),
                    label: Text(
                      'Amount',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : formatter.format(_selectedDate!),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('Select a Category'),
                DropdownButton(
                  borderRadius: BorderRadius.circular(14),
                  hint: Text('No Item Selected'),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _selectExpenseData,
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
