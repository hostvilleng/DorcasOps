// function to sieve through the list of products


import 'package:opshr/general/allExports.dart';

import 'product.dart';

List<Product> allProductsJsonDataToIndividualProductModel(
    dynamic productsJsonData) {
  Map data = productsJsonData;

  List allProductsJsonData = data['data'];

  for (var i = 0; i < allProductsJsonData.length; i++) {
    allProducts.add(productJsonDataToProductModel(allProductsJsonData[i]));
  }

  return allProducts;
}
