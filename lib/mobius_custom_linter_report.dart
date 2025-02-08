library;

import 'dart:isolate';
import 'package:analyzer_plugin/starter.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mobius_custom_linter_report/src/analyzer_plugin/analyzer_plugin_linter.dart';
import 'package:mobius_custom_linter_report/src/custom_lint/custom_lint_delete_bloc_cubit_depends_flutter_rule.dart';
import 'package:mobius_custom_linter_report/src/custom_lint/custom_lint_delete_class_postfix_rule.dart';

// analyzer_plugin Configuration
// /lib/package_name.dart
void start(Iterable<String> _, SendPort sendPort) {
  ServerPluginStarter(
    AnalyzerPluginLinter(),
  ).start(sendPort);
}

// custom_lint Configuration
// /lib/library_name.dart
PluginBase createPlugin() => _ExampleLinter();

class _ExampleLinter extends PluginBase {
  _ExampleLinter();

  @override
  List<LintRule> getLintRules(
    CustomLintConfigs configs,
  ) =>
      const [
        // Перечисляем написанные правила
        CustomLintClassDeletePostfixRule(),
        CustomLintDeleteBlocCubitDependsFlutterRule(),
      ];
}
