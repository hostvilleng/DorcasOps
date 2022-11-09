
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'general/allExports.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box authBox;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Hive.initFlutter(); //IMPORTANT

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  authBox = await Hive.openBox('authentication');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white, // navigation bar color
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.white, // status bar color
  statusBarIconBrightness: Brightness.dark
));
      
    return MaterialApp(
        title: DepartmentCompanyData().name,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors().scaffoldColor,
        ),
        home: LoginPage()
        );
  }
}


