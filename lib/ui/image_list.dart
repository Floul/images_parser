import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_parser/blocs/images_bloc.dart';
import 'package:images_parser/models/image_model.dart';
import 'package:images_parser/ui/image_fullscreen.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allImages,
        builder: (context, AsyncSnapshot<ImageList> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ImageList> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.images.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return MyGridTile(snapshot.data.images[index]);
        });
  }
}

class MyGridTile extends StatelessWidget {
  final ImageModel image;
  final key = UniqueKey();

  MyGridTile(
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ImageFullScreen(image: image);
            }),
          );
        },
        child: Stack(
          children: <Widget>[
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                  tag: image.user.name,
                  child: Image.network(
                    '${image.urls.thumb}',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(8))),
                  child: Text(
                    image.user.name,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ),
          ],
        ));
  }
}
