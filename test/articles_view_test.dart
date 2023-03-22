import 'package:arcore_example/views/articlesView.dart';
import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/MockArticlesAPI.dart';

void main() {
  testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa" 
ET la page "Liste de produits" 
QUAND on sélectionne le 1er élément de la liste 
ALORS une page détaillant les informations du produit s'affiche
''', (WidgetTester tester) async {
    //ETANT DONNEE l'application mobile "Paye ton kawa"
    //ET la page "Liste de produits"
    final mockApi = MockArticlesAPI();
    await tester.pumpWidget(MaterialApp(
        home: ArticlesView(
            title: 'Test Liste des articles',
            articles: mockApi.fetchArticles())));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ArticleItem), findsWidgets);

    //QUAND on sélectionne le 1er élément de la liste
    final machineACafe = find.byType(ArticleItem).first;
    await tester.tap(machineACafe);
    await tester.pumpAndSettle();

    //ALORS une page détaillant les informations du produit s'affiche
    expect(find.text(mockApi.machineACafeExample.description), findsOneWidget);
    expect(find.text(mockApi.machineACafeExample.name), findsOneWidget);
    expect(find.textContaining(mockApi.machineACafeExample.price.toString()), findsOneWidget);
    expect(find.textContaining(mockApi.machineACafeExample.stock.toString()), findsOneWidget);
  });

  testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa" 
ET la page "Liste de produits" 
QUAND on appuye sur le bouton "Voir la modélisation" sur un élément 
ALORS une page affichant la modélisation 3D du produit sélectionné s'affiche 
ET le produit est affiché sous forme d'un modèle en réalité augmentée
''',
      (WidgetTester tester) async {
    // ETANT DONNEE l'application mobile "Paye ton kawa"
    // ET la page "Liste de produits" 
    final mockApi = MockArticlesAPI();
    await tester.pumpWidget(MaterialApp(
        home: ArticlesView(
            title: 'Test Liste des articles',
            articles: mockApi.fetchArticles())));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ArticleItem), findsWidgets);

    // QUAND on appuye sur le bouton "Voir la modélisation" sur un élément 
    final machineACafe = find.byType(ArticleItem).first;
    
    expect(find.byIcon(Icons.visibility_off).first, findsOneWidget);
    final seeModelBtn = find.text('Voir la modélisation').first;
    expect(seeModelBtn, findsOneWidget);
    //await tester.tap(seeModelBtn);
    //await tester.pumpAndSettle();

    //ALORS une page affichant la modélisation 3D du produit sélectionné s'affiche 
    //final modPageFinder = find.byType(LocalAndWebObjectsView);
    //expect(modPageFinder, findsOneWidget);

    // A VOIR POUR TESTER LA PRESENCE D'UN OBJET AVEC ADD/REMOVE LOCAL OBJECT

  });
}
