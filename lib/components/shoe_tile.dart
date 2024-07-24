import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
   ShoeTile({super.key,required this.shoe,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(shoe.imagePath,
                height: 200,
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              shoe.decription,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start ,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    const SizedBox(height: 5,),

                    Text('\$'+shoe.price,style: TextStyle(color: Colors.grey),),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      ),
                      child: Icon(Icons.add,color: Colors.white,)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
