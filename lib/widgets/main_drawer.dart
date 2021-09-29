import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key key }) : super(key: key);
  Widget buildListTile(String title,IconData icon,Function TabHandler){
    return ListTile(
          leading: Icon(icon,size: 26,),
          title: Text(title,style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),),
          onTap: TabHandler
        );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: 
      [
        Container(
          child: Text('Cooking Up!',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color:Theme.of(context).primaryColor,
          ),),
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 20.0,
        ),
        buildListTile('Meal', Icons.restaurant,
        ()
        {
          Navigator.of(context).pushReplacementNamed('/');
        }
        ),
        buildListTile('Filters',Icons.settings,
        ()
        {
             Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }
        )
      ],),
    );
  }
}