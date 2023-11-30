import 'package:flutter/material.dart';

class Detail extends StatelessWidget{
  final link;
  final title;
  final contentSnippet;
  final isoDate;
  final image;

  Detail({
    this.link,
    this.title,
    this.contentSnippet,
    this.isoDate,
    this.image
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          image != null ? Image.network(image) : Container(
            height: 250,
            color: Colors.grey[200],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10),
                Text('$isoDate',style: TextStyle(
                  fontStyle: FontStyle.italic
                ),),
                SizedBox(height: 5),
                Text('$contentSnippet'),
                Divider(),
                Text('Author: CNN News Indonesia'),
                Text('Sumber: $link')
              ],
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: ()=> Navigator.pop(context),
        backgroundColor: Colors.pink[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}

