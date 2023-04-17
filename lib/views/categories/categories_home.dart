import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:walletwizard/widgets/buttons.dart';
import 'package:walletwizard/widgets/drawer.dart';


class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Country _selectedFilteredDialogCurrency =
  CountryPickerUtils.getCountryByCurrencyCode('INR');

  Country _selectedFilteredDialogCountry =
  CountryPickerUtils.getCountryByPhoneCode('90');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ColorScheme theme =Theme.of(context).colorScheme;
    return   Scaffold(
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
                                  width: width/1.13,
                                  height: height/10,
                                  child: GestureDetector(
                                    onTap:() {
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

                                                    SizedBox(
                                                      height: height/5,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField( initialValue: 'Category Name',  decoration: const InputDecoration(
                                                            labelText: 'Edit Name', enabledBorder: OutlineInputBorder()),),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(

                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [

                                                          SlickButton(name: "UPDATE", tap: (){}, borderColor: theme.primary),

                                                          SlickButton(name: "DELETE", tap: (){}, borderColor: theme.error)

                                                        ],


                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                            ),
                                          );
                                      });
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Category ${index+1}"),

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
                            labelText: 'Category Name', enabledBorder: OutlineInputBorder()),),
                      ),
                      ListTile(
                        onTap: _openFilteredCurrencyPickerDialog,
                        title: _buildCurrencyDialogItem(_selectedFilteredDialogCurrency),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SlickButton(name: 'ADD', tap: () {  }, borderColor: theme.primary,)
                      )
                    ],
                  ),
                ),
              ],
              ),
            );
          }
          );

        },  label: const Text("Add Category"),
      ),

    );
  }
  Widget _buildCurrencyDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("${country.currencyCode}"),
      ],
    ),
  );

  void _openFilteredCurrencyPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CurrencyPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your Currency'),
            onValuePicked: (Country country) =>
                setState(() => _selectedFilteredDialogCurrency = country),
            // itemFilter: (c) => ['INR', 'CAD', 'USD', 'CHF', 'EUR']
            //     .contains(c.currencyCode),
            itemBuilder: _buildCurrencyDialogItem)),
  );

  Widget _buildCurrencyDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text("(${country.currencyCode})"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name ?? ''))
    ],
  );

}
