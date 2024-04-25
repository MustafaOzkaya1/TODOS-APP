import 'package:todoapp/data/entity/yapilacaklar.dart';
import 'package:todoapp/sqlite/veritabani_yardimcisi.dart';

class YapilacakDaoRepository {
  Future<void> kaydet(String yap_name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String,dynamic>();
    yeniKisi["yapilacak_name"] = yap_name;
    await db.insert("yapilacaklar", yeniKisi);

  }

  Future<void> guncelle(int yap_id,String yap_name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenYapilacak = Map<String,dynamic>();
    guncellenenYapilacak["yapilacak_name"] = yap_name;
    await db.update("yapilacaklar", guncellenenYapilacak, where:  "yapilacak_id = ?",whereArgs: [yap_id]);
  }

  Future<void> sil(int yap_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar", where:  "yapilacak_id = ?",whereArgs: [yap_id]);
  }

  Future<List<Yapilacaklar>> yapilacakYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT*FROM yapilacaklar");

    return List.generate(maps.length, (i) {
      var satir =maps[i];
      return Yapilacaklar(yap_id: satir["yapilacak_id"], yap_name : satir["yapilacak_name"],);
    });
  }

  Future<List<Yapilacaklar>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT*FROM yapilacaklar WHERE yapilacak_ad like '%$aramaKelimesi%' ");

    return List.generate(maps.length, (i) {
      var satir =maps[i];
      return Yapilacaklar(yap_id: satir["yapilacak_id"], yap_name: satir["yapilacak_ad"]);
    });
  }
}
