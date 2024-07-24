import 'package:flutter/cupertino.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier{
  List<Shoe> shoeShop=[
    Shoe(name: "Zoom Freak", price: "236", imagePath: 'lib/Images/1.png' , decription: "The forward thinking design of his latest signature"),
    Shoe(name: "Air Jordan", price: "226", imagePath: 'lib/Images/2.png' , decription: "You have got the hops and the speed-lace up in shoes"),
    Shoe(name: "KD Treys", price: "240", imagePath: 'lib/Images/3.png' , decription: "A secure mid foot strap is suited for scoring binges "),
    Shoe(name: "Kyrie 6", price: "200", imagePath: 'lib/Images/4.png' , decription: "Bouncing cushioning is paired with soft yet supportive foam"),
  ];
  List<Shoe> userCart=[];
  List<Shoe> getShoeList() {
    return shoeShop;
  }
  List<Shoe> getUserCart() {
    return userCart;
  }
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}