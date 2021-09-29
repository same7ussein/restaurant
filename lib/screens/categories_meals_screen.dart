import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_items%20.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
 final List<Meal> availableMeals;
 CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> dispalyMeals;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    dispalyMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void removeMeal(String mealId) {
    setState(
        (){
          dispalyMeals.removeWhere((meal) =>meal.id==mealId);
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: dispalyMeals[index].id,
            imageUrl: dispalyMeals[index].imageUrl,
            title: dispalyMeals[index].title,
            duration: dispalyMeals[index].duration,
            complexity: dispalyMeals[index].complexity,
            affordability: dispalyMeals[index].affordability,
          );
        },
        itemCount: dispalyMeals.length,
      ),
    );
  }
}
