import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
   final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    @required this.id,
   @ required this.imageUrl,
   @ required this.title,
   @ required this.duration,
   @ required this.complexity,
   @ required this.affordability,
   } );
   String get complexityText{
     switch(complexity){
     case Complexity.Simple: return 'sample'; break;
     case Complexity.Challenging: return 'challenging'; break;
      case Complexity.Hard: return 'hard'; break;
      default:return 'unknown'; break;
     }
   }
   String get affordabilityText{
     switch(affordability){
     case Affordability.Affordable: return 'Affordable'; break;
     case Affordability.Pricey: return 'Pricey'; break;
      case Affordability.Luxurious: return 'Luxurious'; break;
      default:return 'unknown'; break;
     }
   }


  void selectMeal(context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName
      ,arguments:id
      ).then((result){
     // if(result !=null) removeItem(result);
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //تستخدم حتي تجعل اي شي مدور الحواف مثال الصور
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,height: 200,width: double.infinity,fit: BoxFit.cover,),
                
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    width: 300,
                    color: Colors.black54,
                    child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height:60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: 
                  [
                    Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text("$duration min"),
                    ],
                    ),
                   Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text("$complexityText"),
                    ],
                    ),
                   Row(
                    children: [
                     Icon(Icons.attach_money),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text("$affordabilityText"),
                    ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
