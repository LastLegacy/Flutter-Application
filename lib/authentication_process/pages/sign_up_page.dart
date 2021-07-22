import '../widgets/text_field_widget.dart';
import 'package:eventapp/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication_services/authenticaton_service.dart';

class SignUpPage extends StatelessWidget{

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                    ),
                    Container(width: 25,height: 0,),
                    Text("Register", style: kLoginTextStyle,),
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
                          context.read<AuthenticationService>().signUp(
                            email: controllerEmail.text.trim(),
                            password: controllerPassword.text.trim(),
                          );
                          controllerPassword.clear();
                          controllerEmail.clear();
                          Navigator.of(context).pop();
                          //Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Successfully registered!",
                                textAlign: TextAlign.center,
                                style: kSnackBarTextStyle,
                              ),
                              elevation: 2,
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 6,
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("Register", style: kLoginButtonTextStyle,)
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