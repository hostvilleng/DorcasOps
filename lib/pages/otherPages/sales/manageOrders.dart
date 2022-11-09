import 'package:opshr/general/allExports.dart';
import 'package:opshr/pages/otherPages/orders/orderProfile.dart';
//import 'package:opshr/pages/otherPages/sales/addOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

List<Order> invoices = [];

Function refreshOrdersPage;

class ManageOrders extends StatefulWidget {
  @override
  _ManageOrdersState createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  @override
  Widget build(BuildContext context) {

  refreshOrdersPage = () {
    setState(() {
      
    });
  };



    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    )),

                SizedBox(
                  height: 20,
                ), //common space

                CommonText(
                  text: 'Manage Orders & Invoices',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                Align(
                    alignment: Alignment.centerRight,
                    child: CommonTextButton(
                      text: 'Add Invoice',
                      onTapped: () {
                       // Navigator.push(
                          //  context,
                           // MaterialPageRoute(
                              //  builder: (context) => AddOrder(
                                     // refreshOrdersPage: () {
                                      //  setState(() {});
                                     // },
                                    //)));
                      },
                    )),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Invoices:',
                          bold: true,
                          color: AppColors().darkGrey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                            children: invoices.map((order) {
                             return OrderWidget(orderData: order);
                        }).toList())
                      ]),
                )
              ],
            ))));
  }
}

class OrderWidget extends StatelessWidget {
  final Order orderData;

  const OrderWidget({Key key, this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderProfile(orderData: orderData, refreshOrderPage: refreshOrdersPage))
                                    );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors().textWhite,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: AppColors().blandGrey, offset: Offset(1, 2)),
                BoxShadow(color: AppColors().blandGrey, offset: Offset(-2, 1)),
              ]),
          width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width -
                    70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWithMaxLines(
                      text: orderData.invoiceId,
                      size: 14,
                      color: AppColors().grey,
                      maxLines: 1,
                      bold: true,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CommonTextWithMaxLines(
                      text: orderData.invoiceTitle,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: 'Order Value: ' +
                          orderData.currency +
                          " ${orderData.amountOrdered * orderData.product.unitPrice}",
                      size: 18,
                      color: AppColors().grey,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: orderData.invoiceDueDate == null ? 'Due Date: not set' : 
                          "Due Date: ${DateFormat('EEE, M/d/y').format(orderData.invoiceDueDate)}",
                      size: 18,
                      color: AppColors().grey,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: 'Tap for more info',
                      size: 15,
                      color: AppColors().blueAcc,
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.forward,
                size: 24,
                color: AppColors().mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
