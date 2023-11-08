// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:fltr_alquran_if/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() async {
//   int juz = 1;

//   List<Map<String, dynamic>> containerAyat = [];
//   List<Map<String, dynamic>> allJuz = [];

//   for (var i = 1; i <= 114; i++) {
//     var res = await http.get(Uri.parse(""));
//     Map<String, dynamic> rowData = JsonDecoder(res.body)["data"];
//     DetailSurah data = DetailSurah.fromJson(rowData);

//   if(data.verse != null){
//       //ex. surah alfatihah => 7 ayat.
//     data.verse!.forEach((ayat){      
//       if(ayat.meta?.juz == juz){
//       containerAyat.add({
//         'surah':data.name?.transliteration?.id ?? '',
//         'ayah':ayat,
//       });
//       }else {
//         print("=================");
//         print("Berhasil memasukkan Juz $juz");
//         print("Start");
//         print((containerAyat[0]["ayat"] as Verse).number?.inSurah);
//         print("End");
//         print(containerAyat[containerAyat.length -1] as Verse!.number?.inSurah);

//         allJuz.add({
//           'juz':juz,
//           'start':containerAyat[0],
//           'end':containerAyat[containerAyat.length-1],
//           'verses':containerAyat,
//         });
//       juz++;
//       containerAyat =[];
//       containerAyat.add({
//         'surah':data.name?.translations?.id ??'',
//         'ayat':ayat,
//       });
//     }
//     });
//   }
// }

//   print("=================");
//   print("Berhasil memasukkan Juz $juz");
//   print("Start");
//   print((containerAyat[0]["ayat"] as Verse).number?.inSurah);
//   print("End");
//   print(containerAyat[containerAyat.length -1] as Verse!.number?.inSurah);

//   allJuz.add({
//     'juz':juz,
//     'start':containerAyat[0],
//     'end':containerAyat[containerAyat.length-1],
//     'verses':containerAyat,
//   });
// }

// /**
//  * Skenario Logic:
//  * 1. get data from API (data di decode dulu baru di mapping fom model)
//  * 2. hasil getData kita ambil ayat.
//  * 3. logic ketika data null.
//  *    - looping data ayat.
//  *    - didalam looping kita cek data ayat juz disamakan dengan juz(buatan sendiri).
//  *    - ketika juz sama misalkan data ayat juz 1 == juz 1 (buatan sendiri).
//  *    - maka hasilnya akan di tampung 'List<ayat> containerAyat'
//  * 
//  * 
//  * 
//  */