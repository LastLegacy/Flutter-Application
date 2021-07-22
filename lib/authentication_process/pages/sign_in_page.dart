import '../authentication_services/authenticaton_service.dart';
import 'sign_up_page.dart';
import '../widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../style_constants.dart';

class SignInPage extends StatelessWidget{

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 85, left: 40),
                child: Row(
                  children: [
                    Icon(Icons.login, color: Colors.white, size: 25,),
                    Container(width: 25,height: 0,),
                    Text("Login", style: kLoginTextStyle,),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 150, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                  gradient: kGradient1
                ),
                width: 400,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    children: [
                      LoginTextField(title: "Email", controller: controllerEmail,),
                      Divider(height: 20,color: Colors.white,),
                      LoginTextField(title: "Password", controller: controllerPassword,),
                      Divider(height: 30,),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthenticationService>().signIn(
                            email: controllerEmail.text.trim(),
                            password: controllerPassword.text.trim(),
                          );
                          controllerPassword.clear();
                          controllerEmail.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 6,
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("Sign in", style: kLoginButtonTextStyle,)
                      ),
                      Divider(height: 20,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => SignUpPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 6,
                          //minimumSize: Size(150, 50),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text("Register", style: kLoginButtonTextStyle,),
                            Container(width: 6, height: 0,),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20,
                            )
                          ],
                        ),

                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}