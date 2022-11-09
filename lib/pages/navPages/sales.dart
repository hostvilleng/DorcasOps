import 'package:opshr/general/allExports.dart';
import 'package:ionicons/ionicons.dart';


List<Product> allProducts = [

  //  Product(productId: 'CSDC2523', name: 'CocaCola Coke', description: 'A 50cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 75, stockAmount: 4640, addedOn: DateTime.now(),),
  //  Product(productId: 'ASWE7432', name: 'CocaCola Fanta', description: 'A 75cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 120, stockAmount: 800, addedOn: DateTime.now(),),


];

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Additions',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                BasicItemWidget(
                  icon: Ionicons.bookmarks_outline,
                  title: 'Categories',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductCategories()));
                  },
                ),
                MyDivider(),
                //BasicItemWidget(
                 // icon: Icons.add_box_outlined,
                //  title: 'Products',
               //   onTap: () {
                 //   Navigator.push(
                  //      context,
                  //      MaterialPageRoute(
                  //          builder: (context) => ManageProducts()));
                 // },
                //),
                MyDivider(),
                //BasicItemWidget(
                  //icon: Ionicons.bag_outline,
                 // title: 'Orders & Invoices',
                 // onTap: () {
                  //  Navigator.push(
                    //    context,
                    //    MaterialPageRoute(
                  //          builder: (context) => ManageOrders()));
                //  },
              //  ),
               // MyDivider(),
                BasicItemWidget(
                  icon: Ionicons.car_outline,
                  title: 'Shipping & Routes',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageRoutes()));
                  },
                ),
                MyDivider(),

                SizedBox(
                  height: 20,
                ),

              ],
            ))));
  }
}
