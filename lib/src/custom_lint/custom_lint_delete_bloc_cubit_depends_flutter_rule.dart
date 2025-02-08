import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_dart.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/error/error.dart' as error;
import 'package:mobius_custom_linter_report/src/utility/ast_tree_visitor.dart';

const TypeChecker blocTypeChecker = TypeChecker.fromName(
  "Bloc",
  packageName: "bloc",
);
const TypeChecker cubitTypeChecker = TypeChecker.fromName(
  "Cubit",
  packageName: "bloc",
);

class CustomLintDeleteBlocCubitDependsFlutterRule extends DartLintRule {
  const CustomLintDeleteBlocCubitDependsFlutterRule()
      : super(
          code: const LintCode(
            name: 'custom_lint_delete_bloc_cubit_depends_flutter',
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

          if (!blocTypeChecker.isAssignableFrom(
                classElement,
              ) &&
              !cubitTypeChecker.isAssignableFrom(
                classElement,
              )) {
            return;
          }

          _visitChildren(
            reporter: reporter,
            classDeclaration: classDeclaration,
          );
        },
      );

  void _visitChildren({
    required ErrorReporter reporter,
    required ClassDeclaration classDeclaration,
  }) =>
      classDeclaration.visitChildren(
        AstTreeVisitor(
          onConstructorDeclaration: (
            ConstructorDeclaration constructorDeclaration,
          ) {
            for (final FormalParameter parameter
                in constructorDeclaration.parameters.parameters) {
              final ParameterElement? parameterElement =
                  parameter.declaredElement;
              if (parameterElement == null) {
                continue;
              }

              if (_validate(
                    packageName:
                        parameterElement.type.element?.library?.identifier,
                  ) ==
                  false) {
                continue;
              }

              reporter.atElement(
                parameterElement,
                code,
              );
            }

            constructorDeclaration.visitChildren(
              AstTreeVisitor(
                onConstructorFieldInitializer: (
                  ConstructorFieldInitializer constructorFieldInitializer,
                ) {
                  final DartType? staticType =
                      constructorFieldInitializer.expression.staticType;
                  if (staticType == null) {
                    return;
                  }

                  if (_validate(
                        packageName: staticType.element?.library?.identifier,
                      ) ==
                      false) {
                    return;
                  }

                  reporter.atNode(
                    constructorFieldInitializer,
                    code,
                  );
                },
              ),
            );
          },
          onFieldDeclaration: (
            FieldDeclaration fieldDeclaration,
          ) {
            for (final VariableDeclaration variable
                in fieldDeclaration.fields.variables) {
              final VariableElement? variableElement = variable.declaredElement;
              if (variableElement == null) {
                continue;
              }

              if (_validate(
                    packageName:
                        variableElement.type.element?.library?.identifier,
                  ) ==
                  false) {
                continue;
              }

              reporter.atNode(
                fieldDeclaration,
                code,
              );
            }
          },
        ),
      );

  bool _validate({
    required String? packageName,
  }) =>
      (packageName?.startsWith(
            "package:flutter/",
          ) ??
          false);

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
    context.registry.addConstructorDeclaration(
      (
        ConstructorDeclaration constructorDeclaration,
      ) {
        if (analysisError.sourceRange.intersects(
              constructorDeclaration.sourceRange,
            ) ==
            false) {
          return;
        }

        for (final FormalParameter formalParameter
            in constructorDeclaration.parameters.parameters) {
          if (analysisError.sourceRange.intersects(
                formalParameter.sourceRange,
              ) ==
              false) {
            continue;
          }

          final ParameterElement? parameterElement =
              formalParameter.declaredElement;
          if (parameterElement == null) {
            continue;
          }

          final ChangeBuilder changeBuilder = reporter.createChangeBuilder(
            message: "Fix: Delete '${parameterElement.displayName}'",
            priority: 100,
          );
          changeBuilder.addDartFileEdit(
            (
              DartFileEditBuilder builder,
            ) =>
                builder.addDeletion(
              SourceRange(
                formalParameter.sourceRange.offset,
                formalParameter.endToken.next?.type == TokenType.COMMA
                    ? (formalParameter.sourceRange.length + 1)
                    : formalParameter.sourceRange.length,
              ),
            ),
          );
        }
      },
    );
    context.registry.addConstructorFieldInitializer(
      (
        ConstructorFieldInitializer constructorFieldInitializer,
      ) {
        if (analysisError.sourceRange.intersects(
              constructorFieldInitializer.sourceRange,
            ) ==
            false) {
          return;
        }

        final ChangeBuilder changeBuilder = reporter.createChangeBuilder(
          message: "Fix: Delete '${constructorFieldInitializer.fieldName}'",
          priority: 100,
        );
        changeBuilder.addDartFileEdit(
          (
            DartFileEditBuilder builder,
          ) =>
              builder.addDeletion(
            SourceRange(
              constructorFieldInitializer.sourceRange.offset,
              constructorFieldInitializer.endToken.next?.type == TokenType.COMMA
                  ? (constructorFieldInitializer.sourceRange.length + 1)
                  : constructorFieldInitializer.sourceRange.length,
            ),
          ),
        );
      },
    );
    context.registry.addFieldDeclaration(
      (
        FieldDeclaration fieldDeclaration,
      ) {
        if (analysisError.sourceRange.intersects(
              fieldDeclaration.sourceRange,
            ) ==
            false) {
          return;
        }

        for (final VariableDeclaration variable
            in fieldDeclaration.fields.variables) {
          if (analysisError.sourceRange.intersects(
                variable.sourceRange,
              ) ==
              false) {
            continue;
          }

          final VariableElement? variableElement = variable.declaredElement;
          if (variableElement == null) {
            continue;
          }

          final ChangeBuilder changeBuilder = reporter.createChangeBuilder(
            message: "Fix: Delete '${variableElement.displayName}'",
            priority: 100,
          );
          changeBuilder.addDartFileEdit(
            (
              DartFileEditBuilder builder,
            ) =>
                builder.addDeletion(
              analysisError.sourceRange,
            ),
          );
        }
      },
    );
  }
}
