import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/router/router.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn),
        titleSpacing: MediaQuery.of(context).size.width * 0.075,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075),
        child: const _AuthForm(),
      ),
    );
  }
}

class _AuthForm extends StatefulWidget {
  const _AuthForm({super.key});

  @override
  State<_AuthForm> createState() => __AuthFormState();
}

class __AuthFormState extends State<_AuthForm> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? errorUsername;
  String? errorPassword;

  void _auth() {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    print('username: $username, password: $password');

    if (username != 'admin') {
      errorUsername = S.of(context).incorrectUsername;
    } else {
      errorUsername = null;
    }

    if (password != 'admin') {
      errorPassword = S.of(context).incorrectPassword;
    } else {
      errorPassword = null;
    }

    setState(() {});

    if (errorUsername == null && errorPassword == null) {
      AutoRouter.of(context).replace(const NotesListRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.thirdDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.mainGreen),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      isCollapsed: true,
    );

    final errorUsername = this.errorUsername;
    final errorPassword = this.errorPassword;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorUsername != null || errorPassword != null)
              Column(
                children: [
                  if (errorUsername != null)
                    Text(
                      errorUsername,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.mainRed),
                    ),
                  if (errorPassword != null)
                    Text(
                      errorPassword,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.mainRed),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).username,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: usernameTextController,
                  decoration: textFieldDecoration,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).password,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: passwordTextController,
                  decoration: textFieldDecoration,
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: true,
                ),
              ],
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _auth,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.mainGreen),
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.mainTextDark),
                      textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.titleMedium),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    child: Text(S.of(context).logIn),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                Text(S.of(context).dontHaveAnAccount),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.mainGreen),
                      textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.titleMedium),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0),
                      ),
                    ),
                    child: Text(S.of(context).signUp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
