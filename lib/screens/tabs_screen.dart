import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoritesMeals;
   TabsScreen(this._favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages;
  int selectedPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      selectedPageIndex=value;
    });
}
@override
  void initState() {
    _pages=[
    {
    'page': CategoriesScreen(),
    'title':'categories'
    },
    {
    'page': FavoriteScreen(widget._favoritesMeals),
    'title':' your favorites'
    },
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(_pages [ selectedPageIndex ] ['title']),),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor:Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Categories'),),
          BottomNavigationBarItem(icon: Icon(Icons.star),title: Text('Favorites'),),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

