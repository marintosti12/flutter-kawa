import 'package:arcore_example/views/homeView.dart';
import 'package:arcore_example/services/ArticleAPI.dart';
import 'package:arcore_example/views/articlesView.dart';
import 'package:arcore_example/views/loginView.dart';
import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:arcore_example/widgets/PopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arcore_example/main.dart';

import 'mock/MockArticlesAPI.dart';

void main() {

    testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa" 
ET la page "Inscription utilisateur" 
QUAND on saisie une adresse mail invalide 
ALORS un texte d'erreur s'affiche
''', (WidgetTester tester) async {
      //ETANT DONNEE l'application mobile "Paye ton kawa"
      //ET la page "Inscription" 
      final loginPage = MaterialApp(
        home: const LoginPage(title: "Inscription utilisateur"),
      );
      await tester.pumpWidget(loginPage);

      //QUAND on saisie une adresse mail invalide 
      final emailField = find.widgetWithText(TextFormField, 'Email utilisateur');
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, 'testgmail.com');
      await tester.tap(find.text('Création utilisateur'));
      await tester.pumpWidget(loginPage);
      //ALORS un texte d'erreur s'affiche
      expect(find.text('Veuillez rentrer un email valide'), findsOneWidget);
    });
}
