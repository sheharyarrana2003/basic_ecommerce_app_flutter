import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addNewShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text("Successfully Added"),
          content: Text("Check your Cart"),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,value,child) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search",style: TextStyle(color: Colors.grey),),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Padding(padding:
        EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            "EveryOne flies.. Some fly longer than others",
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(padding:
        EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Hot Pics🔥",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
              ),
              Text("See all",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child:
        ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            Shoe shoe=value.getShoeList()[index];
            return ShoeTile(
              shoe: shoe,
              onTap: ()=> addNewShoeToCart(shoe),
            );
          },
        ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25.0,left: 25.0,right: 25.0),
          child: Divider(
            color: Colors.white,
          ),
        ),
      ],
    ),
    );
  }
}
