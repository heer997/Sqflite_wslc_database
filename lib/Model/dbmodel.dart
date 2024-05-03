import 'package:wslc_database/Database/dbhelper2.dart';

class UserModel {
  int? id;
  String title;
  String desc;

  UserModel({this.id, required this.title, required this.desc});

  /// When data will go(data will Add) in database at that time, we will use toMap() function(toMap -> insert)
  /// When data will fetch from database at that time, we will use fromMap() function(fromMap -> fetch)
  /// When we work with API, at that time, we will use toJson() and fromJson() method

  /// Use of "factory" keyword : When data will go in database and when data will fetch from database,
  /// at that time small amount of data will be stored in "factory" keyword.

  /// To get data(fetch data) from database, fromMap() method is used as shown below:
  factory UserModel.fromMap(Map<String, dynamic> mapdata) {
    return UserModel(
        id: mapdata[DbHelper2.Note_id],
        title: mapdata[DbHelper2.Note_title],
        desc: mapdata[DbHelper2.Note_desc]);
  }

  /// To Add data(store data) in database, toMap() method is used as shown below:
  Map<String, dynamic> toMap() {
    return {
      DbHelper2.Note_id: id,
      DbHelper2.Note_title: title,
      DbHelper2.Note_desc: desc,
    };
  }
}
