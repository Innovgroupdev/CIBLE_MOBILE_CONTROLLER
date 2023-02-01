import 'dart:convert';
import 'package:cible_controlleur/constants/api.dart';
import 'package:http/http.dart' as http;

import '../../helpers/sharedPreferences.dart';
import '../../models/Event.dart';

bool getCategorieIsMultiple(code) {
  List listMultiple = ['FOIR', 'FES', 'EXP'];
  return listMultiple.contains(code);
}

getCategorieIsCinema(code) {
  return code == 'CINE';
}

verifyCode(String code/*,int eventId*/) async {
  dynamic deviceId = SharedPreferencesHelper.getDeviceId();
  Map<String, dynamic> data = {
    "code" : code,
    "device_token" : deviceId
};
try{
  var response = await http.post(
      Uri.parse('$baseApiUrl/events/verifycode'),/* eventId*/
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(data));
       
      var finalData = jsonDecode(response.body) as Map;
 print('Respoooooose'+response.body.toString());
      if(finalData['status'] == "success"){
        return true;
      }else{
        return false;
      }
  
}catch(e){
print('Erroree $e');
return false;
}
  
}
