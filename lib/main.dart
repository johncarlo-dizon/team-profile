import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Sample profile data
  final List<Map<String, String>> profiles = [
    {
      "name": "John Carlo V. Dizon",
      "address": "Dolores Piring Mexico",
      "phone": "+63 912 345 6789",
      "email": "john.dizon@email.com",
      "image": "assets/jc.png"
    },
    {
      "name": "Joel Dizon",
      "address": "Arayat, Pampanga",
      "phone": "+63 922 456 7890",
      "email": "joel.dizon@email.com",
      "image": "assets/joel.png"
    },
    {
      "name": "Joseph Lee Basilio",
      "address": "Laug Pampanga",
      "phone": "+63 944 678 9012",
      "email": "joseph.lee@email.com",
      "image": "assets/joseph.jpg"
    },
    {
      "name": "Jomel Simbillo",
      "address": "Clark Freeport Zone",
      "phone": "+63 955 789 0123",
      "email": "jomel.s@email.com",
      "image": "assets/jomel.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('TWICE'),
        trailing: CupertinoButton(
          child: Icon(
            CupertinoIcons.settings,
            size: 20,
            color: CupertinoColors.destructiveRed,
          ),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Meet our Team'),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                                'assets/jc.png', // Replace with your image path
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover),
                          ),
                          Text('John Carlo'),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                                'assets/joel.png', // Replace with your image path
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover),
                          ),
                          Text('Joel'),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset('assets/joseph.jpg',
                                height: 40, width: 40, fit: BoxFit.cover),
                          ),
                          Text('Joseph'),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                                'assets/jomel.jpg', // Replace with your image path
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover),
                          ),
                          Text('Jomel'),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text(
                        'Close',
                        style: TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.separated(
          itemCount: profiles.length,
          separatorBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: CupertinoColors.systemGrey,
              thickness: 1,
            ),
          ),
          itemBuilder: (context, index) {
            var profile = profiles[index];

            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      profile["image"]!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${profile['name']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("Address: ${profile['address']}"),
                        Text("Phone: ${profile['phone']}"),
                        Text("Email: ${profile['email']}"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
