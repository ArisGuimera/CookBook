import 'package:firebase_database/firebase_database.dart';

class RecipeModel {
  String key;
  String youtubeUrl;
  String title;
  bool show;

  RecipeModel(this.youtubeUrl, this.title, this.show);

  RecipeModel.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        youtubeUrl = snapshot.value["youtubeUrl"],
        title = snapshot.value["title"],
        show = snapshot.value["show"];

  toJson() {
    return {
      "youtubeUrl": youtubeUrl,
      "title": title,
      "show": show,
    };
  }
}