import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/error/error.dart' as error;

class CustomLintTemplateRule extends DartLintRule {
  const CustomLintTemplateRule()
      : super(
          code: const LintCode(
            name: 'custom_lint_template_rule',
            problemMessage: 'This is the description of rule',
            errorSeverity: error.ErrorSeverity.ERROR,
          ),
        );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Логика правила
  }

  // Список фиксов, предоставляемое для правила
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
  ) {
    // Логика фикса
  }
}
