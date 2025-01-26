import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart' as error;
import 'package:analyzer/error/listener.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_dart.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class CustomLintClassDeletePostfixRule extends DartLintRule {
  static const List<String> deletePostfixes = [
    "Impl",
    "Implementation",
    "Model",
  ];

  const CustomLintClassDeletePostfixRule()
      : super(
          code: const LintCode(
            name: 'custom_lint_delete_class_postfix_rule',
            problemMessage: 'This is the description of rule',
            errorSeverity: error.ErrorSeverity.ERROR,
          ),
        );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) =>
      context.registry.addClassDeclaration(
        (
          ClassDeclaration classDeclaration,
        ) {
          final ClassElement? classElement = classDeclaration.declaredElement;
          if (classElement == null) {
            return;
          }

          for (final String postfix in deletePostfixes) {
            if (classElement.displayName.endsWith(
                  postfix,
                ) ==
                false) {
              continue;
            }

            return reporter.atElement(
              classElement,
              code,
            );
          }
        },
      );

  @override
  List<Fix> getFixes() => [
        _Fix(),
      ];
}

class _Fix extends DartFix {
  _Fix();

  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    error.AnalysisError analysisError,
    List<error.AnalysisError> others,
  ) =>
      context.registry.addClassDeclaration(
        (
          ClassDeclaration classDeclaration,
        ) {
          if (analysisError.sourceRange.intersects(
                classDeclaration.sourceRange,
              ) ==
              false) {
            return;
          }

          final ClassElement? classElement = classDeclaration.declaredElement;
          if (classElement == null) {
            return;
          }

          String validName = classElement.displayName;
          for (final String postfix
              in CustomLintClassDeletePostfixRule.deletePostfixes) {
            if (classElement.displayName.endsWith(
                  postfix,
                ) ==
                false) {
              continue;
            }

            validName = validName.substring(
              0,
              validName.length - postfix.length,
            );
          }

          final ChangeBuilder changeBuilder = reporter.createChangeBuilder(
            message: "Fix: Rename to '$validName'",
            priority: 100,
          );
          changeBuilder.addDartFileEdit(
            (
              DartFileEditBuilder builder,
            ) {
              builder.addSimpleReplacement(
                analysisError.sourceRange,
                validName,
              );
            },
          );
        },
      );
}
