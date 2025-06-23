import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.computer,
};

class Expense {
  //Constructor
  Expense({
    required this.title,
    required this.amout,
    required this.time,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amout;
  final DateTime time;
  final Category category;

  String get formattedDate {
    return formatter.format(time);
  }
}
