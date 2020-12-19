import 'dart:html';
import 'dart:convert' as convert;
import 'state.dart';


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

Future<void> getArts(BitPaperState state) async {
  String json = await HttpRequest.getString("./img/arts.json");
  List<dynamic> artList = (convert.jsonDecode(json) as List).cast<String>();
  artList.forEach((el) {
    print("Getting Art: " + el);
    getArt(state, el);
  });

}

Future<void> getArt(BitPaperState state, String name) async {
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
      case "privkey_qr":
        art.pkQr = readElement(val);
        break;
      case "privkey":
        art.pk = readElement(val);
        break;
      case "address_qr":
        art.addQr = readElement(val);
        break;
      case "address":
        art.pkQr = readElement(val);
        break;
      default:
    }
  });
  state.addArt(art.name, art);
}

ArtElement readElement(dynamic val) {
  Map<String, dynamic> element = (val as Map).cast<String, dynamic>();
  ArtElement ae = ArtElement();
  element.forEach((key, val) { 
   switch (key) {
     case "top":
       ae.top = val as int;
       break;
     case "right":
       ae.right = val as int;
       break;
     case "length":
       ae.length = val as int;
       break;
     case "rotation":
       ae.rotation = val as int;
       break;
     default:
   } 
  });
  return ae;
}
