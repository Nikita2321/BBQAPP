import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final String meatType;

  MenuPage({required this.meatType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$meatType Recipe'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  _getImageForMeatType(meatType),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$meatType BBQ Recipe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This $meatType BBQ recipe is perfect for your next grilling session. Juicy, flavorful, and easy to make!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _getIngredientsForMeatType(meatType),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _getInstructionsForMeatType(meatType),
          ],
        ),
      ),
    );
  }

  String _getImageForMeatType(String meatType) {
    switch (meatType) {
      case 'Chicken':
        return 'assets/chicken.jpg';
      case 'Beef':
        return 'assets/pork.jpg';
      case 'Pork':
        return 'assets/pork_dish.jpg';
      case 'Fish':
        return 'assets/fish.jpg';
      case 'Vegetables':
        return 'assets/vegetables_dish.jpg';
      case 'Pastry':
        return 'assets/pastry_dish.jpg';
      default:
        return 'assets/default_dish.jpg';
    }
  }

  Widget _getIngredientsForMeatType(String meatType) {
    List<String> ingredients;
    switch (meatType) {
      case 'Chicken':
        ingredients = [
          '4 chicken breasts',
          '2 tbsp olive oil',
          '1 tbsp garlic powder',
          '1 tbsp paprika',
          'Salt and pepper to taste',
          'BBQ sauce'
        ];
        break;
      case 'Beef':
        ingredients = [
          '1 lb beef steak',
          '2 tbsp soy sauce',
          '1 tbsp olive oil',
          '1 tbsp garlic powder',
          '1 tbsp black pepper',
          'BBQ sauce'
        ];
        break;
      case 'Pork':
        ingredients = [
          '4 pork chops',
          '2 tbsp honey',
          '1 tbsp mustard',
          '1 tbsp garlic powder',
          'Salt and pepper to taste',
          'BBQ sauce'
        ];
        break;
      case 'Fish':
        ingredients = [
          '4 fish fillets',
          '2 tbsp lemon juice',
          '1 tbsp olive oil',
          '1 tbsp garlic powder',
          'Salt and pepper to taste',
          'Fresh herbs'
        ];
        break;
      case 'Vegetables':
        ingredients = [
          '1 zucchini, sliced',
          '1 bell pepper, sliced',
          '1 red onion, sliced',
          '2 tbsp olive oil',
          'Salt and pepper to taste',
          'Herbs for seasoning'
        ];
        break;
      case 'Pastry':
        ingredients = [
          '2 sheets of puff pastry',
          '1 egg, beaten',
          '1/2 cup sugar',
          '1 tbsp cinnamon',
          'Fruit filling (optional)'
        ];
        break;
      default:
        ingredients = [
          '1 ingredient',
          '2 ingredients',
          '3 ingredients',
        ];
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) => Text('- $ingredient', style: TextStyle(fontSize: 18))).toList(),
    );
  }

  Widget _getInstructionsForMeatType(String meatType) {
    List<String> instructions;
    switch (meatType) {
      case 'Chicken':
        instructions = [
          'Preheat grill to medium-high heat.',
          'Rub chicken with olive oil, garlic powder, paprika, salt, and pepper.',
          'Grill chicken for 6-7 minutes on each side.',
          'Brush with BBQ sauce during the last few minutes of grilling.',
          'Serve hot and enjoy!'
        ];
        break;
      case 'Beef':
        instructions = [
          'Preheat grill to high heat.',
          'Marinate beef in soy sauce, olive oil, garlic powder, and black pepper for 30 minutes.',
          'Grill steak for 4-5 minutes on each side for medium-rare.',
          'Brush with BBQ sauce during the last minute of grilling.',
          'Let the steak rest for a few minutes before serving.'
        ];
        break;
      case 'Pork':
        instructions = [
          'Preheat grill to medium heat.',
          'Mix honey, mustard, garlic powder, salt, and pepper in a bowl.',
          'Brush pork chops with the honey-mustard mixture.',
          'Grill pork chops for 5-6 minutes on each side.',
          'Serve with extra BBQ sauce if desired.'
        ];
        break;
      case 'Fish':
        instructions = [
          'Preheat grill to medium-high heat.',
          'Brush fish fillets with lemon juice, olive oil, garlic powder, salt, and pepper.',
          'Grill fish for 4-5 minutes on each side until fully cooked.',
          'Garnish with fresh herbs and serve.'
        ];
        break;
      case 'Vegetables':
        instructions = [
          'Preheat grill to medium heat.',
          'Toss sliced vegetables in olive oil, salt, pepper, and herbs.',
          'Grill vegetables for 3-4 minutes on each side until tender.',
          'Serve as a side dish or main course.'
        ];
        break;
      case 'Pastry':
        instructions = [
          'Preheat oven to 375°F (190°C).',
          'Roll out puff pastry sheets on a lightly floured surface.',
          'Brush pastry with beaten egg, sprinkle with sugar and cinnamon.',
          'Bake for 15-20 minutes until golden and puffed.',
          'Serve warm, optionally with fruit filling.'
        ];
        break;
      default:
        instructions = [
          'Default instruction 1',
          'Default instruction 2',
          'Default instruction 3',
        ];
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: instructions.map((instruction) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text('• $instruction', style: TextStyle(fontSize: 18)),
      )).toList(),
    );
  }
}