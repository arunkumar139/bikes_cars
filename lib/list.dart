import 'dart:developer';
import 'package:badges/badges.dart';
import 'package:bikes_cars/main.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<items> data = [];
  List<items> data1 = [];

  int counter = 0;
  int sum = 0;
  @override
  void initState() {
    getItemDetails();
    // TODO: implement initState
    super.initState();
  }

  getdata(_valueSetter) {
    setState(() {
      data1.add(_valueSetter);
      sum = 0;
      data1.forEach((element) {
        sum = sum + element.itemPrice;
      });
      print('sum is $sum');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  setState(() {
                    preferences.remove('Email');
                    preferences.remove('Password');
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                icon: Icon(Icons.logout)),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => checkout(data1, sum)));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20),
              child: Badge(
                badgeColor: Colors.white,
                badgeContent: Text('$counter'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 10.0),
          //     child: Row(
          //       children: [
          //         Center(child: Icon(Icons.shopping_cart)),
          //         Center(child: Text('$counter')),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            minLeadingWidth: 10,
                            horizontalTitleGap: 2,
                            leading: Image.asset(
                              data[index].imagepath,
                              height: 80,
                              width: 100,
                            ),
                            title: Text(
                              data[index].itemName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Rs. ${data[index].itemPrice}',
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            trailing: ElevatedButton(
                              child: Text('Add to cart'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                setState(() {
                                  getdata(data[index]);
                                  counter++;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
          )
        ],
      )),
    );
  }

  void getItemDetails() {
    data = [];
    data.add(items('apche RTR v2 160', 136000, 'assets/apache.png'));
    data.add(items('Apche RTR v4 160', 136000, 'assets/apache.png'));
    data.add(items('apache RTR 310', 136000, 'assets/apache.png'));
    data.add(items('Honda cB350', 136000, 'assets/apache.png'));
    data.add(items('R15 155', 136000, 'assets/apache.png'));
    data.add(items('Mt 155', 136000, 'assets/apache.png'));
  }
}

class items {
  String itemName, imagepath;
  int itemPrice;
  items(this.itemName, this.itemPrice, this.imagepath);
}






/*
import 'package:badges/badges.dart';
import 'package:bikes_cars/login.dart';
import 'package:bikes_cars/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<items> data = [];
  List<items> data1 = [];

  int counter = 0;
  int sum = 0;
  @override
  void initState() {
    getItemDetails();
    // TODO: implement initState
    super.initState();
  }

  getdata(_valuesetter) {
    setState(() {
      data1.add(_valuesetter);
      sum = 0;
      data1.forEach((element) {
        sum = sum + element.itemprice;
      });
      print('sum is $sum');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // what is [] ?
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Dashboard'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  setState(() {
                    preferences.remove('Email');
                    preferences.remove('Password');
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                icon: Icon(Icons.logout)),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => checkout(data1, sum)));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, right: 20),
              child: Badge(
                badgeColor: Colors.white,
                badgeContent: Text('$counter'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        minLeadingWidth: 10,
                        horizontalTitleGap: 2,
                        leading: Image.asset(
                          data[index].imagepath,
                          height: 80,
                          width: 100,
                        ),
                        title: Text(
                          data[index].itemName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Rs. ${data[index].itemprice}',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        trailing: ElevatedButton(
                          child: Text('Add to cart'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {
                            setState(() {
                              getdata(data[index]);
                              counter++;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getItemDetails() {
    data = [];
    data.add(items('honda city', 100000, 'assets/honda-city.jpeg'));
    data.add(items('maruti', 200000, 'assets/honda-city.jpeg'));
    data.add(items('honda muv 200', 400000, 'assets/honda-city.jpeg'));
    data.add(items('zeeps c100', 500000, 'assets/honda-city.jpeg'));
    data.add(items('wegan', 60000, 'assets/honda-city.jpeg'));
  }
}

class items {
  String itemName, imagepath;
  int itemprice;
  items(this.itemName, this.itemprice, this.imagepath);
}
*/