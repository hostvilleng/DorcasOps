import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:opshr/pages/otherPages/payrolls/authority/authority_payroll.dart';
import 'package:opshr/pages/otherPages/payrolls/paygroup/paygroup.dart';
import 'package:opshr/pages/otherPages/tasks/task_edit_page.dart';
import 'package:opshr/pages/otherPages/tasks/task_update_page.dart';
import 'package:opshr/pages/otherPages/teams/manageTeams.dart';

import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/widgets.dart';
import '../otherPages/payrolls/allowance/add_allowance.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({Key key}) : super(key: key);

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payroll", style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight:FontWeight.bold,
                      color:kWhiteColor,

                    ),),


                    SizedBox(height: 20),


                    BasicItemWidget(icon: Ionicons.person_add_outline, title: 'Add Authorities', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddPayrolls(refreshTeamsPage: refreshTeamsPage)));
                    },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'Add Allowance', onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => AddAllowance ()));
                    },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'Payroll Group', onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePaygroup ()));
                    },),

                    SizedBox(height: 20,),







                  ],
                )
            )
        )
    );
  }
}
