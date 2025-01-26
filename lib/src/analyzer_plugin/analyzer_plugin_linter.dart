import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:mobius_custom_linter_report/src/analyzer_plugin/analyzer_plugin_class_postfix_rule.dart';

class AnalyzerPluginLinter extends ServerPlugin {
  AnalyzerPluginLinter()
      : super(
          resourceProvider: PhysicalResourceProvider.INSTANCE,
        );

  @override
  Future<void> analyzeFile({
    required AnalysisContext analysisContext,
    required String path,
  }) async {
    final SomeResolvedUnitResult unit =
        await analysisContext.currentSession.getResolvedUnit(path);
    final errors = [
      if (unit is ResolvedUnitResult)
        ...validateDeleteClassPostfix(path, unit).map((e) => e.error)
    ];
    channel.sendNotification(
      AnalysisErrorsParams(path, errors).toNotification(),
    );
  }

  @override
  List<String> get fileGlobsToAnalyze => [
        "*.dart",
      ];

  @override
  String get name => "AnalyzerPluginLinter";

  @override
  String get version => "1.0.0";
}
