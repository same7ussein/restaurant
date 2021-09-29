import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='filters';
  final Function saveFilters;
  final Map<String,bool> currentfiltters;
  FiltersScreen(this.currentfiltters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

 bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegan=false;
 bool _vegetarian=false;

@override
initState(){
  
    _glutenFree=widget.currentfiltters['gluten'];
    _lactoseFree=widget.currentfiltters['lactose'];
    _vegan=widget.currentfiltters['vegan'];
 _vegetarian=widget.currentfiltters['vegetarian'];

  super.initState();
}
  Widget buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
   return SwitchListTile(
    title: Text(title),
   value: currentValue,
    subtitle: Text(description),
   onChanged: updateValue
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
IconButton(
  onPressed:(){
    final Map<String,bool>selectedFilters={
       'gluten':_glutenFree,
    'lactose':_lactoseFree,
    'vegan':_vegan,
    'vegetarian':_vegetarian,
    };
    widget.saveFilters(selectedFilters);
  },
   icon: Icon(Icons.save),
   ),
      ],
      ),
    body:Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjest your meal selection.',style:Theme.of(context).textTheme.title,),
        ),Expanded(
          child:ListView(
            children: [
           buildSwitchListTile(
             'Gluten_Free ',
             'only include gluten_free meals.' ,
              _glutenFree,
              (newValue){
                setState(() {
                  _glutenFree=newValue;
                });
              }
               ),
               buildSwitchListTile(
             'Lactose_Free ',
             'only include lactose_free meals.' ,
              _lactoseFree,
              (newValue){
                setState(() {
                  _lactoseFree=newValue;
                });
              }
               ),
                   buildSwitchListTile(
             'Vegetarian',
             'only include Vegetarian meals.' ,
              _vegetarian,
              (newValue){
                setState(() {
                  _vegetarian=newValue;
                });
              }
               ),
                   buildSwitchListTile(
             'Vegan',
             'only include vegan meals.' ,
              _vegan,
              (newValue){
                setState(() {
                  _vegan=newValue;
                });
              }
               ),
               
            ],
          )
        ),
      ],
    ),
      drawer: MainDrawer(),
    );
  }
}