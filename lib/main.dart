import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog();
      }
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Count:",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10), // Adjusted the height
                Text(
                  "$count", // Display the count value below "Count:"
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20), // Adjusted the height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCount,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0), // Added padding
                    child: Text("+"),
                  ),
                ),
                SizedBox(width: 20), // Adjusted the width
                ElevatedButton(
                  onPressed: decrementCount,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0), // Added padding
                    child: Text("-"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
