import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_prefs_demo/model/user_model.dart';
import 'package:share_prefs_demo/pages/sign_up_page.dart';
import 'package:share_prefs_demo/services/prefs_service.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);


  static const String id = "sign_in_page";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    User user = User.from(email: email, password: password);

    Prefs.storeUser(user);

    Prefs.loadUser().then((value) => {
      print(value!.password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_login.jpg"),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              Text("Welcome back!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),),
              SizedBox(height: 20,),
              Text("Log in to your existant account of Q Allure", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    icon: Icon(Icons.person_outline_outlined,),
                    border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.lock_outline,),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?")
                ],
              ),

              SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueAccent.shade700
                  ),
                  child: Center(
                    child: Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                onTap: _doLogin,
              ),
              SizedBox(height: 30,),
              Text("Or connect using", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade900
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("f", style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                          SizedBox(width: 10,),
                          Text("Facebook", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("G", style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text("Google", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ? ", style: TextStyle(fontSize: 15, color: Colors.black),),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
