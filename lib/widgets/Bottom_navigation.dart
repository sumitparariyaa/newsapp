import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/navigation_provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationState>(
        builder: (context, navigationState, child) {
          return Container(
              height: MediaQuery.of(context).size.height*0.09,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 0.7,
                  ),
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,),
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: navigationState.pageIndex,
                  onTap: (index) {
                    navigationState.pageIndex = index;
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,size: 25,),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined,size:25),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark,size: 25,),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings,size: 25,),
                      label: "",
                    ),
                  ],
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Theme.of(context).colorScheme.tertiary,
                ),
              )
          );
        }
    );
  }
}
