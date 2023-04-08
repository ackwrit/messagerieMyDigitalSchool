import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int indexCurrent = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexCurrent,
        onTap: (value){
          setState(() {
            indexCurrent = value;
            pageController.jumpToPage(value);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Personnes"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoris"
          ),
        ],
      ),
    );
  }

  Widget bodyPage(){
    return PageView(
      controller: pageController,
      onPageChanged: (value){
        setState(() {
          pageController.jumpToPage(value);
          indexCurrent = value;
        });
      },
      children: [
        Text("Personnes"),
        Text("Favoris")
      ],
    );
  }
}
