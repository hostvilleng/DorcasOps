import 'package:opshr/general/allExports.dart';
import 'package:opshr/pages/otherPages/productProfile/editProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ProductProfile extends StatefulWidget {

final Product productData;

const ProductProfile({Key key, @required this.productData}) : super(key: key);

  @override
  _ProductProfileState createState() => _ProductProfileState();
}

class _ProductProfileState extends State<ProductProfile> {
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
                  text: 'Product Data',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),
                
               


                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product ID: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.productId,
                          color: Colors.black,
                          size: 18,
                          ),

                        ]),

                        SizedBox(height: 5),

                        TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product Name: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.name,
                          color: Colors.black,
                          size: 18,
                          ),

                        ]),

                        SizedBox(height: 5),

                        TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product Sell Currency: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.currency,
                          color: Colors.black,
                          size: 18,
                          ),

                        ]),


                        SizedBox(height: 5),

                         TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product Price: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.unitPrice.toString(),
                          color: Colors.black,
                          size: 18,
                          ),

                        ]),


                        SizedBox(height: 5),

                        TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product Stock Amount: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.stockAmount.toString(),
                          color: Colors.black,
                          size: 18,
                          ),

                        ]),


                        SizedBox(height: 5),

                         TheHubRichText(commonTexts: [

                          CommonText(
                          text: 'Product Description: ',
                          bold: true,
                          color: AppColors().darkGrey,
                          size: 16,
                          ),

                          CommonText(
                          text: widget.productData.description,
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

                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProduct(refreshProductsPage: refreshProductsPage, pastProductData: widget.productData,)));
                           
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
                                text: 'EDIT PRODUCT',
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
                                                    'Are you sure you want to delete this Product?',
                                              ),

                                              SizedBox(
                                                  height: 20), //common space

                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () async{
                                                      await ApiRequests().deleteProduct(widget.productData.productId);
                                                      allProducts.remove(widget.productData);
                                                      refreshProductsPage();

                                                      showSnackLong(
                                                          context,
                                                          'Product Deleted',
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
                                text: 'DELETE PRODUCT',
                                size: 14,
                                color: Colors.white,
                                alignTextCenter: true,
                              ),
                            ),
                          ),
                        )),

                        SizedBox(height: 20),

                        
                      ]),
                )
              ],
            ))));
  }
}
