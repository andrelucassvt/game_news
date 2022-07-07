import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.noticiaGameEntity})
      : super(key: key);
  final NoticiaGameEntity noticiaGameEntity;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noticiaGameEntity.title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.noticiaGameEntity.url,
      ),
    );
  }
}
