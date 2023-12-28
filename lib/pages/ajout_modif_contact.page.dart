import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../model/contact.model.dart';
import '../services/contact.service.dart';

class AjoutModifContactPage extends StatefulWidget {
  final Contact? contact;
  final bool modifMode;

  AjoutModifContactPage({this.contact, this.modifMode = false});

  @override
  _AjoutModifContactPageState createState() => _AjoutModifContactPageState();
}

class _AjoutModifContactPageState extends State<AjoutModifContactPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Contact contact =Contact();
  ContactService contactService =ContactService();

  @override
  @override
  void initState() {
    super.initState();
    if (widget.modifMode) {
      contact = widget.contact ?? Contact();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modifMode ? "Modifier Contact" : "Ajouter Contact"),
      ),
      body: Form(
        key: globalKey,
        child: formUI(),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormHelper.submitButton(
              widget.modifMode ? "Modifier" : "Ajouter",
                  () {
                if (validateAndSave()) {
                  if (widget.modifMode) {
                    contactService.modifierContact(contact!).then((value) {
                      Navigator.pop(context);
                    });
                  } else {
                    contactService.ajouterContact(contact!).then((value) {
                      Navigator.pop(context);
                    });
                  }
                }
              },
              borderRadius: 10,
              btnColor: Colors.purpleAccent,
              borderColor: Colors.purpleAccent,
            ),
            FormHelper.submitButton(
              "Annuler",
                  () {
                Navigator.pop(context);
              },
              borderRadius: 10,
              btnColor: Colors.grey,
              borderColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  Widget formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "Nom",
              "Nom",
              contact.nom ?? "", // Utilisation des données du contact
                  (value) {
                if (value.isEmpty) return "* Requis";
                return null;
              },
                  (value) {
                setState(() {
                  contact.nom = value.trim();
                });
              },
              initialValue: contact.nom ?? '', // Initialisation avec les données du contact
              showPrefixIcon: true,
              prefixIcon: Icon(Icons.text_fields),
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
            ),
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "Téléphone",
              "Téléphone",
              contact.tel != null ? contact.tel.toString() : "", // Utilisation des données du contact
                  (value) {
                if (value.isEmpty) return "* Requis";
                return null;
              },
                  (value) {
                setState(() {
                  contact.tel = int.parse(value.trim());
                });
              },
              initialValue: contact.tel != null ? contact.tel.toString() : '', // Initialisation avec les données du contact
              showPrefixIcon: true,
              prefixIcon: Icon(Icons.phone),
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
              isNumeric: true,
            ),
          ],
        ),
      ),
    );
  }


  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

}
