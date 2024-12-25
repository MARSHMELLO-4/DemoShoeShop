import 'package:flutter/material.dart';
import 'global_variables.dart';
import 'product_details.dart';
import 'product_card.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Rogue',
    'Campus',
  ];
  late String SelectedFilter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedFilter = filters[0]; /*iniitialsing the selectedFilter value*/
  }
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Shoes \nCollection',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          hintText: 'Search'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                //list view will always want to get the whole space provided to it
                // so for it we will use a ssizedbox and will restrict the given space to it.
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  /**what is chip
                   * chip is the compact attribute that can be used at the place of card and it is also used to label and make a
                   * action button
                   */
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedFilter = filter; //this set state will call the state with the new state again
                        }); //now the selected filter is changed
                      },
                      child: Chip(
                        backgroundColor: SelectedFilter == filter ? Theme.of(context).colorScheme.primary:
                        Colors.transparent,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // Rich Golden,
                        label: Text(filter),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // adjust the radius as needed
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded( //using expanded it will only take the amount which is suffiiciatly req.
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index) {
                    final product = products[index];
                    final color = index % 2 == 0 ? Colors.lightBlue[100] : Colors.grey[100];
                    return GestureDetector(
                      onTap: () {
                        //we want to navigate from home page to product details page
                        Navigator.of(context).push( //this is how we moved from one page to another page
                            MaterialPageRoute(builder: (context){
                              return productDetails(product: product);
                            })
                        );
                      },
                      child: productCard(title: product['title'] as String,
                        price: product['price'] as double
                        ,image: product['imageUrl'] as String,
                        backgroundColor: color as Color,
                      ),
                    ); /*the imageurl is not present as the sting
                          in the global variable so we have passed it as a string in product card by explicitly mentioning it */
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
