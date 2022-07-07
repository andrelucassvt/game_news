import 'package:flutter/material.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/features/home/presenter/pages/web_view/web_view_page.dart';
import 'package:share_plus/share_plus.dart';

class CardNoticiaWidget extends StatefulWidget {
  const CardNoticiaWidget({Key? key, required this.noticiaGameEntity})
      : super(key: key);
  final NoticiaGameEntity noticiaGameEntity;

  @override
  State<CardNoticiaWidget> createState() => _CardNoticiaWidgetState();
}

class _CardNoticiaWidgetState extends State<CardNoticiaWidget> {
  bool mostraRestanteDosBotoes = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 2.0,
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.noticiaGameEntity.urlImage))),
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    Share.share(widget.noticiaGameEntity.url);
                  },
                ),
              )),
              Positioned.fill(
                top: 170,
                bottom: 0,
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.noticiaGameEntity.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        child: Container(
                          color: Colors.white70,
                          height: double.infinity,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => WebViewPage(
                                        noticiaGameEntity:
                                            widget.noticiaGameEntity)));
                              },
                              icon: const Icon(
                                  Icons.arrow_circle_right_outlined)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
