import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favoriteProvider.dart';

class Favy extends StatefulWidget {
  const Favy({Key? key}) : super(key: key);

  @override
  State<Favy> createState() => _FavyState();
}

class _FavyState extends State<Favy> {
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavoriteProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: fav.lst.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    fav.del(index);
                  },
                  child: ListTile(
                    title: Text(fav.lst[index].title),
                    subtitle: Text(fav.lst[index].subTitle),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
