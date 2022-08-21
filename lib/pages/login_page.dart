import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: dSize.height - bottomPadding,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: dSize.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: dSize.width * 0.6,
                              child: TextFormField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                  label: const Text('username', style: TextStyle(fontSize: 18, color: Color(0xFF48907E)),),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF48907E), width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF48907E), width: 2.0),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'please type username';
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: dSize.width * 0.6,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  label: const Text('password', style: TextStyle(fontSize: 18, color: Color(0xFF48907E)),),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF48907E), width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF48907E), width: 2.0),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'please type password';
                                  }
                                },
                              ),
                            ),

                            ElevatedButton(
                              child: Text('Sign In', style: Theme.of(context).textTheme.headline5,),
                              onPressed: isLoading ? null : ()async{
                                await signIn(_userNameController.text, _passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF48907E),
                                textStyle: const TextStyle(fontSize: 20),
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                minimumSize: Size(dSize.width * 0.6, 34),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signIn(username, password) async{
    setState(() {
      isLoading = true;
    });
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final auth = AuthService();
    final User? user = await auth.signIn(username, password);
    if (user != null){
      if (!mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage(user.email!)));
    }
  }

  void showDoneDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'If sent a verification message, click here',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: Text('verified', style: Theme.of(context).textTheme.headline5,),
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF48907E),
                textStyle: const TextStyle(fontSize: 20),
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minimumSize: Size(34, 34),),
            )
          ],
        ),
      ));
}
