import 'package:arcore_example/views/homeView.dart';
import 'package:arcore_example/services/ArticleAPI.dart';
import 'package:arcore_example/views/articlesView.dart';
import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:arcore_example/widgets/PopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arcore_example/main.dart';

import 'mock/MockArticlesAPI.dart';

void main() {
  group("Page Inscription utilisateur", () {

    testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa"
ET la page d'accueil
QUAND on appuye sur le bouton "Inscription utilisateur"
ALORS une page permettant de saisir une adresse mail s'affiche
ET contient un champ d'entrée pour saisir une adresse mail
''', (WidgetTester tester) async {
      //ETANT DONNEE l'application mobile "Paye ton kawa"
      //ET la page d'accueil
      final homePage = MaterialApp(
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
      await tester.pumpWidget(homePage);

      //QUAND on appuye sur le bouton "Inscription utilisateur"
      final inscriptionButton =
          find.widgetWithText(TextButton, 'Inscription utilisateur');
      await tester.tap(inscriptionButton);

      //ALORS une page permettant de saisir une adresse mail s'affiche
      await tester.pumpAndSettle();

      //ET contient un champ d'entrée pour saisir une adresse mail
      expect(find.widgetWithText(TextFormField, 'Email utilisateur'), findsOneWidget);
    });
  });
}
