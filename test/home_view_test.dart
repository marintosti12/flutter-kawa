import 'package:arcore_example/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';


void main() {
  testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa"
QUAND on lance l'application
ALORS l'écran d'accueil contenant 2 boutons et un logo s'affiche
''', (WidgetTester tester) async {
    //ETANT DONNEE l'application mobile "Paye ton kawa"
    //QUAND on lance l'application
    const homePage = MaterialApp(
      home: MyHomePage(title: 'Tester Ecran d\'accueil'),
    );

    await tester.pumpWidget(homePage);

    //ALORS l'écran d'accueil contenant 2 boutons et un logo s'affiche
    expect(find.byType(Image), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Scanner QR Code'), findsOneWidget);
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
    const homePage = MaterialApp(
      home: MyHomePage(title: 'Tester Inscription utilisateur'),
    );
    await tester.pumpWidget(homePage);

    //QUAND on appuye sur le bouton "Inscription utilisateur"
    final inscriptionButton =
        find.widgetWithText(TextButton, 'Inscription utilisateur');
    await tester.tap(inscriptionButton);

    //ALORS une page permettant de saisir une adresse mail s'affiche
    await tester.pumpAndSettle();

    //ET contient un champ d'entrée pour saisir une adresse mail
    expect(find.widgetWithText(TextFormField, 'Email utilisateur'),
        findsOneWidget);
  });

  testWidgets('''
ETANT DONNEE l'application mobile "Paye ton kawa" 
ET la page d'accueil
QUAND on appuye sur le bouton "Scanner QR Code" 
ALORS une page permettant de saisir un QR Code s'affiche 
ET contient un bouton pour allumer la lampe torche 
ET contient un bouton pour changer le type caméra (avant/arrière) 
''', (WidgetTester tester) async {
    //ETANT DONNEE l'application mobile "Paye ton kawa"
    //ET la page d'accueil
    const homePage = MaterialApp(
      home: MyHomePage(title: 'Tester Page QR Code'),
    );
    await tester.pumpWidget(homePage);

    //QUAND on appuye sur le bouton "Scanner QR Code"
    final qrCodeButton = find.widgetWithText(TextButton, 'Scanner QR Code');
    await tester.tap(qrCodeButton);

    //ALORS une page permettant de saisir un QR Code s'affiche 
    await tester.pumpAndSettle();
    expect(find.byType(QRView), findsOneWidget);
    
    //ET contient un bouton pour allumer la lampe torche
    //ET contient un bouton pour changer le type caméra (avant/arrière)
    expect(find.textContaining('Flash:'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsAtLeastNWidgets(2));
  });
}
