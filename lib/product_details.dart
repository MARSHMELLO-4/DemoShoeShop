import 'package:flutter/material.dart';
import 'home.dart';
class productDetails extends StatelessWidget {
  final Map<String,Object> product;
  const productDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Details',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Center(
            child: Text(product['title'] as String ,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),),
          ),
          Spacer(), //flex //spacer divides the space evenly
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product['imageUrl'] as String),
          ),
          Spacer(flex: 2,),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(

            ),
          )//if we have passed 2 then the spacers will take the 2/3 of the available space
        ],
      ),
    );
  }
}
