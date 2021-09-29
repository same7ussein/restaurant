import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final color;
  CategoryItem(
   this.id,
  this.title,
  this.color,
  );

  void selectCategory(context)
  {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
    arguments:{
      'id':id,
      'title':title,
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
       borderRadius: BorderRadius.circular(15),
      child:Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style:Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
     color:color, 
     borderRadius: BorderRadius.circular(15)

        ),
      ),
    );
  }
}
