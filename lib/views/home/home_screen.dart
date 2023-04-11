import 'package:flutter/material.dart';
import 'package:walletwizard/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ColorScheme theme =Theme.of(context).colorScheme;
    return  Scaffold(
      key: _scaffoldState,
      drawer: DrawerView(),
      body: Stack(
        children: <Widget>[

            Positioned(
              left:  width/15,
              top: height/15,
              child: Container(

                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _scaffoldState.currentState?.openDrawer(),
                ),

            ),
          ),


          Positioned(
            left:  width/7,
            top: height/5,
            child: SingleChildScrollView(
              child: Column(
                   children: [

                    Container(
                      height: height/1.3,
                      width: width/1.3,
                      child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index){
                        return

                          Column(
                            children: [
                              SizedBox(
                              width: width/1.3,
                              height: height/10,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: theme.primary
                                    ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                elevation: 15,
                                child: Container(child:
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Account ${index+1}"),
                                        Text("Kshs 100"),

                                      ],
                                  ),
                                    )),
                                ),


                              ),
                        ),
                              SizedBox(
                                height: height/45,
                              )
                            ],
                          );
                      }),
                    )

                   ],
                ),
            ),

          ),
        ],
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        backgroundColor: theme.primary,
        onPressed: () {  },  label: const Text("Add Account"),
      ),


    );
  }
}
