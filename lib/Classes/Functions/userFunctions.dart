import 'package:flutter/foundation.dart';
import 'package:logehub/DioClass/dio.dart';
import 'package:logehub/Classes/Entity/user.dart';

class UserFunctions {
  DioClass dioClass = DioClass();

  //Check if the phone no already exists.
  checkPhoneNo(String phoneNo) async {
    String filter = Uri.encodeFull('{"phoneno":{"equals":"$phoneNo"}}');
    var apiResponse =
        await dioClass.getDioResponse(filter.replaceAll(':', '%3A'), "1");
    print(apiResponse[0]);
    LoginUser user = LoginUser();
    if (apiResponse[0] == "1") {
      //print(apiResponse[1]);
      try {
        Map<String, dynamic> userMap = apiResponse[1] as Map<String, dynamic>;
        //print(userMap.values.first[0]);
        user.fromJson(userMap.values.first[0]);
      } on Exception catch (error) {
        print(error.toString());
      }
    }
  }

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
