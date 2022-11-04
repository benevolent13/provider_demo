import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  Person({required this.name, required this.age, required this.surname});

  final String name;
  final int age;
  final String surname;
}

class User {
  User({required this.address, required this.age, required this.city});

  final String address;
  final int age;
  final String city;
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
            create: (_) => Person(name: "Yohan", age: 25, surname: "Jacky")),
        Provider(
            create: (_) =>
                User(address: "Bhavnagar", age: 30, city: "Ahmedabad")),
      ],
      child: MyApp(),
    ),
  );
}

// Just a plain ol' StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

// Again, just a stateless widget
class MyHomePage extends StatelessWidget {
  const MyHomePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Center(
        child: Text(
          // this string is where we use Provider to fetch the instance
          // of `Person` created above in the `create` property
          '''
          Hi ${Provider.of<Person>(context).name} ${Provider.of<User>(context).city}!
          You are ${Provider.of<User>(context).age} years old''',
        ),
      ),
    );
  }
}
