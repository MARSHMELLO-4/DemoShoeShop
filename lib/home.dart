import 'package:flutter/material.dart';
import 'global_variables.dart';
import 'product_card.dart';
import 'product_details.dart';
import 'product_list.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //now we are going to create a selected filter thing in which whatever filter is clicked its color will be selecte dyellow in it
  // String SelectedFilter = filters[0]; //we cannot do this as this is the stateful widget we have to crreate a separate init state for it
  /**so instead what we will do is that we are going to late initialise it and then call init state and in that first state wwe
   * will set it
   */
  List<Widget> pages = [
    ProductList(),
    CartPage(), //now we  have the list of the pages.
  ]; //so now if the current page is equual to 0 then we are going to be in the productlsit page
  //else wew are going to be on cart page.
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //putting constant for now
        body: IndexedStack( /*this indexedstack saves the state of the page whenever we are redirected to another page */
          index: currentPage,
          children: pages,
        ),
            //bottom navigation bar which will contain the home and the cart option
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 35,
              onTap: (value){
                setState(() {
                  currentPage = value;
                });
              },
              currentIndex: currentPage,
        items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                label: '',
              ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),

        ]),
    );
  }
}
