import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:login_app/bloc/image_bloc.dart';

class DisplayData extends StatelessWidget {

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(3, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 2),
  ];

  Widget _buildImageWidget(context, images) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: images == null ? 0 : images.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                  images[index]['urls']['small'],
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(images[index]['description'] == null
                    ? 'No description'
                    : images[index]['description']),
              ),
            ],
          ),
        );
        ;
      },
    );
  }

  Widget _buildStaggeredImageWidget(context, images) {
    List<Widget> p = [];
    images.forEach((img) {
      p.add(ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
              child: Image.network(
                img['urls']['small'],
                fit: BoxFit.cover,
              ))));
    });
    return StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: p,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: ImageBloc().subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
//            if (snapshot.data.error != null && snapshot.data.error.length > 0){
//              return _buildErrorWidget(snapshot.data.error);
//            }
            return _buildStaggeredImageWidget(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Text('');
          }
        });
  }
}
