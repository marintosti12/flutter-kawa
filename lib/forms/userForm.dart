import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arcore_example/services/CustomersAPI.dart';
import "package:arcore_example/widgets/PopUp.dart";

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email utilisateur',
              ),
              validator: (value) {
                if (!value!.contains('@') || value.isEmpty) {
                  return 'Veillez rentrer un email valide';
                }
                CustomerAPI().createUser(value).then((bool result) {
                  if (result) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const PopUp(
                        title: 'Information',
                        message: "L'utilisateur a bien été créer",
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const PopUp(
                        title: 'Erreur',
                        message:
                            "Une erreur est survenue lors de la création de l'utilisateur",
                      ),
                    );
                  }
                });
                return null;
              },
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                    'Création utilisateur',
                    style: GoogleFonts.montserrat(fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
