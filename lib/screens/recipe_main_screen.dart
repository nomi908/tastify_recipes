import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/screens/recipe_detail_screen.dart';

class RecipeMainScreen extends StatefulWidget {
  const RecipeMainScreen({super.key});

  @override
  State<RecipeMainScreen> createState() => _RecipeMainScreenState();
}

class _RecipeMainScreenState extends State<RecipeMainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value)
    => Provider.of<RecipeProvider>(context, listen: false).getRecipes());

  }
  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Tastify Recipes'),
        backgroundColor: Colors.white,
        centerTitle: true, titleTextStyle: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold, color: Colors.green),),
      body: Card(
        child: recipesProvider.isLoading ? Center(child: CircularProgressIndicator(),) :
        recipesProvider.recipesModel == null ? Center(child: Text('No recipes found'),) :
        ListView.builder(
            itemCount: recipesProvider.recipesModel!.recipes!.length,
            itemBuilder: (context, index){
              final recipe = recipesProvider.recipesModel!.recipes![index];
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => RecipeDetails(
                    recipe: recipe,
                  )));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(recipe.image!,
                          fit: BoxFit.cover,),
                      ),
                      
                    ),
                    SizedBox(height: 3,),
                    Text('${recipe.name}' , style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold, ),textAlign: TextAlign.start,),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Rating: ${recipe.rating.toString()}', style: TextStyle(
                                fontWeight: FontWeight.w300
                            ),),
                            Icon(Icons.star, color: Colors.green, size: 16,)
                          ],),
                        Text('${recipe.cuisine}', style: TextStyle(
                            fontWeight: FontWeight.w300),),
                      ],
                    )

                  ],
                )
              );
            }),
      ),

    );
  }
}
