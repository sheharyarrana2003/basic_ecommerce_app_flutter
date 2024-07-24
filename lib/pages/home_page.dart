import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  final List<Widget> _pages=[
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChanged: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child:
                Image.asset('lib/Images/nike.png',
                  color: Colors.white,
                ),
                ),
                const Padding(padding:
                EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text('Home',style: TextStyle(color: Colors.white),),
                  ),
                ),
                const Padding(padding:
                EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text('About',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            const Padding(padding:
            EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text('LogOut',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
