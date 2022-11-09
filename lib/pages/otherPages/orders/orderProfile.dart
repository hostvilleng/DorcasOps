import 'package:opshr/general/allExports.dart';
import 'package:opshr/jsonToModels/order.dart';
import 'package:opshr/pages/otherPages/orders/editOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// String _categoryName;
// List<Product> _categoryProducts;

class OrderProfile extends StatefulWidget {
  final Function refreshOrderPage;
  final Order orderData;

  const OrderProfile(
      {Key key, @required this.orderData, @required this.refreshOrderPage})
      : super(key: key);

  @override
  _OrderProfileState createState() => _OrderProfileState();
}

class _OrderProfileState extends State<OrderProfile> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _categoryName = widget.productCategoryData.categoryName;
  //   _categoryProducts = widget.productCategoryData.categoryProducts;
  // }

  @override
  Widget build(BuildContext context) {
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
                  text: 'Order Data > ${widget.orderData.invoiceNumber}',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Invoice ID: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.invoiceId,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Invoice Title: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.invoiceTitle,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Total Cost: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.currency +
                                  " ${widget.orderData.amountOrdered * widget.orderData.product.unitPrice}",
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Due By: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text:
                                  widget.orderData.invoiceDueDate == null ? 'not set' : "${DateFormat('EEE, M/d/y').format(widget.orderData.invoiceDueDate)}",
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Reminder on: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.reminderOn ? 'Yes' : 'No',
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),
                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Invoice Description: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.invoiceDescription,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 10),

                          CommonText(
                            text: 'Product Info',
                            size: 20,
                            color: AppColors().grey,
                            bold: true,
                          ),

                           SizedBox(height: 5),

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Product Name: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.product.name,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Unit Price: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.product.currency + ' ' + widget.orderData.product.unitPrice.toString(),
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Amount Ordered: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: 'X' + widget.orderData.amountOrdered.toString(),
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),

                          SizedBox(height: 10),

                          CommonText(
                            text: 'Department Info',
                            size: 20,
                            color: AppColors().grey,
                            bold: true,
                          ),

                           SizedBox(height: 5),

                           widget.orderData.department == null ?

                           CommonText(
                              text: 'Oops.. The department details for this order is not avaliable',
                              color: Colors.black,
                              size: 18,
                            )

                           :

                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Department Name: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.department.description + widget.orderData.department.name,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Description: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.department.description,
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),
                          SizedBox(height: 5),



                             ],
                           ),

                         
                          SizedBox(height: 10),

                          TheHubRichText(commonTexts: [
                            CommonText(
                              text: 'Paid For: ',
                              bold: true,
                              color: AppColors().darkGrey,
                              size: 16,
                            ),
                            CommonText(
                              text: widget.orderData.paidFor ? 'Yes' : 'No',
                              color: Colors.black,
                              size: 18,
                            ),
                          ]),


                          SizedBox(
                            height: 40,
                          ),


                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: AppColors().white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return CommonBottomSheetMobile(
                                            heightPercentage: 0.45,
                                            refreshMe: () => setState(() {}),
                                            topWidgets: [
                                              Center(
                                                  child:
                                                      roundedModalSheetTopSitter()),
                                            ],
                                            widgets: [
                                              SizedBox(
                                                  height: 17), //common space

                                              CommonText(
                                                text: 'WARNING:',
                                                size: 17,
                                                color: Colors.grey,
                                                bold: true,
                                              ),

                                              SizedBox(
                                                  height: 20), //common space

                                              CommonText(
                                                text:
                                                    'Are you sure you want to mark this Order has a paid order',
                                              ),

                                              SizedBox(
                                                  height: 20), //common space

                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () async{

                                                     
                                                      invoices.remove(widget.orderData);

                                                      dynamic orderJsonData = await ApiRequests().editOrder(
                                         Order(
                                      product: widget.orderData.product,
                                      department: widget.orderData.department,
                                      invoiceId: widget.orderData.invoiceId,
                                      invoiceTitle: widget.orderData.invoiceTitle,
                                      invoiceDescription: widget.orderData.invoiceDescription,
                                      currency: widget.orderData.currency,
                                      amountOrdered: widget.orderData.amountOrdered,
                                      reminderOn: widget.orderData.reminderOn,
                                      invoiceDueDate: widget.orderData.invoiceDueDate,
                                      invoiceDateCreated: widget.orderData.invoiceDateCreated,
                                      paidFor: true)
                                     );

                                  invoices.add(mainOrderJsonDataToOrderModel(orderJsonData));

                                                     

                                                      refreshOrdersPage();

                                                      showSnackLong(
                                                          context,
                                                          'Order Marked has Paid. Page refreshed',
                                                          false);

                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors().red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40,
                                                                vertical: 10),
                                                        child: CommonText(
                                                          text: 'IT\'S PAID',
                                                          size: 14,
                                                          color: Colors.white,
                                                          alignTextCenter: true,
                                                        ),
                                                      ),
                                                    ),
                                                  )),

                                              SizedBox(height: 10),

                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: AppColors()
                                                              .mainColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40,
                                                                vertical: 10),
                                                        child: CommonText(
                                                          text: 'CANCEL',
                                                          size: 14,
                                                          color: Colors.white,
                                                          alignTextCenter: true,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          );
                                        });
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors().greenAcc,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: CommonText(
                                      text: 'MARK ORDER HAS PAID',
                                      size: 14,
                                      color: Colors.white,
                                      alignTextCenter: true,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 20),


                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditOrder(pastOrderData: widget.orderData)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors().mainColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: CommonText(
                                      text: 'EDIT ORDER',
                                      size: 14,
                                      color: Colors.white,
                                      alignTextCenter: true,
                                    ),
                                  ),
                                ),
                              )),


                          SizedBox(height: 20),


                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: AppColors().white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return CommonBottomSheetMobile(
                                            heightPercentage: 0.45,
                                            refreshMe: () => setState(() {}),
                                            topWidgets: [
                                              Center(
                                                  child:
                                                      roundedModalSheetTopSitter()),
                                            ],
                                            widgets: [
                                              SizedBox(
                                                  height: 17), //common space

                                              CommonText(
                                                text: 'WARNING:',
                                                size: 17,
                                                color: Colors.grey,
                                                bold: true,
                                              ),

                                              SizedBox(
                                                  height: 20), //common space

                                              CommonText(
                                                text:
                                                    'Are you sure you want to delete this Order?',
                                              ),

                                              SizedBox(
                                                  height: 20), //common space

                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () async{
                                                      await ApiRequests().deleteOrder(widget.orderData.invoiceId);
                                                      invoices.remove(widget.orderData);
                                                      refreshOrdersPage();

                                                      showSnackLong(
                                                          context,
                                                          'Order Deleted',
                                                          true);

                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors().red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40,
                                                                vertical: 10),
                                                        child: CommonText(
                                                          text: 'DELETE',
                                                          size: 14,
                                                          color: Colors.white,
                                                          alignTextCenter: true,
                                                        ),
                                                      ),
                                                    ),
                                                  )),

                                              SizedBox(height: 10),

                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: AppColors()
                                                              .mainColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40,
                                                                vertical: 10),
                                                        child: CommonText(
                                                          text: 'CANCEL',
                                                          size: 14,
                                                          color: Colors.white,
                                                          alignTextCenter: true,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          );
                                        });
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors().red,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: CommonText(
                                      text: 'DELETE ORDER',
                                      size: 14,
                                      color: Colors.white,
                                      alignTextCenter: true,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 20),
                        ]),
                  ),
                )
              ],
            ))));
  }
}

class CategoryProductWidget extends StatelessWidget {
  final Product productData;
  final String categoryName;
  final String categoryID;

  const CategoryProductWidget(
      {Key key,
      this.productData,
      @required this.categoryName,
      @required this.categoryID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryProductProfile(
                        productData: productData,
                        categoryID: categoryID,
                        categoryName: categoryName,
                      )));
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
                      text: productData.name,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: productData.currency +
                          ' ' +
                          productData.unitPrice.toString(),
                      size: 18,
                      color: AppColors().black,
                    ),
                    CommonText(
                      text: productData.stockAmount.toString() + ' in stock',
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
