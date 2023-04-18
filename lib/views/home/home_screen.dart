import 'package:flutter/material.dart';
import 'package:walletwizard/widgets/buttons.dart';
import 'package:walletwizard/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ColorScheme theme =Theme.of(context).colorScheme;
    return  Scaffold(
      key: _scaffoldState,
      drawer: const DrawerView(),
      body: Stack(
        children: <Widget>[

            Positioned(
              left:  width/15,
              top: height/15,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldState.currentState?.openDrawer(),
              ),
          ),


          Positioned(
            left:  width/15,
            top: height/5,
            child: SingleChildScrollView(
              child: Column(
                   children: [

                     SizedBox(
                       height: height/1.3,
                       width: width/1.13,
                       child: ListView.builder(
                           itemCount: 10,
                           itemBuilder: (BuildContext context, int index){
                             return

                               Column(

                                 children: [
                                   SizedBox(
                                     width: width/1.3,
                                     height: height/10,
                                     child: GestureDetector(
                                       onTap:() {
                                         // showDialog(context: context, builder: (BuildContext context){
                                         //   return AlertDialog(
                                         //     content: Stack(
                                         //       clipBehavior: Clip.none, children: <Widget>[
                                         //       Positioned(
                                         //         right: -40.0,
                                         //         top: -40.0,
                                         //         child: InkResponse(
                                         //           onTap: () {
                                         //             Navigator.of(context).pop();
                                         //           },
                                         //           child: CircleAvatar(
                                         //             backgroundColor:theme.primary,
                                         //             child: Icon(Icons.close,color: theme.secondary,),
                                         //           ),
                                         //         ),
                                         //       ),
                                         //       Form(
                                         //         key: _formKey,
                                         //         child: Column(
                                         //
                                         //           mainAxisSize: MainAxisSize.min,
                                         //           children: <Widget>[
                                         //
                                         //             SizedBox(
                                         //               height: height/5,
                                         //               child: Padding(
                                         //                 padding: const EdgeInsets.all(8.0),
                                         //                 child: TextFormField( initialValue: 'Account Name',  decoration: const InputDecoration(
                                         //                     labelText: 'Edit Name', enabledBorder: OutlineInputBorder()),),
                                         //               ),
                                         //             ),
                                         //             Padding(
                                         //               padding: const EdgeInsets.all(8.0),
                                         //               child: Row(
                                         //
                                         //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         //                 children: [
                                         //
                                         //                   SlickButton(name: "UPDATE", tap: (){}, borderColor: theme.primary),
                                         //
                                         //                   SlickButton(name: "DELETE", tap: (){}, borderColor: theme.error)
                                         //
                                         //                 ],
                                         //
                                         //
                                         //               ),
                                         //             )
                                         //           ],
                                         //         ),
                                         //       ),
                                         //     ],
                                         //     ),
                                         //   );
                                         // });
                                           Navigator.pushNamed(context, 'Expense');

                                       },
                                       child: Card(
                                         shape: RoundedRectangleBorder(
                                             side: BorderSide(
                                                 color: theme.primary
                                             ),
                                             borderRadius: BorderRadius.circular(15)
                                         ),
                                         elevation: 15,
                                         child: Center(child: Padding(
                                           padding: const EdgeInsets.all(18.0),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text("Account ${index+1}"),
                                               const Text("Ksh 150"),

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
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              content: Stack(
                clipBehavior: Clip.none, children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor:theme.primary,
                        child: Icon(Icons.close,color: theme.secondary,),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(   decoration: const InputDecoration(
                              labelText: 'Account Name', enabledBorder: OutlineInputBorder()),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField( initialValue: '0.0',  decoration: const InputDecoration(
                              labelText: 'Starting Balance', enabledBorder: OutlineInputBorder()),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: theme.primary
                                ),
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: const Text("ADD"),
                            onPressed: () {

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          );

        },  label: const Text("Add Account"),
      ),


    );
  }
}
