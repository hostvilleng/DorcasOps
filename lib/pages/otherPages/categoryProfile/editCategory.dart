import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _editedCategoryNameController = TextEditingController();

List<Product> editedSelectedCategoryProducts =
    []; //products that have been selected for this category

class EditProductCategory extends StatefulWidget {

  final ProductCategory productCategoryData;

  const EditProductCategory({Key key, @required this.productCategoryData }) : super(key: key);

  @override
  _EditProductCategoryState createState() => _EditProductCategoryState();
  
}


class _EditProductCategoryState extends State<EditProductCategory> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    

   //filling in the old details
   _editedCategoryNameController.text = widget.productCategoryData.categoryName;
   editedSelectedCategoryProducts = widget.productCategoryData.categoryProducts; 
  }

  
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
                  text: 'Edit Product Category',
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
                          controller: _editedCategoryNameController,
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
                           children: editedSelectedCategoryProducts.map((product) {
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
                                if (editedSelectedCategoryProducts.contains(e)) {
                                  //if the item is ticked remove it
                                  editedSelectedCategoryProducts.remove(e);
                                  setState(() {
                                    
                                  });

                                } else {
                                  // tick it and add it
                                  editedSelectedCategoryProducts.add(e);
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

                                if(_editedCategoryNameController.text.length > 0 && _editedCategoryNameController.text.isNotEmpty) {
                                   
                                   //remove the category at its current position and replace it with thos edited version
                                   productCategories.remove(widget.productCategoryData);
                                   productCategories.add(ProductCategory(categoryID: widget.productCategoryData.categoryID, categoryName: _editedCategoryNameController.text, categoryProducts: editedSelectedCategoryProducts));
                                   
                    
                                   

                                   refreshCategoryPage(); //so the new category will show on the category page

                                   
                                   //clear the data
                                   _editedCategoryNameController.clear();
                                   editedSelectedCategoryProducts = [];


                                   showSnackLong(context, 'Product Category Edited', false);
                                   Navigator.pop(context);
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
                        color: editedSelectedCategoryProducts.contains(product)
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

