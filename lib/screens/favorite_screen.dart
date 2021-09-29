import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_items%20.dart';

class FavoriteScreen extends StatelessWidget {
   final List<Meal> favoritesMeals;
   FavoriteScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if(favoritesMeals.isEmpty)
    {
      return Center(
      child: Text('you have no favorite yet-start adding some'),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            imageUrl: favoritesMeals[index].imageUrl,
            title: favoritesMeals[index].title,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  
  }
}