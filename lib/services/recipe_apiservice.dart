import 'dart:convert';

import 'package:recipes_app/models/recipie_model.dart';
import 'package:http/http.dart' as http;

class RecipeApiService {
  
  Future<RecipesModel> getAllRecipes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    var data = jsonDecode(response.body);

    if(response.statusCode == 200){
      return RecipesModel.fromJson(data);
    }else{
      throw Exception('Failed to load recipes');
    }
  }
}