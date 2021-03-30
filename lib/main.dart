import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/routes.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:firebase_demo/services/authentication.dart';
import 'package:firebase_demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (context) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
      ],
      child: MaterialApp(
        title: 'Firebase Demo',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: WelcomeScreen.routeName,
      ),
    );
  }
}
