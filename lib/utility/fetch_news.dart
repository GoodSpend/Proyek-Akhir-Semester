import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:goodspend/model/News.dart';

void addNews(
    String title, String content, String author, String tanggal) async {
  var url = Uri.parse('http://localhost:8000/financial_news/news/new/app');
  Map<String, String> requestBody = <String, String>{
    "title": title,
    "content": content,
    "author": author,
    "date": tanggal,
  };

  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
}

void deleteNews(int pk) async {
  var url = Uri.parse('http://localhost:8000/financial_news/news/delete/app');
  Map<String, String> requestBody = <String, String>{
    "pk": pk.toString(),
  };

  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
}

Future<List<News>> fetchNews() async {
  var url = Uri.parse('http://localhost:8000/financial_news/app');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object News
  List<News> list = [];
  for (var d in data) {
    if (d != null) {
      list.add(News.fromJson(d));
    }
  }
  return list;
}

void editNews(
    String title, String content, String author, String tanggal, int pk) async {
  var url = Uri.parse('http://localhost:8000/financial_news/news/edit/app');
  Map<String, String> requestBody = <String, String>{
    "title": title,
    "content": content,
    "author": author,
    "date": tanggal,
    "pk": pk.toString(),
  };

  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
}
