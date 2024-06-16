// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:test02/models/weather_model.dart';
//
// import '../service/weather_service.dart';
//
// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});
//
//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }
//
// class _WeatherPageState extends State<WeatherPage> {
//
//   //api key
//   final _weatherService = WeatherService('94b738c7ed853506f898264956cd3c2e');
//   Weather? _weather;
//
//   //fetch weather data
//   _fetchWeather() async {
//     //get the current city
//     String cityName = await _weatherService.getCurrentCity();
//
//     //get weather for city
//     try {
//       final weather = await _weatherService.getWeather(cityName);
//       setState(() {
//         _weather = weather;
//       });
//     }
//     // catch any errors
//     catch (e) {
//       print(e);
//     }
//   }
//
//   //weather animations
//   String getWeatherAnimation(String? mainCondition) {
//     if (mainCondition == null) return 'assets/cloud.json';
//
//     switch (mainCondition.toLowerCase()) {
//       case 'Clear':
//         return 'assets/sunny.json';
//       case 'Clouds':
//         return 'assets/cloud.json';
//       case 'Rain':
//         return 'assets/rain.json';
//       case 'Thunderstorm':
//         return 'assets/thunder.json';
//       default:
//         return 'assets/cloud.json';
//     }
//   }
//
//   //init state
//   @override
//   void initState() {
//     super.initState();
//
//     //fetch weather on startup
//     _fetchWeather();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           // city name
//           Text(_weather?.cityName ?? 'Loading City...'),
//
//           // animation
//             Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
//
//           // temperature
//           Text('${_weather?.temperature.round()}°C'),
//
//           // weather condition
//           Text(_weather?.mainCondition ?? ''),
//           ]
//         ),
//       ),
//     );
//   }
// }  //***************Weather Only***************



// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:test02/models/weather_model.dart';
// import 'package:test02/service/recipe_service.dart';
//
// import '../models/recipe_model.dart';
// import '../service/weather_service.dart';
//
// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});
//
//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }
//
// class _WeatherPageState extends State<WeatherPage> {
//   //api key
//   final _weatherService = WeatherService('94b738c7ed853506f898264956cd3c2e');
//   Weather? _weather;
//
//   //fetch weather data
//   _fetchWeather() async {
//     //get the current city
//     String cityName = await _weatherService.getCurrentCity();
//
//     //get weather for city
//     try {
//       final weather = await _weatherService.getWeather(cityName);
//       setState(() {
//         _weather = weather;
//       });
//     }
//     // catch any errors
//     catch (e) {
//       print(e);
//     }
//   }
//
//   //weather animations
//   String getWeatherAnimation(String? mainCondition) {
//     if (mainCondition == null) return 'assets/cloud.json';
//
//     switch (mainCondition.toLowerCase()) {
//       case 'clear':
//         return 'assets/sunny.json';
//       case 'clouds':
//         return 'assets/cloud.json';
//       case 'rain':
//         return 'assets/rain.json';
//       case 'thunderstorm':
//         return 'assets/thunder.json';
//       default:
//         return 'assets/cloud.json';
//     }
//   }
//
//   //init state
//   @override
//   void initState() {
//     super.initState();
//
//     //fetch weather on startup
//     _fetchWeather();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20.0),
//                 bottomRight: Radius.circular(20.0),
//               ),
//             ),
//             child: Column(
//               children: [
//                 // City name
//                 Text(
//                   _weather?.cityName ?? 'Loading City...',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 SizedBox(height: 8.0),
//
//                 // Weather animation
//                 SizedBox(
//                   height: 100.0,
//                   child: Lottie.asset(
//                       getWeatherAnimation(_weather?.mainCondition)),
//                 ),
//
//                 SizedBox(height: 8.0),
//
//                 // Temperature
//                 Text(
//                   '${_weather?.temperature.round() ?? 0}°C',
//                   style: TextStyle(
//                     fontSize: 32.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 SizedBox(height: 4.0),
//
//                 // Weather condition
//                 Text(
//                   _weather?.mainCondition ?? '',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Placeholder for the recipe list
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView(
//                 children: [
//                   // Example list of recipes
//                   Text(
//                     'Recipe List Goes Here',
//                     style:
//                         TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//                   ),
//                   // Add your recipes here
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Recipe> recipesModel = [];
//
//   myRecipes() {
//     recipesItems().then((value) {
//       setState(() {
//         recipesModel = value;
//       });
//     });
//   }
//
//   @override
//   void initState2() {
//     myRecipes();
//     super.initState();
//   }
//
//   @override
//   Widget build2(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recipes'),
//       ),
//       body: ListView.builder(
//         shrinkWrap: true,
//         itemCount: recipesModel.length,
//         itemBuilder: (context, index) {
//           final recipes = recipesModel[index];
//           return Padding(
//             padding: const EdgeInsets.all(8),
//             child: GestureDetector(
//               onTap: () {},
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       image: DecorationImage(
//                         image: NetworkImage(recipes.image),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// } //***************Recipe List Goes Here***************




import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test02/models/weather_model.dart';
import 'package:test02/pages/recipe_detail.dart';
import 'package:test02/service/recipe_service.dart';

import '../models/recipe_model.dart';
import '../service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('94b738c7ed853506f898264956cd3c2e');
  Weather? _weather;

  List<Recipe> recipesModel = [];

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/cloud.json';

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return 'assets/sunny.json';
      case 'clouds':
        return 'assets/cloud.json';
      case 'rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      default:
        return 'assets/cloud.json';
    }
  }

  myRecipes() {
    recipesItems().then((value) {
      setState(() {
        recipesModel = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    myRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                Text(
                  _weather?.cityName ?? 'Loading City...',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 100.0,
                  child: Lottie.asset(
                      getWeatherAnimation(_weather?.mainCondition)),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${_weather?.temperature.round() ?? 0}°C',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  _weather?.mainCondition ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Bubble Tea Recipes',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipesModel.length,
                      itemBuilder: (context, index) {
                        final recipes = recipesModel[index];

                        // Change the URL for the image
                        String newImageUrl =
                            'lib/images/htm bubble tea 01.jpg'; // replace with your image path

                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                            onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => RecipeDetail(recipe: recipes),
                                //     ),
                                // );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(newImageUrl),
                                      // use AssetImage for local images
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(-5, 7),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      height: 45,
                                      decoration: const BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                  padding:
                                                     const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    recipes.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 18,
                                                        color: Colors.white
                                                    ),
                                                  ),
                                              ),
                                          ),
                                          const Icon(Icons.star, color: Colors.orange,),
                                          Text(
                                            recipes.rating.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.white
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            recipes.cookTimeMinutes.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.white
                                            ),
                                          ),
                                          const Text(
                                            "min",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.white
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
