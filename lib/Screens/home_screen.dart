import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _buildRestaurants(){
    List<Widget> restaurantList = [];
      restaurants.forEach((Restaurant restaurant) {
        restaurantList.add( Container(margin: EdgeInsets.symmetric(horizontal: 20.0, 
        vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey[200],
          )
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              child: Image(image: AssetImage(restaurant.imageUrl),
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
              
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  Text(restaurant.name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 4.0,),
                  RatingStars(restaurant.rating),
                  SizedBox(height: 4.0,),
                   Text(restaurant.address, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4.0,),
                   Text('0.2 miles away',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
        ),
        );
      });
      return Column(children: restaurantList,);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle), 
          onPressed: (){

          },
          iconSize: 30.0,
          ),
          title: Center(
            child: Text('JEUNAR',
            style: TextStyle(
              fontSize: 30.0,
            ),
                       ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){

              },
               child: Text('Cart(5)', style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0
               ),),//(currentUser.cart.length))'
               
               ),
          ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width:0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width:0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'searchfood or restaurants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: Icon(
                  Icons.clear,
                  size: 30.0,
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Nearby Restaurants', 
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}