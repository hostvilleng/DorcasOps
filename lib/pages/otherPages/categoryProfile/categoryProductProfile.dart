import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CategoryProductProfile extends StatefulWidget {

final Product productData;
final String categoryName;
final String categoryID;


const CategoryProductProfile({Key key, @required this.productData, @required this.categoryName, @required this.categoryID}) : super(key: key);

  @override
  _CategoryProductProfileState createState() => _CategoryProductProfileState();
}

class _CategoryProductProfileState extends State<CategoryProductProfile> {
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

                         

                        

                        SizedBox(height: 20),

                        
                      ]),
                )
              ],
            ))));
  }
}
