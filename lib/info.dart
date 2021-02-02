import 'package:flutter/material.dart';
import 'package:mobilelab/models/news.dart';

class Info extends StatefulWidget {
  Article article;
  Info(this.article);
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новость'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
            height: MediaQuery.of(context).size.height / 10,
            child: Text(widget.article.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.article.urlToImage,
                fit: BoxFit.cover,
              )),
          Container(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: widget.article.content != null
                  ? Text(widget.article.content)
                  : Text('А текста-то и нету ((')),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.article.author != null
                  ? Text(widget.article.author)
                  : Text('Неизвестный автор')
            ],
          )
        ]),
      ),
    );
  }
}
