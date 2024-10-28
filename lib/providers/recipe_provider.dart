import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipie_model.dart';

import '../services/recipe_apiservice.dart';

class RecipeProvider extends ChangeNotifier{
  bool _isLoading = false;
  RecipesModel? _recipesModel;


  bool get isLoading => _isLoading;
  RecipesModel? get recipesModel => _recipesModel;

  Future<void> getRecipes() async{
    _isLoading = true;
    notifyListeners();
    try{
      _recipesModel = await RecipeApiService().getAllRecipes();
      print('_recipesModel: ${_recipesModel?.recipes?.length}');
    }catch(e){
      print('error something went wrong: $e');
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}