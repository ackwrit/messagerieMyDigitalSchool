import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messageriemydigitalschool/controller/conversation_page.dart';
import 'package:messageriemydigitalschool/controller/network_page.dart';
import 'package:messageriemydigitalschool/controller/relax_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variable
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(),
    );




  }


  Widget bodyPage(){
    return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: PageView(
                  onPageChanged: (value){
                    pageController.jumpToPage(value);
                  },
                  controller: pageController,
                  children: const [
                   ConversationPage(),
                    NetworkPage(),
                    RelaxPage()

                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: (){
                          setState(() {
                            pageController.previousPage(duration: const Duration(seconds: 2), curve: Curves.linear);
                          });

                        },
                        child: const Text('Précédent')
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3
                      ),
                    ),

                    TextButton(
                        onPressed: (){
                          setState(() {
                            if(pageController.page == 2){
                              Navigator.pushNamed(context, '/register');

                            }
                            else
                              {
                                pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
                              }

                          });

                        },
                        child: const Text('Suivant')
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
