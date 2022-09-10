import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/entity/kisiler_cevap.dart';
import 'package:http/http.dart' as http;

class KisilerDaoRepository {// dao: Database Access Object

  List<Kisiler> parseKisilerCevap(String cevap){
    // var jsonVeri = json.decode(cevap);
    // var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    // return kisilerCevap.kisiler;
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    // POST

    //http lib
    //var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    //var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};//Map'in değer kısmı String olmalıdır.
    //var cevap = await http.post(url,body: veri);
    //print("Kişi ekle : ${cevap.body}");

    //dio lib
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi ekle : ${cevap.data.toString()}");
  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    // POST

    //http lib
    //var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    //var veri = {"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};//Map'in değer kısmı String olmalıdır.
    //var cevap = await http.post(url,body: veri);
    //print("Kişi güncelle : ${cevap.body}");

    //dio lib
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id":kisi_id,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi güncelle : ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    // GET

    //http lib
    //var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    //var cevap = await http.get(url);
    //return parseKisilerCevap(cevap.body);

    //dio lib
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    // POST

    //http lib
    //var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    //var veri = {"kisi_ad":aramaKelimesi};
    //var cevap = await http.post(url,body:veri);
    //return parseKisilerCevap(cevap.body);

    //dio lib
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad":aramaKelimesi};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri));
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<void> kisiSil(int kisi_id) async {
    // POST

    //http lib
    //var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    //var veri = {"kisi_id":kisi_id.toString()};
    //var cevap = await http.post(url,body:veri);
    //print("Kişi sil : ${cevap.body}");

    //dio lib
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id":kisi_id};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri));
    print("Kişi sil : ${cevap.data.toString()}");
  }
}