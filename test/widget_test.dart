// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:arcore_example/views/homeView.dart';
import 'package:arcore_example/services/ArticleAPI.dart';
import 'package:arcore_example/views/articlesView.dart';
import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:arcore_example/widgets/PopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arcore_example/main.dart';

import 'MockArticlesAPI.dart';

void main() {
  group("Page d'accueil - Tests Widget", () {
    testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa"
QUAND on lance l'application
ALORS l'écran d'accueil contenant 2 boutons et un logo s'affiche
''', (WidgetTester tester) async {
      //ETANT DONNEE l'application mobile "Paye ton kawa"
      //QUAND on lance l'application
      final homePage = MaterialApp(
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );

      await tester.pumpWidget(homePage);

      //ALORS l'écran d'accueil contenant 2 boutons et un logo s'affiche
      expect(find.byType(Image), findsOneWidget);
      expect(
          find.widgetWithText(TextButton, 'Scanner QR Code'), findsOneWidget);
      expect(find.widgetWithText(TextButton, 'Inscription utilisateur'),
          findsOneWidget);
    });

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
      final inscriptionButton = find.widgetWithText(TextButton, 'Inscription utilisateur');
      await tester.tap(inscriptionButton);

      //ALORS une page permettant de saisir une adresse mail s'affiche
      await tester.pumpAndSettle();

      //ET contient un champ d'entrée pour saisir une adresse mail
      expect(find.widgetWithText(TextFormField, 'Email utilisateur'), findsOneWidget);
    });

    testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa"
ET la page "Liste de produits"
QUAND on appuye sur le bouton "I" (Informations) sur le 1er élément de la liste
ALORS une pop up contenant la description du produit s'affiche
''', (WidgetTester tester) async {
      //ETANT DONNEE l'application mobile "Paye ton kawa"
      //ET la page "Liste de produits"
      /*final mockApi = MockArticlesAPI();
      await tester.pumpWidget(MaterialApp(
          home: ArticlesView(
              title: 'Test Liste des articles'//,
              /*articles: mockApi.fetchArticles()*/)));
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ArticleItem), findsWidgets);

      //QUAND on appuye sur le bouton "I" (Informations) sur le 1er élément de la liste
      final machineACafe = find.byType(ArticleItem).first;
      final informationsButton = find.byIcon(Icons.info_rounded).first;
      await tester.tap(informationsButton);
      await tester.pumpAndSettle();

      //ALORS une pop up contenant la description du produit s'affiche
      expect(find.byType(PopUp), findsOneWidget);
      expect(
          find.text(mockApi.machineACafeExample.description), findsOneWidget);*/
    });
  });
}
