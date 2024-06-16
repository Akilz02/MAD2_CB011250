import 'package:http/http.dart' as http;
import 'package:test02/models/recipe_model.dart';


recipesItems() async {
  Uri url = Uri.parse('https://dummyjson.com/recipes');
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = recipesModelFromJson(res.body);
      return data.recipes;
    } else {
      print("Error Occurred");
    }
  } catch (e) {
    print(e.toString());
  }
}