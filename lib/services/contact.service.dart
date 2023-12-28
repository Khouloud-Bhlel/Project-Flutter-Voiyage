import '../model/contact.model.dart';
import '../utils/contact.database.dart';

class ContactService {
  Future<List<Contact>> listeContacts() async {
    List<Map<String, dynamic>> contacts = await ContactDatabase.recuperer();
    return contacts.map((item) => Contact.fromJson(item)).toList();
  }

  Future<bool> ajouterContact(Contact c) async {
    print("Ajout effectué");
    int res = await ContactDatabase.inserer(c);
    return res > 0 ? true : false;
  }

  Future<bool> modifierContact(Contact c) async {
    print("Modif effectuée");
    int res = await ContactDatabase.modifier(c);
    return res > 0 ? true : false;
  }

  Future<bool> supprimerContact(Contact c) async {
    int res = await ContactDatabase.supprimer(c);
    return res > 0 ? true : false;
  }
}
