import 'package:flutter/material.dart';
//import 'package:your_app_name/Screen/EntityList.dart';
//import 'package:your_app_name/WayBill/WayBill.dart';
import 'package:logehub/AppBar/AppBar.dart';
//import 'package:your_app_name/Screen/CompanyLocationList.dart';
//import 'package:your_app_name/login/user.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  TextEditingController errorController = TextEditingController();

  //final LoginUser user = LoginUser();

  _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogEHubAppBar(),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          //1st Pane
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: Colors.orange[600]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getContainerMain(context, "Logistics\nNews", "", null, 1.5,
                        1, "news.jpg"),
                    getContainerMain(context, "Logistics\nEvents", "", null,
                        1.5, 1, "events.jpg"),
                  ]),
            ),
          ),

          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  color: Colors.orange[600],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/tricolor.jpg'),
                    fit: BoxFit.fill,
                  )),
              child: ListTile(
                title: Text("Dushyant", //user.companyName,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )),

          //2nd Pane - Waybill and Vehicle
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: Colors.orange[600]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getContainerMain(context, "WayBill\nBookings", "waybill",
                        null, 1.5, 1, "waybill.jpg"),
                    getContainerMain(context, "Vehicle\nTrips", "", null, 1.5,
                        1, "trip.jpg"),
                  ]),
            ),
          ),
          //3rd Pane - Company
          /*Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: Colors.orange[600]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getContainerMain(context, "Company Details", "CompanyList",
                        null, 2, 0.5, "listOfCompanies.jpg"),
                  ]),
            ),
          ),*/
          //3rd Pane - Customer and Consignee
          /*Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: Colors.orange[600]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getContainerMain(context, "Customers", "CustomerList", null,
                        1.5, 0.5, "customer.jpg"),
                    getContainerMain(context, "Consignees", "ConsigneeList",
                        null, 1.5, 0.5, "consignee.jpg"),
                  ]),
            ),
          ),*/
          //4th Pane - Masters
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: Colors.orange[600]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getContainerMain(context, "Masters", "CompanyList", null, 2,
                        1.0, "listOfCompanies.jpg"),
                  ]),
            ),
          ),
          TextField(
            controller: errorController,
            readOnly: true,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  callPage(String page, BuildContext context) {
    //print(page);
    if (page == "waybill") {
      if (!checkLogin(context)) return;
      if (!checkCompany(context)) return;
      try {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => WayBillEntryPage(),));
      } on Exception catch (error) {
        errorController.text = error.toString();
      }
    }
    if (page == "CompanyList") {
      if (!checkLogin(context)) return;
      try {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompanyLocationList(),));
      } on Exception catch (error) {
        errorController.text = error.toString();
      }
    } else if (page == "CustomerList") {
      if (!checkLogin(context)) return;
      try {
        //Navigator.of(context).push(MaterialPageRoute(\builder: (context) => const EntityListScreen(entityType: "Customer"),));
      } on Exception catch (error) {
        errorController.text = error.toString();
      }
    } else if (page == "ConsigneeList") {
      if (!checkLogin(context)) return;
      try {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EntityListScreen(entityType: "Consignee"),));
      } on Exception catch (error) {
        errorController.text = error.toString();
      }
    } else {
      //Do Nothing
    }
  }

  Widget getContainerMain(
      BuildContext context,
      String headerContent,
      String page,
      Color? backcolor,
      double boxWidth,
      double boxHeight,
      String imageName) {
    return Container(
      height: 100 * boxHeight,
      width: 100 * boxWidth,
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: GestureDetector(
          onTap: () => callPage(page, context), // The Call to the Page
          child: Padding(
            padding:
                const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
            child: Row(
              children: [
                Visibility(
                  visible: imageName.isNotEmpty,
                  child: Image.asset('assets/images/$imageName'),
                ),
                Expanded(
                  child: Text(
                    headerContent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  //Redirect to Login Page
  bool checkLogin(BuildContext context) {
    if ("1" == "2") {
      //user.id.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Error"),
            content: Text("Please login."),
          );
        },
      );
      return false;
    }
    return true;
  }

  //Get to Select Company
  bool checkCompany(BuildContext context) {
    if ("1" == "2") {
      //(user.companyId.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Error"),
            content: Text("Please Select Company."),
          );
        },
      );
      return false;
    }
    return true;
  }
}
