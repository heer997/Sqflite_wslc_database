import "dart:developer";
import "package:flutter/material.dart";
import "package:wslc_database/10th_April_2024_Wednesday/Widgets/uihelper.dart";
import "package:wslc_database/Database/dbhelper2.dart";
import "package:wslc_database/Model/dbmodel.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add Data",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const AddData(),
    );
  }
}

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() {
    return AddDataState();
  }
}

class AddDataState extends State<AddData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Data",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customTextFormField(
                  titleController, "Enter title", Icons.title),
              UiHelper.customTextFormField(
                  descController, "Enter description", Icons.description),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  addData(titleController.text.toString(),
                      descController.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(300.0, 50.0),
                ),
                child: const Text(
                  "Add data",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addData(String title, String desc) {
    if (title == "" && desc == "") {
      UiHelper.customSnackBar(text: "Enter required fields", 2, context);
      return log("Enter required fields");
    } else {
      DbHelper2().addNotes(
        UserModel(title: title, desc: desc),
      );
      titleController.clear();
      descController.clear();
      UiHelper.customSnackBar(
          text: "Data inserted Successfully...", 2, context);
      return log("Data inserted Successfully...");
    }
  }
}
