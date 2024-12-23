import 'package:flutter/material.dart';
import 'global_variables.dart';
class productCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const productCard({
    super.key, //this is the super key that is passed by default
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor//this is the req thing which is to be passed whenever we are calling this card
  });

  @override
  Widget build(BuildContext context) { //this is the product card
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),/*using to provide the curve at the edges
      -> if the decoration is mentioned then you have to put the color fromo
      outside of the decoration to inside of the ddeccoration
      we can takeaway a thing from here that whenever passing a color pass in the decoration only
      */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5,),
          Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
          Center(child: Image.asset(image,height: 175,))
        ],
      ),
    );
  }
}
