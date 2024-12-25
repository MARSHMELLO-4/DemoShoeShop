import 'package:flutter/material.dart';
import 'package:harsu_daan/cart_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';
class productDetails extends StatefulWidget {
  final Map<String,Object> product;
  const productDetails({
    super.key,
    required this.product,
  });

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  late int? SelectedSize;
  //since the on pressed was giving the widget error so we will make the function out of the widget
  void onTap() {
    if (SelectedSize != null) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': SelectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedSize = null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      ),
      body: Column(
        children: [
          //title of the shoe
          Center(
            child: Expanded(
              child: Text(widget.product['title'] as String ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),),
            ),
          ),
          Spacer(), //flex //spacer divides the space evenly
          //image of the shoe
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          Spacer(flex: 2,),
          //the container which contains all the details and shoes and etc etc
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.blue[100],
            ),
            child: Column(
              children: [
                SizedBox(height: 15,),
                //price
                Center(
                    child: Text(
                      '\$${widget.product['price']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),)
                ),
                //list view builder for size row
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context,index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              SelectedSize = size;
                            });
                          },
                          child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: SelectedSize == size ? Colors.yellow : null,
                          ),
                        ),
                      );
                      }),
                ),
                //add to cart
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ElevatedButton(onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),)
                  ),
                ),
              ],
            ),
          )//if we have passed 2 then the spacers will take the 2/3 of the available space
        ],
      ),
    );
  }
}
