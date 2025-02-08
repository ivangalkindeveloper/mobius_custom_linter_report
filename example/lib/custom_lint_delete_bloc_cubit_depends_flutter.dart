//ignore_for_file: unused_field, edit_constructor_public_named_parameter, delete_bloc_cubit_public_property
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Example1Bloc extends Bloc<String, String> {
  Example1Bloc(
    // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
    this._animationController, {
    // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
    required TextEditingController textEditingController,
    // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
    required this.scrollController,
    // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
  })  : _textEditingController = textEditingController,
        super(
          '',
        );

  // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
  final AnimationController _animationController;
  // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
  final TextEditingController _textEditingController;
  // expect_lint: custom_lint_delete_bloc_cubit_depends_flutter
  final ScrollController scrollController;

  void doSomething() {
    // ignore: avoid_print, prefer_single_quotes
    print("Hello World!");
  }
}
