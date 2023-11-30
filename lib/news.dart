import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_detail.dart';


class NewsPaper extends StatefulWidget{
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPaper>{
  List _posts = [];
  @override
  void initState(){
    super.initState();
    _getData();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Breaking News CNN Indonesia'), backgroundColor: Colors.pink[200],),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _posts[index]['image']['small'] != null? Image.network(_posts[index]['image']['small'], width: 100,fit: BoxFit.cover,) : Center(),
            ),
            title: Text('${_posts[index]['title']}', maxLines: 2, overflow:TextOverflow.ellipsis),
            subtitle: Text('${_posts[index]['contentSnippet']}',maxLines: 2, overflow: 
            TextOverflow.ellipsis,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c)=> Detail(
                link: _posts[index]['link'],
                title: _posts[index]['title'],
                contentSnippet: _posts[index]['contentSnippet'],
                isoDate: _posts[index]['isoDate'],
                image: _posts[index]['image']['large'],
              )));
            },
          );
        }
      ),
    );
  }


//Koneksi ke API berita
  Future _getData() async{
    try {
      final response = await http.get(Uri.parse('https://berita-indo-api.vercel.app/v1/cnn-news'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['data'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}