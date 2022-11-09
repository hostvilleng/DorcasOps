import 'package:opshr/general/allExports.dart';

import '../department/department.dart';

class Order {

  //
  final String invoiceId;
  final String invoiceNumber;
  final String invoiceTitle;
  final String invoiceDescription;
  final String currency;
  final int amountOrdered;
  final bool reminderOn;
  final dynamic invoiceDueDate;
  final DateTime invoiceDateCreated;
  final Product product;
  final Department department;
  final bool paidFor;

  Order({this.invoiceId, this.invoiceNumber, @required this.invoiceTitle, @required this.invoiceDescription, @required this.currency, @required this.amountOrdered, @required this.reminderOn, @required this.invoiceDueDate, this.invoiceDateCreated, @required this.product, this.department, @required this.paidFor});

 
}