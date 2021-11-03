import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_store.dart';

class DrawerTile extends StatelessWidget {

  DrawerTile({this.iconData, this.title, this.page});

  HomeStore homeStore = Modular.get();

  final IconData? iconData;
  final String? title;
  final int? page;

  @override
  Widget build(BuildContext context) {

    final int curPage = homeStore.page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: (){
        homeStore.setPage(page!);
        debugPrint('toqeui $page');
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? primaryColor : Colors.grey[700]
              ),
            )
          ],
        )
      ),
    );
  }
}
