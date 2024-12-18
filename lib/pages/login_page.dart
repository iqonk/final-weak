import 'package:database/constants/spacing.dart';
import 'package:database/pages/list_page.dart';
import 'package:database/service/database.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Signup",
              style: TextStyle(fontSize: 24),
            ),
            height24,
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
            ),
            height24,
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            height24,
            ElevatedButton(
              onPressed: () async{
                try {
                  await Database().signup(
                    email: emailController.text,
                     password: passwordController.text,
                     );
                  if(context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListPage(),
                        ));
                      }
                    }catch(e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                   
                    }  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                   "signup",
                   style: TextStyle(fontSize: 18), 
                ),
              ),  
          ],
        ),
      ),
    );
  }
}
