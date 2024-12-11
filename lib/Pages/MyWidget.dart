import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Wellcom to ForoughAria"),);
//   }
// }

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Count:$counter",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: Text(" افزایش"),
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: Text(
                "کاهش",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }
}
