import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';

Iterable<AnalysisErrorFixes> validateDeleteClassPostfix(
  String path,
  ResolvedUnitResult unit,
) sync* {
  final LibraryElement lib = unit.libraryElement;
  final Iterable<ClassElement> topLevelClasses =
      lib.topLevelElements.whereType<ClassElement>();
  for (final ClassElement element in topLevelClasses) {
    if (element.name.endsWith("Model")) {
      final Location location = Location(
        path,
        element.nameOffset,
        element.nameLength,
        0,
        0,
      );

      yield AnalysisErrorFixes(
        AnalysisError(
          AnalysisErrorSeverity.ERROR,
          AnalysisErrorType.SYNTACTIC_ERROR,
          location,
          "Delete postfix in class",
          "custom_lint_delete_class_postfix_rule",
          correction: "Rename class",
          hasFix: true,
        ),
      );
    }
  }
}
