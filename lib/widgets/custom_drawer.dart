import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/all_items/Allitems.dart';
import 'package:untitled/screens/catagory/catergory.dart';
import 'package:untitled/screens/home/home.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';

import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Obx(()=>UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              accountName: Text(userController.userModel.value.name ?? ""),
              accountEmail: Text(userController.userModel.value.email ?? ""))),
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: CustomText(
          //     text: "Home",
          //   ),
          //   onTap: ()async {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => HomeScreen(),
          //     ));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.shopping_cart),
          //   title: CustomText(
          //     text: "Cart",
          //   ),
          //   onTap: ()async {
          //     showBarModalBottomSheet(
          //       context: context,
          //       builder: (context) => Container(
          //         color: Colors.white,
          //         child: ShoppingCartWidget(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.category),
            title: CustomText(
              text: "Category",
            ),
            onTap: ()async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Category(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_tree_outlined),
            title: CustomText(
              text: "All Items",
            ),
            onTap: ()async {
              producsController.addToTrending();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllItems(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: CustomText(
              text: "Feedback",
            ),
            onTap: ()async {
              paymentsController.getPaymentHistory();
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: CustomText(
              text: "Payments History",
            ),
            onTap: ()async {
              paymentsController.getPaymentHistory();
            },
          ),
          SizedBox(height: 150),
          ListTile(
            onTap: () {
              userController.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
