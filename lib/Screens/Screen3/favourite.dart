import 'package:expense_tracker/model/favModel.dart';
import 'package:expense_tracker/provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late List<bool> isFavorite = itemsList.map((e) => false).toList();
  List itemsList = [
    {
      'title': 'item 1',
      'subtitle': 'this is item 1',
      'status': 'false',
    },
    {
      'title': 'item 2',
      'subtitle': 'this is item 2',
      'status': 'false',
    },
    {
      'title': 'item 3',
      'subtitle': 'this is item 3',
      'status': 'false',
    },
    {
      'title': 'item 4',
      'subtitle': 'this is item 4',
      'status': 'false',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavoriteProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              final pressed = isFavorite[index];
              return ListTile(
                title: Text(itemsList[index]['title']),
                subtitle: Text(itemsList[index]['subtitle']),
                trailing: IconButton(
                    icon: pressed
                        ? const Icon(Icons.star, color: Colors.yellow)
                        : const Icon(Icons.star_border),
                    onPressed: () {
                      setState(() {
                        isFavorite[index] = !pressed;
                        if (pressed == false) {
                          ItemModel itemModel = ItemModel(
                            title: itemsList[index]['title'],
                            subTitle: itemsList[index]['subtitle'],
                          );
                          fav.lst.add(itemModel);
                        } else {
                          fav.del(index);
                        }
                      });
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
