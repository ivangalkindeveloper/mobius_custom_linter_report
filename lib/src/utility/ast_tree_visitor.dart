import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class AstTreeVisitor extends RecursiveAstVisitor<void> {
  const AstTreeVisitor({
    this.onClassDeclaration,
    this.onClassTypeAlias,
    this.onConstructorDeclaration,
    this.onConstructorFieldInitializer,
    this.onDeclaredIdentifier,
    this.onDefaultFormalParameter,
    this.onFieldDeclaration,
    this.onFieldFormalParameter,
    this.onFormalParameterList,
    this.onFunctionDeclaration,
    this.onInstanceCreationExpression,
    this.onMethodDeclaration,
    this.onMethodInvocation,
    this.onPropertyAccess,
    this.onSimpleFormalParameter,
    this.onSimpleIdentifier,
    this.onVariableDeclaration,
  });

  final void Function(
    ClassDeclaration node,
  )? onClassDeclaration;

  final void Function(
    ClassTypeAlias node,
  )? onClassTypeAlias;

  final void Function(
    ConstructorDeclaration node,
  )? onConstructorDeclaration;

  final void Function(
    ConstructorFieldInitializer node,
  )? onConstructorFieldInitializer;

  final void Function(
    DeclaredIdentifier node,
  )? onDeclaredIdentifier;

  final void Function(
    DefaultFormalParameter node,
  )? onDefaultFormalParameter;

  final void Function(
    FieldDeclaration node,
  )? onFieldDeclaration;

  final void Function(
    FieldFormalParameter node,
  )? onFieldFormalParameter;

  final void Function(
    FormalParameterList node,
  )? onFormalParameterList;

  final void Function(
    FunctionDeclaration node,
  )? onFunctionDeclaration;

  final void Function(
    InstanceCreationExpression node,
  )? onInstanceCreationExpression;

  final void Function(
    MethodDeclaration node,
  )? onMethodDeclaration;

  final void Function(
    MethodInvocation node,
  )? onMethodInvocation;

  final void Function(
    PropertyAccess node,
  )? onPropertyAccess;

  final void Function(
    SimpleFormalParameter node,
  )? onSimpleFormalParameter;

  final void Function(
    SimpleIdentifier node,
  )? onSimpleIdentifier;

  final void Function(
    VariableDeclaration node,
  )? onVariableDeclaration;

  @override
  void visitClassDeclaration(
    ClassDeclaration node,
  ) {
    super.visitClassDeclaration(
      node,
    );
    onClassDeclaration?.call(
      node,
    );
  }

  @override
  void visitClassTypeAlias(
    ClassTypeAlias node,
  ) {
    super.visitClassTypeAlias(
      node,
    );
    onClassTypeAlias?.call(
      node,
    );
  }

  @override
  void visitConstructorDeclaration(
    ConstructorDeclaration node,
  ) {
    super.visitConstructorDeclaration(
      node,
    );
    onConstructorDeclaration?.call(
      node,
    );
  }

  @override
  void visitConstructorFieldInitializer(
    ConstructorFieldInitializer node,
  ) {
    super.visitConstructorFieldInitializer(
      node,
    );
    onConstructorFieldInitializer?.call(
      node,
    );
  }

  @override
  void visitDeclaredIdentifier(
    DeclaredIdentifier node,
  ) {
    super.visitDeclaredIdentifier(
      node,
    );
    onDeclaredIdentifier?.call(
      node,
    );
  }

  @override
  void visitDefaultFormalParameter(
    DefaultFormalParameter node,
  ) {
    super.visitDefaultFormalParameter(
      node,
    );
    onDefaultFormalParameter?.call(
      node,
    );
  }

  @override
  void visitFieldDeclaration(
    FieldDeclaration node,
  ) {
    super.visitFieldDeclaration(
      node,
    );
    onFieldDeclaration?.call(
      node,
    );
  }

  @override
  void visitFieldFormalParameter(
    FieldFormalParameter node,
  ) {
    super.visitFieldFormalParameter(
      node,
    );
    onFieldFormalParameter?.call(
      node,
    );
  }

  @override
  void visitFormalParameterList(
    FormalParameterList node,
  ) {
    super.visitFormalParameterList(
      node,
    );
    onFormalParameterList?.call(
      node,
    );
  }

  @override
  void visitFunctionDeclaration(
    FunctionDeclaration node,
  ) {
    super.visitFunctionDeclaration(
      node,
    );
    onFunctionDeclaration?.call(
      node,
    );
  }

  @override
  void visitInstanceCreationExpression(
    InstanceCreationExpression node,
  ) {
    super.visitInstanceCreationExpression(
      node,
    );
    onInstanceCreationExpression?.call(
      node,
    );
  }

  @override
  void visitPropertyAccess(
    PropertyAccess node,
  ) {
    super.visitPropertyAccess(
      node,
    );
    onPropertyAccess?.call(
      node,
    );
  }

  @override
  void visitMethodDeclaration(
    MethodDeclaration node,
  ) {
    super.visitMethodDeclaration(
      node,
    );
    onMethodDeclaration?.call(
      node,
    );
  }

  @override
  void visitMethodInvocation(
    MethodInvocation node,
  ) {
    super.visitMethodInvocation(
      node,
    );
    onMethodInvocation?.call(
      node,
    );
  }

  @override
  void visitSimpleFormalParameter(
    SimpleFormalParameter node,
  ) {
    super.visitSimpleFormalParameter(
      node,
    );
    onSimpleFormalParameter?.call(
      node,
    );
  }

  @override
  void visitSimpleIdentifier(
    SimpleIdentifier node,
  ) {
    super.visitSimpleIdentifier(
      node,
    );
    onSimpleIdentifier?.call(
      node,
    );
  }

  @override
  void visitVariableDeclaration(
    VariableDeclaration node,
  ) {
    super.visitVariableDeclaration(
      node,
    );
    onVariableDeclaration?.call(
      node,
    );
  }
}
