import 'dart:html';
import 'dart:convert' as convert;

class Art {
  String name;
  String fileName;
  int height;
  int width;
  ArtElement pkQr;
  ArtElement pk;
  ArtElement addQr;
  ArtElement add;
}

class ArtElement {
  int top;
  int right;
  int length;
  int rotation;
}

Future<void> getArts() async {
  String json = await HttpRequest.getString("./img/arts.json");
  List<dynamic> artList = (convert.jsonDecode(json) as List).cast<String>();
  artList.forEach((element) {
    print("Art: " + element);
    getArt(element);
  });
}

Future<void> getArt(String name) async {
  String json = await HttpRequest.getString("./img/" + name + ".json");
  Map<String, dynamic> artList =
      (convert.jsonDecode(json) as Map).cast<String, dynamic>();
  Art art = Art();
  artList.forEach((k, val) {
    switch (k) {
      case "name":
        art.name = val as String;
        break;
      case "file":
        art.fileName = val as String;
        break;
      case "height":
        art.height = val as int;
        break;
      case "width":
        art.width = val as int;
        break;
      default:
    }
  });
  print("Art: " + art.toString());
}
