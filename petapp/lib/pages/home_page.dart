import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petapp/models/bottom_navigation_bar.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../widgets/category.dart';
import '../widgets/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  String selectedCategory = 'Foods';
  List<CategoryModel> dataCategory = [];
  List<ProductModel> dataProduct = [];

// category model
  Future<void> getCategory() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final data = json.decode(response);
    setState(() {
      for (var element in data['category']) {
        dataCategory.add(CategoryModel.fromJson(element));
      }
    });
  }

// products model
  Future<void> getProduct() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final data = json.decode(response);
    setState(() {
      for (var element in data['product']) {
        dataProduct.add(ProductModel.fromJson(element));
      }
    });
  }

  //navbar
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    getCategory();
    getProduct();
    super.initState();
  }

  @override
  void dispose() {
    getCategory();
    getProduct;
    super.dispose();
  }

// user sign out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop'),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Shop',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.6),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for food, accessories...',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    dataCategory.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 20, right: 20)
                              : const EdgeInsets.only(right: 20),
                          child: CategoryItem(
                            category: dataCategory[index],
                            selectedCategory: selectedCategory,
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Best Selling',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  dataProduct.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(right: 20),
                    child: ProductItem(
                      product: dataProduct[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Special Offers',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 40,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan.shade300),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 10,
                    child: Transform.rotate(
                      angle: -0.15,
                      child: Image.asset(
                        'assets/category/food.png',
                        height: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    top: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Special Offer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Special Bundle \n Limited Time',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          '\$${40.00}',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: MyBottomNavigationBar(
        initialIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
