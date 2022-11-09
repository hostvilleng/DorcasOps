import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


Function refreshProductsPage;

class ManageProducts extends StatefulWidget {
  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  @override
  Widget build(BuildContext context) {

    refreshProductsPage = () {

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
                  text: 'Manage Product',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),
                
                SizedBox(height: 20),

                 Align(
                   alignment: Alignment.centerRight,
                   child: CommonTextButton(text: 'Add Product', 
                   onTapped: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddProduct(refreshProductsPage:  refreshProductsPage,)));
                   },
                   )
                 ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CommonText(
                          text: 'Your Products:',
                          bold: true,
                          color: AppColors().darkGrey,
                        ),
                        
                        SizedBox(
                          height: 20,
                        ),

                        Column(
                           children: allProducts.map((product) {
                               return ProductWidget(productData: product);
                           }).toList()

                           
                        ),

                       
                      ]),
                )
              ],
            ))));
  }
}


class ProductWidget extends StatelessWidget {

  final Product productData;

  const ProductWidget({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductProfile(productData: productData)));
          

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
            ]
          ),
          width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
      
              Container(
                width: MediaQuery.of(context).size.width - 70, //this way i am leaving a width of 50px for the forward icon
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
      
                    SizedBox(height: 12.5,),
      
                    CommonText(
                      text: productData.currency + ' ' + productData.unitPrice.toString(),
                      size: 18,
                      color: AppColors().black,
                    ),
                    CommonText(
                      text: productData.stockAmount.toString() + ' in stock',
                      size: 18,
                      color: AppColors().grey,
                    ),
      
                    SizedBox(height: 12.5,),
      
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
