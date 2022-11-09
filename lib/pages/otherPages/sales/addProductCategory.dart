import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _categoryNameController = TextEditingController();

List<Product> selectedCategoryProducts =
    []; //products that have been selected for this category

class AddProductCategory extends StatefulWidget {

  final Function refreshCategoryPage;

  const AddProductCategory({Key key, this.refreshCategoryPage}) : super(key: key);

  @override
  _AddProductCategoryState createState() => _AddProductCategoryState();
}

class _AddProductCategoryState extends State<AddProductCategory> {
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
                  text: 'Add Product Category',
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
                        CommonText(
                          text: 'Product Category Name:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _categoryNameController,
                          hintText: 'e.g Drinks',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Category Products:',
                          size: 17,
                        ),
                        SizedBox(height: 20),

                        Column(
                           children: selectedCategoryProducts.map((product) {
                               return DummyProductWidget(productData: product);
                           }).toList()),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Select Products to add to this Category:',
                          size: 17,
                        ),
                        SizedBox(height: 20),

                        Column(
                            children: allProducts.map((e) {
                          return ProductListWidget(
                              product: e,
                              onTap: () {
                                if (selectedCategoryProducts.contains(e)) {
                                  //if the item is ticked remove it
                                  selectedCategoryProducts.remove(e);
                                  setState(() {
                                    
                                  });

                                } else {
                                  // tick it and add it
                                  selectedCategoryProducts.add(e);
                                  setState(() {
                                    
                                  });

                                }
                              });
                        }).toList()),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {

                                if(_categoryNameController.text.length > 0 && _categoryNameController.text.isNotEmpty) {
                                   
                                   productCategories.add(
                                     ProductCategory(categoryID: DateTime.now().millisecondsSinceEpoch.toString(), categoryName: _categoryNameController.text, categoryProducts: selectedCategoryProducts)
                                   );

                                   widget.refreshCategoryPage(); //so the new category will show on the category page

                                   //clear the data
                                   _categoryNameController.clear();
                                   selectedCategoryProducts = [];

                                   showSnackLong(context, 'Product Category Added', false);
                                   Navigator.pop(context);


                                } else {
                                  showSnackLong(context, 'This Category needs a name please', true);

                                }


                                 


                              },
                              child: CommonTextButtonBig(
                                  text: 'Save Product Category', textSize: 17),
                            )),

                        SizedBox(
                          height: 20,
                        ),
                      ]),
                )
              ],
            ))));
  }
}

class ProductListWidget extends StatelessWidget {
  final Product product;
  final Function onTap; //add this product to the selectedCategoryProduct list

  const ProductListWidget(
      {Key key, @required this.product, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 1000,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: product.name,
                    size: 20,
                  ),

                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors().grey),
                        shape: BoxShape.circle,
                        color: selectedCategoryProducts.contains(product)
                            ? AppColors().mainColor.withOpacity(0.5)
                            : Colors.transparent),
                  ),
                ),


                 
                ]),
          ),
        ),

        MyDivider(),
      ],
    );
  }
}



class DummyProductWidget extends StatelessWidget {

  final Product productData;

  const DummyProductWidget({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

       
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
          child: Container(
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
      
               
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}

