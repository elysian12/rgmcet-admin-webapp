import 'package:rgmcet_admin/app/common/constants/keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  void setSharedUUID(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeys.sharedUUID, uuid);
  }

  Future<String?> getSharedUUID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeys.sharedUUID);
  }

  //remove
  Future<bool> removeSharedServices() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
