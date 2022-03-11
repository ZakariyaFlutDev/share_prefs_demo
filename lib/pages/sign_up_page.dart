import 'package:flutter/material.dart';
import 'package:share_prefs_demo/model/account_model.dart';
import 'package:share_prefs_demo/pages/sign_in_page.dart';
import 'package:share_prefs_demo/services/prefs_service.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String id = "sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();

  _doSignUp(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String cpassword = cpasswordController.text.toString().trim();

    Account person = Account.from(name: name, email: email, phone: phone, password: password, cpassword: cpassword);
    Prefs.storeAccount(person);

    Prefs.loadAccount().then((account) => {
      print(account!.name),
      print(account.email),
      print(account.phone),
      print(account.password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black,),
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Let's Get Started!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),),
              SizedBox(height: 20,),
              Text("Create an account to Q Allure to get all features", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 40,),
              //#name
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.person_outline_outlined,),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //#email
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
                      icon: Icon(Icons.email_outlined,),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //#phone
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: phoneController,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.phone_android_outlined,),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //#password
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
              SizedBox(height: 20,),
              //#confirm_password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: cpasswordController,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.lock_outline,),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 50,),
              //#create
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue.shade800
                  ),
                  child: Center(
                    child: Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                ),
                onTap: _doSignUp,
              ),

              SizedBox(height: 80,),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignInPage.id);
                        },
                        child: Text("Log In", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}
