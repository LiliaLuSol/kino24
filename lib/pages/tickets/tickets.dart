import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';
import 'package:kino24/other/app_export.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticatedState) {
            GoRouter.of(context).pushReplacement(AppRoutes.authReg);
          } else if (state is AuthErrorState) {
            context.showsnackbar(title: 'Что-то пошло не так!');
          }
        },
        child: SafeArea(
            child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                resizeToAvoidBottomInset: false,
                body: Container(
                    width: mediaQueryData.size.width,
                    height: mediaQueryData.size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          appTheme.blueP20.withOpacity(0.2),
                          appTheme.blackBack.withOpacity(0.2),
                        ],
                      ),
                    ),
                    // child: Form(
                    //   key: _formKey,
                    child: SizedBox(
                      width: double.maxFinite,
                    )))));
  }
}
