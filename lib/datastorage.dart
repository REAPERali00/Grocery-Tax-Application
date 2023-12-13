import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveNames(List<String> names) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setStringList('grocery', names);
}

Future<List<String>> loadNames() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getStringList('grocery') ?? [];
}
