import 'package:flutter/material.dart';
  
import 'MenuPage.dart';
import 'SmokeAnimation.dart';  

void main() {
  runApp(BBQApp());
}

class BBQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),  
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),  
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SmokeAnimation(),  
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMeat = 'Chicken';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Create Your BBQ Recipe'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Meat:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  meatButton('Chicken', 'assets/chicken.png'),
                  meatButton('Beef', 'assets/cow.png'),
                  meatButton('Pork', 'assets/pork.png'),
                  meatButton('Fish', 'assets/fish.png'),
                  meatButton('Vegetables', 'assets/vegetables.jpg'),
                  meatButton('Pastry', 'assets/pastry.jpg'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(meatType: selectedMeat),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/bbq.png', color: Colors.white, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget meatButton(String meat, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMeat = meat;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedMeat == meat ? Colors.purple.withOpacity(0.1) : Colors.grey.shade200,
          border: selectedMeat == meat
              ? Border.all(color: Colors.purple, width: 3)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red, size: 80);
              },
            ),
            SizedBox(height: 10),
            Text(
              meat,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selectedMeat == meat ? Colors.purple : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}