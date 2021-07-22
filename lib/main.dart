import 'authentication_process/authentication_services/authenticaton_service.dart';
import 'authentication_process/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> firebaseEventapp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(6,47,103,175),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
            future: firebaseEventapp,
            builder: (context, snapshot){
              if (snapshot.hasData){
                return AuthenticationWrapper();
              }
              else if (snapshot.hasError){
                print(snapshot.error.toString());
                return Text("There is an Error! ${snapshot.error.toString()}");
              }
              else{
                return Center(
                    child: CircularProgressIndicator()
                );
              }
            },

          )
      ),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null){
      return MyHomePage();
    }
    return SignInPage();
  }
}