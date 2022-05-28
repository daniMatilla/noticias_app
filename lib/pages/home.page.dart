import 'package:flutter/material.dart';
import 'package:noticias_app/pages/tabs/for_you.tab.dart';
import 'package:noticias_app/pages/tabs/headers.tab.dart';
import 'package:noticias_app/providers/article.provider.dart';
import 'package:noticias_app/providers/navigation_tab.provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationTabProvider()),
        ChangeNotifierProvider(create: (context) => ArticleProvider())
      ],
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _BottonNavigationBar(),
      ),
    );
  }
}

class _BottonNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navegacionProvider = Provider.of<NavigationTabProvider>(context);
    final _articleProvider = Provider.of<ArticleProvider>(context);

    return BottomNavigationBar(
      currentIndex: _navegacionProvider.tabSelected,
      onTap: (index) {
        _navegacionProvider.tabSelected = index;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public_rounded),
          label: 'Encabezados',
        )
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navegacionProvider = Provider.of<NavigationTabProvider>(context);

    return PageView(
      controller: _navegacionProvider.tabController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) {
        _navegacionProvider.tabSelected = index;
      },
      children: const [
        ForYouTab(),
        HeadersTab(),
      ],
    );
  }
}
