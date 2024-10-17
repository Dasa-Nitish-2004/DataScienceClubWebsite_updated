import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SignInWidget extends StatelessWidget {
  SignInWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return width > 750
        ? Row(
            children: [
              Lottie.asset(
                "assets/animations/siginAnimation.json",
                height: width > 850 ? 400 : 300,
                // width: 400,
              ),
              Container(
                margin: const EdgeInsets.all(30),
                width: 1,
                height: 300,
                color: Colors.black38,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Sign In Admin..",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: width > 950 ? 400 : 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: width > 950 ? 400 : 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        obscureText: true, // To hide password characters
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: button_loading(
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animations/siginAnimation.json",
                height: width > 850 ? 400 : 300,
                // width: 400,
              ),
              Container(
                margin: const EdgeInsets.all(30),
                width: 300,
                height: 1,
                color: Colors.black38,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Sign In Admin..",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: width > 950 ? 400 : 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: width > 950 ? 400 : 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        obscureText: true, // To hide password characters
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: button_loading(
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class button_loading extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  button_loading({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<button_loading> createState() => _button_loadingState();
}

class _button_loadingState extends State<button_loading> {
  bool isClicked = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return isClicked
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: () async {
              final email = widget.emailController.text;
              final pass = widget.passwordController.text;

              if (email.isEmpty || pass.isEmpty) {
                debugPrint("Email or password is empty");
                return;
              }

              setState(() {
                isClicked = true;
              });
              await auth
                  .signInWithEmailAndPassword(email: email, password: pass)
                  .then((value) {
                debugPrint("Successful login");
              }).catchError((error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    "Check Mail and Password Once",
                    style: TextStyle(color: Colors.redAccent[700]),
                  )),
                );
              });
              context.go("/");
              setState(() {
                isClicked = false;
              });
            },
            child: const Text("Login"),
          );
  }
}
