import 'package:flutter/material.dart';
import 'package:harsu_daan/cart_provider.dart';
import 'global_variables.dart';
import 'main.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CART')),
      ),
      body: ListView.builder(
          itemCount:cart.length,
          itemBuilder: (context,index){
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar( //rounded border where you can describe you background img/color in rounded border
                backgroundImage: AssetImage(cartItem['imageUrl'] as String ),
                radius: 30,
                backgroundColor: Colors.yellow[100],
              ),
              title: Text(
                cartItem['title'].toString() , style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Size : ${cartItem['size']}'),
              trailing: IconButton(onPressed: () {
                showDialog(
                  barrierDismissible: false,
                    context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Delete Product',style: TextStyle(fontSize: 20),),
                    content: Text('Are you sure you want to remove product from your cart? '),
                    actions: [
                      TextButton(onPressed: () {
                        Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                        Navigator.of(context).pop();
                      },
                          child: Text('Yes',style: TextStyle(color: Colors.blue),),
                      ),
                      TextButton(onPressed: () {
                        Navigator.of(context).pop(); //to get out of the dialog box
                      },
                        child: Text('NO',style: TextStyle(color: Colors.blue),),
                      )
                      ],
                  );
                });
              } , icon: Icon(Icons.delete,color: Colors.red,)),
            );
          }
      ),
    );
  }
}
