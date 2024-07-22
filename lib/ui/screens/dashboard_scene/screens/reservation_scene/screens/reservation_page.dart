
import 'package:rent_car_dashboard/data/models/reservation_save_model.dart';
import 'package:rent_car_dashboard/data/repositories/reservation_repository.dart';
import 'package:rent_car_dashboard/data/usecases/reservations/reservation_annuler_usecase.dart';
import 'package:rent_car_dashboard/data/usecases/reservations/reservation_sauvegarder_usecase.dart';
import 'package:flutter/material.dart'; 
import 'reservation_liste_page.dart'; 

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});
  
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  String typecar = 'volvo';
  bool client = true;
  bool public = true;
  late final ReservationSauvegarderUseCase reservationSauvegarderUseCase;
  late final ReservationAnnulerUseCase reservationAnnulerUseCase;
  late final ReservationRepository reservationRepository;

  final TextEditingController idReservationController = TextEditingController();
  final TextEditingController idVehiculeController = TextEditingController();
  final TextEditingController idClientController = TextEditingController();
  final TextEditingController raisonSocialeController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController numeroTelephoneController = TextEditingController();
  final TextEditingController matriculeFiscalController = TextEditingController();
  final TextEditingController idDestinationController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController montantTotalController = TextEditingController();
  final TextEditingController montantNetHtController = TextEditingController();
  final TextEditingController modeCautionController = TextEditingController();
  final TextEditingController idBanqueController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController cautionMontantController = TextEditingController();
  final TextEditingController conducteurIdClientController = TextEditingController();
  final TextEditingController numeroPermisController = TextEditingController();
  final TextEditingController idReglementController = TextEditingController();
  final TextEditingController paiementMontantController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final Map<String, String> carImages = {
    'volvo': 'assets/images/volvo.jpg',
    'mercedes': 'assets/images/mercedes.jpg',
    'renault': 'assets/images/renault.jpg',
    'dacia': 'assets/images/dacia.jpg',
  };

  String selectedCarImage = 'assets/images/choix.jpg';

  DateTime? takeTime;
  DateTime? returnTime;
  DateTime? dateDepart;
  DateTime? dateRetour;
  DateTime? dateEcheance;
  DateTime? dateEmission;

  List<ReservationSaveModel> reservations = [];
  @override
  void initState() {
    super.initState();
    reservationRepository = ReservationRepository(); // Initialize your repository

    reservationSauvegarderUseCase = ReservationSauvegarderUseCase(reservationRepository); // Initialize your use case
    reservationAnnulerUseCase = ReservationAnnulerUseCase(reservationRepository); // Initialize your use case
  }

  @override
  void dispose() {
    idReservationController.dispose();
    idVehiculeController.dispose();
    idClientController.dispose();
    raisonSocialeController.dispose();
    adresseController.dispose();
    numeroTelephoneController.dispose();
    matriculeFiscalController.dispose();
    idDestinationController.dispose();
    noteController.dispose();
    montantTotalController.dispose();
    montantNetHtController.dispose();
    modeCautionController.dispose();
    idBanqueController.dispose();
    referenceController.dispose();
    cautionMontantController.dispose();
    conducteurIdClientController.dispose();
    numeroPermisController.dispose();
    idReglementController.dispose();
    paiementMontantController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

 Future<void> _selectDateTime(BuildContext context, DateTime? initialDate, Function(DateTime) onDateTimePicked) async {
  final ThemeData themeData = ThemeData(
    primaryColor: Colors.blue, // Header background color
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.blue),
    colorScheme: const ColorScheme.light(primary: Colors.blue),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.blue, // Button text color
    ),
  );

  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 1),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: themeData,
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData,
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      onDateTimePicked(DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      ));
    }
  }
}


  void _selectDateDepart() async {
    await _selectDateTime(context, dateDepart, (dateTime) {
      setState(() {
        dateDepart = dateTime;
      });
    });
  }

  void _selectDateRetour() async {
    await _selectDateTime(context, dateRetour, (dateTime) {
      setState(() {
        dateRetour = dateTime;
      });
    });
  }

  void _selectDateEcheance() async {
    await _selectDateTime(context, dateEcheance, (dateTime) {
      setState(() {
        dateEcheance = dateTime;
      });
    });
  }

  void _selectDateEmission() async {
    await _selectDateTime(context, dateEmission, (dateTime) {
      setState(() {
        dateEmission = dateTime;
      });
    });
  }
void _submitReservation() {
  reservations.add(ReservationSaveModel(
    idReservation: idReservationController.text.trim(),
    idVehicule: idVehiculeController.text.trim(),
    idClient: idClientController.text.trim(),
    raisonSociale: raisonSocialeController.text.trim(),
    adresse: adresseController.text.trim(),
    numeroTelephone: numeroTelephoneController.text.trim(),
    matriculeFiscal: matriculeFiscalController.text.trim(),
    idDestination: idDestinationController.text.trim(),
    note: noteController.text.trim(),
    montantTotal: double.tryParse(montantTotalController.text) ?? 0.0,
    montantNetHt: double.tryParse(montantNetHtController.text.trim()) ?? 0.0,
    caution: Caution(
      idReservation: '', // Assurez-vous de fournir une valeur appropriée
      modeCaution: modeCautionController.text.trim(),
      idBanque: idBanqueController.text.trim(),
      reference: referenceController.text.trim(),
      dateEcheance: dateEcheance ?? DateTime.now(),
      dateEmission: dateEmission ?? DateTime.now(),
      montant: double.tryParse(cautionMontantController.text.trim()) ?? 0.0,
    ),
    conducteurs: [
      Conducteur(
        idReservation: '', // Assurez-vous de fournir une valeur appropriée
        idClient: conducteurIdClientController.text.trim(),
        numeroPermis: numeroPermisController.text.trim(),
      ),
    ],
    paiements: [
      Paiement(
        idReservation: '', // Assurez-vous de fournir une valeur appropriée
        idReglement: idReglementController.text.trim(),
        montant: double.tryParse(paiementMontantController.text.trim()) ?? 0.0,
      ),
    ],
    dateDepart: dateDepart ?? DateTime.now(), // Assurez-vous que la date est définie
    dateRetour: dateRetour ?? DateTime.now(), // Assurez-vous que la date est définie
  ));

  // Clear all text controllers
  idReservationController.clear();
  idVehiculeController.clear();
  idClientController.clear();
  raisonSocialeController.clear();
  adresseController.clear();
  numeroTelephoneController.clear();
  matriculeFiscalController.clear();
  idDestinationController.clear();
  noteController.clear();
  montantTotalController.clear();
  montantNetHtController.clear();
  modeCautionController.clear();
  idBanqueController.clear();
  referenceController.clear();
  cautionMontantController.clear();
  conducteurIdClientController.clear();
  numeroPermisController.clear();
  idReglementController.clear();
  paiementMontantController.clear();

  // Reset date variables
  dateDepart = null;
  dateRetour = null;
  dateEcheance = null;
  dateEmission = null;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffB81736), Color(0xff281537)],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Formulaire Réservation',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.24,
                  left: 18.0,
                  right: 18.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Type de Voiture :',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        DropdownButton<String>(
                          value: typecar,
                          onChanged: (String? val) {
                            if (val != null) {
                              setState(() {
                                typecar = val;
                                selectedCarImage = carImages[val] ?? '';
                              });
                            }
                          },
                          items: carImages.keys.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Image.asset(
                                    carImages[value]!,
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(value,
                                      style: const TextStyle(
                                          color: Colors.black)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        Image.asset(
                          selectedCarImage,
                          width: 200,
                          height: 200,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: client,
                              onChanged: (bool? value) {
                                setState(() {
                                  client = value!;
                                });
                              },
                            ),
                            const Text('Client',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: public,
                              onChanged: (bool? value) {
                                setState(() {
                                  public = value!;
                                });
                              },
                            ),
                            const Text('Public',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ],
                        ),
                        _buildTextField(
                            'ID Réservation', idReservationController, Icons.person),
                        _buildTextField(
                            'ID Véhicule', idVehiculeController, Icons.directions_car),
                        _buildTextField(
                            'ID Client', idClientController, Icons.person),
                        _buildTextField(
                            'Raison Sociale', raisonSocialeController, Icons.business),
                        _buildTextField(
                            'Adresse', adresseController, Icons.location_on),
                        _buildTextField(
                            'Numéro de Téléphone', numeroTelephoneController, Icons.phone),
                        _buildTextField(
                            'Matricule Fiscal', matriculeFiscalController, Icons.attach_money),
                        _buildTextField(
                            'ID Destination', idDestinationController, Icons.pin_drop),
                        _buildTextField(
                            'Note', noteController, Icons.note),
                        _buildTextField(
                            'Montant Total', montantTotalController, Icons.monetization_on),
                        _buildTextField(
                            'Montant Net HT', montantNetHtController, Icons.money_off),
                        _buildTextField(
                            'Mode Caution', modeCautionController, Icons.warning),
                        _buildTextField(
                            'ID Banque', idBanqueController, Icons.account_balance),
                        _buildTextField(
                            'Référence', referenceController, Icons.receipt),
                        _buildTextField(
                            'Montant de Caution', cautionMontantController, Icons.money),
                        _buildTextField(
                            'ID Client Conducteur', conducteurIdClientController, Icons.person),
                        _buildTextField(
                            'Numéro de Permis', numeroPermisController, Icons.assignment_ind),
                        _buildTextField(
                            'ID Règlement', idReglementController, Icons.assignment_turned_in),
                        _buildTextField(
                            'Montant de Paiement', paiementMontantController, Icons.payment),
                        
                        _buildDateTimePicker(
                            'Date de Départ', dateDepart, _selectDateDepart),
                        _buildDateTimePicker(
                            'Date de Retour', dateRetour, _selectDateRetour),
                        _buildDateTimePicker(
                            'Date d\'Échéance', dateEcheance, _selectDateEcheance),
                        _buildDateTimePicker(
                            'Date d\'Émission', dateEmission, _selectDateEmission),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitReservation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffB81736),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            'Soumettre',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReservationListePage(
          reservations: reservations, // Correct parameter name here
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffB81736),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 50,
      vertical: 20,
    ),
  ),
  child: const Text(
    'Voir Liste des Réservations',
    style: TextStyle(fontSize: 16),
  ),
),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildTextField(String label, TextEditingController controller, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black), // Set text color here
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: 'Entrer $label',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        prefixIcon: Icon(
          iconData,
          color: Colors.grey, // Adjust icon color here
        ),
      ),
    ),
  );
}



  Widget _buildDateTimePicker(String label, DateTime? selectedDateTime, VoidCallback onPressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Adjust text color here
        ),
      ),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.calendar_today),
        label: Text(
          selectedDateTime != null
              ? '${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year}'
              : 'Select a date',
          style: const TextStyle(color: Colors.black), // Adjust button text color here
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.grey, // Button text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    ],
  );
}
}
