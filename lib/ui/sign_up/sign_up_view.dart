import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: ReverseRoundedAppBar(),
        body: Column(),
      );
}
