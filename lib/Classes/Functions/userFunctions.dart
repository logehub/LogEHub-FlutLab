import 'package:logehub/Classes/Entity/user.dart';

class UserFunctions {
  //Check if the phone no already exists.
  checkPhoneNo(String phoneNo) async {
    return ["200", "Test"];
  }
  /*checkPhoneNo(String phoneNo) async {
    var headers = {
      'Content-Type': 'application/json',
      'api-key':
          'sFJvC53d4Zj3SSCvdVMK3D9I5lcjbI0GBzRewwJ4y29H1CPMCedOHDnEcrlDx1q9',
      'Accept': 'application/json'
    };
    var data = json.encode({
      "dataSource": "Cluster0",
      "database": "logehub",
      "collection": "user",
      "filter": {
        "phoneno": phoneNo,
      }
    });

    var dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 20);
    var response = await dio.request(
      'https://ap-south-1.aws.data.mongodb-api.com/app/data-oblcp/endpoint/data/v1/action/findOne',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    try {
      //Document Details  Received

      Map<String, dynamic> userDocument = response.data;
      //If no Document Received Return with no value
      if (userDocument.values.first == null) {
        return [response.statusCode, response.statusMessage];
      }

      //Get the Id and name from the Document
      //LoginUser.fromJson(userDocument.values.first as Map<String, dynamic>);
      LoginUser user = LoginUser();
      user.fromJson(userDocument.values.first as Map<String, dynamic>);
      //Put the Details in the Session Management
      return [response.statusCode, response.statusMessage];
    } on Exception catch (error) {
      return error.toString();
    }
  }*/

  //If it is a new No, Save the Number.
  /*savePhoneNo(String phoneNo) async {
    var headers = {
      'Content-Type': 'application/json',
      'api-key': 'sFJvC53d4Zj3SSCvdVMK3D9I5lcjbI0GBzRewwJ4y29H1CPMCedOHDnEcrlDx1q9'
    };
    var data = json.encode({
      "dataSource": "Cluster0",
      "database": "logehub",
      "collection": "user",
      "document": {
        "phoneno": phoneNo,
        "enabled": true
      }
    });
    var dio = Dio();
    var response = await dio.request(
      'https://ap-south-1.aws.data.mongodb-api.com/app/data-oblcp/endpoint/data/v1/action/insertOne',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    return [response.statusCode, response.statusMessage];
  }*/

  /*updateProfile(id, name, email, phoneNo) async {
    var headers = {
      'Content-Type': 'application/json',
      'api-key': 'sFJvC53d4Zj3SSCvdVMK3D9I5lcjbI0GBzRewwJ4y29H1CPMCedOHDnEcrlDx1q9',
      'Accept': 'application/json'
    };
    var data = json.encode({
      "dataSource": "Cluster0",
      "database": "logehub",
      "collection": "user",
      "filter": { "_id": { "\$oid": "$id"}},
      "update": {
        "\$set": { "name": "$name",
          "email": "$email"
        }
      }
    });
    var dio = Dio();
    var response = await dio.request(
      'https://ap-south-1.aws.data.mongodb-api.com/app/data-oblcp/endpoint/data/v1/action/updateOne',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    //Document Details Received
    if (response.statusCode.toString() == "200" || response.statusCode.toString() == "201") {
      (UserFunctions()).checkPhoneNo(phoneNo);
    }
  }*/

  /*Future getUser(LoginUser user) async {
    try {
      //Get the details from the Shared Preferences
      if (user.id == "") {
        final Future<SharedPreferences> lPrefs = SharedPreferences.getInstance();
        final SharedPreferences prefs = await lPrefs;

        String phoneNo = prefs.getString("phoneno").toString();
        user.companyId = prefs.getString("companyId").toString();
        user.companyName = prefs.getString("companyName").toString();
        if (phoneNo.isNotEmpty) {
          UserFunctions().checkPhoneNo(phoneNo);
        }
      }
    }
    catch (err) {
      return;
    }
    return;
  }*/
}
