import 'package:smartwallet/models/contact/contact_response.dart';

class ContactViewModel {
  List<ContactResponse> contactItems;
  ContactViewModel({this.contactItems});

  getContacts() =>
      <ContactResponse>[
        ContactResponse(
          name: 'K & A',
          address: 'London,UK',
          mobile: '+441332408058',
          websiteName: 'https://fluttertutorial.in',
        )
      ];
}
