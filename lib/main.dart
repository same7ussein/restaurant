import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
    List<Meal> _favoritesMeals=[];

  void _setFilters( Map<String,bool>_filterData){
    setState(() {
  _filters=_filterData;
  _availableMeals=DUMMY_MEALS.where((meal)
   {
     
     if(_filters['gluten']==true&&meal.isGlutenFree==false)
     {
     return false;
     }
      if(_filters['lactose']==true&&meal.isLactoseFree==false)
      {
     return false;
      }
      if(_filters['vegen']==true&&meal.isVegan==false)
     {
     return false;
     }
     if(_filters['vegetarian']==true&&meal.isVegetarian)
      {
        return false;
      }
      return true;
     
  }).toList();
});
  }
  void _toggleFavorite(String mealId){
    final existingIndex= _favoritesMeals.indexWhere((meal) =>meal.id==mealId);
    if(existingIndex>=0)
    setState(() {
      _favoritesMeals.removeAt(existingIndex);
    });
    else
    setState(() {
      _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
    });
  }
  bool _isMealFavorite(String id)
  {
  return _favoritesMeals.any((meal) =>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color:Color.fromRGBO(20, 50, 50, 1)),
          body2: TextStyle(color:Color.fromRGBO(20, 50, 50, 1)),
          title: TextStyle(
            fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/':(context)=>TabsScreen(_favoritesMeals),
        CategoryMealsScreen.routeName:(context)=>CategoryMealsScreen( _availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName:(context)=>FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body:null,
    );
  }
}
