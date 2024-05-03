import "dart:developer";
import "package:flutter/material.dart";
import "package:wslc_database/10th_April_2024_Wednesday/Widgets/uihelper.dart";
import "package:wslc_database/Database/dbhelper.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add Screens database",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const AddScreen(),
    );
  }
}

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() {
    return AddScreenState();
  }
}

class AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  addData(String title, String desc) async {
    if (title == "" || desc == "") {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Please enter required fields",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ],
          );
        },
      );
    } else {
      DbHelper().addData(title, desc);
      titleController.clear();
      descController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data added in database"),
          duration: Duration(seconds: 3),
        ),
      );
      log(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Screen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customTextFormField(
                titleController,
                "Enter title",
                Icons.title,
              ),
              UiHelper.customTextFormField(
                descController,
                "Enter Description",
                Icons.description,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  addData(titleController.text.toString(),
                      descController.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(200.0, 50.0),
                ),
                child: const Text(
                  "Add data",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
