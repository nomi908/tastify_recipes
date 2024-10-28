import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipie_model.dart';

class RecipeDetails extends StatelessWidget {
  final Recipes recipe;
  RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${recipe.name}'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(recipe.image!,
                  fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('${recipe.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            ExpansionTile(
              leading: Icon(Icons.dinner_dining, color: Colors.green,),
              title: Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold),),
              children: recipe.ingredients!.map((ingredient) {
                return ListTile(
                  title: Text(
                    '⊛ ${ingredient.trim()}', // Trim spaces
                    style: TextStyle(fontSize: 16,),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10,),
              // child: ListView.builder(
              //    itemCount: recipe.instructions!.length,
              //     itemBuilder: (context, index) {
              //   return ListTile(
              //     title: Text('◉ ${recipe.instructions![index]}', style: TextStyle(fontSize: 16,),),
              //   );
              // }),
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Instructions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: recipe.instructions!.map((instruction) {
                      return ListTile(
                        title: Text(
                          '◉ ${instruction}',
                          style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Recipe Rating: ${recipe.rating}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final newrecipe = recipe.rating!.toDouble();
                      return Icon(
                        index <  newrecipe ? Icons.star : Icons.star_border,
                        color: newrecipe> 3.4 ? Colors.green : Colors.grey,
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Tags: ', style: TextStyle(fontWeight: FontWeight.w300,),),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: recipe.tags!.map((tag){
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Chip(
                              label: Text(tag, style: TextStyle(color: Colors.green), ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Meal Type: ', style: TextStyle(fontWeight: FontWeight.w300,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: recipe.mealType!.map((meal){
                    return Text(meal, style: TextStyle(fontWeight: FontWeight.w800,),);
                  }).toList(),
                )
              ],
            )







          ],
        ),
      ),
    );
  }
}
