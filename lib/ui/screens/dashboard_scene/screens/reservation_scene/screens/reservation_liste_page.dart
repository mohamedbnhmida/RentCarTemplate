import 'package:rent_car_dashboard/data/models/reservation_save_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; 
class ReservationListePage extends StatefulWidget {
  final List<ReservationSaveModel> reservations;

  const ReservationListePage({super.key, 
    required this.reservations,
  });

  @override
  _ReservationListePageState createState() => _ReservationListePageState();
}

class _ReservationListePageState extends State<ReservationListePage> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Réservations'),
      ),
      body: ListView.builder(
        itemCount: widget.reservations.length,
        itemBuilder: (context, index) {
          final reservation = widget.reservations[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Réservation ${index + 1}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  _buildListItem('ID Réservation', reservation.idReservation),
                  _buildListItem('ID Véhicule', reservation.idVehicule),
                  _buildListItem('ID Client', reservation.idClient),
                  _buildListItem('Raison Sociale', reservation.raisonSociale),
                  _buildListItem('Adresse', reservation.adresse),
                  _buildListItem('Numéro de Téléphone', reservation.numeroTelephone),
                  _buildListItem('Matricule Fiscal', reservation.matriculeFiscal),
                  _buildDateTimeListItem('Date de Départ', reservation.dateDepart),
                  _buildDateTimeListItem('Date de Retour', reservation.dateRetour),
                  _buildListItem('ID Destination', reservation.idDestination),
                  _buildListItem('Note', reservation.note),
                  _buildListItem('Montant Total', reservation.montantTotal.toString()),
                  _buildListItem('Montant Net HT', reservation.montantNetHt.toString()),
                  _buildListItem('Caution Mode', reservation.caution.modeCaution),
                  _buildListItem('Caution Banque ID', reservation.caution.idBanque),
                  _buildListItem('Caution Référence', reservation.caution.reference),
                  _buildDateTimeListItem('Date d\'Échéance', reservation.caution.dateEcheance),
                  _buildDateTimeListItem('Date d\'Émission', reservation.caution.dateEmission),
                  _buildListItem('Caution Montant', reservation.caution.montant.toString()),
                  _buildListItem('Conducteurs', reservation.conducteurs.map((e) => e.idClient).join(', ')),
                  _buildListItem('Paiements', reservation.paiements.map((e) => e.idReglement).join(', ')),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _deleteReservation(index);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Supprimer'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          _modifyReservation(index);
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Modifier'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title : ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeListItem(String title, DateTime? dateTime) {
    String displayDateTime = 'Non défini';
    if (dateTime != null) {
      displayDateTime = '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title : ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              displayDateTime,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteReservation(int index) async {
    final reservation = widget.reservations[index];
    try {
      // Replace with your actual API endpoint
      final response = await _dio.delete('https://api.example.com/reservations/${reservation.idReservation}');
      if (response.statusCode == 200) {
        setState(() {
          widget.reservations.removeAt(index);
        });
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete reservation')),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete reservation: $e')),
      );
    }
  }

  Future<void> _modifyReservation(int index) async {
    final reservation = widget.reservations[index];

    // Show dialog to modify reservation
    final modifiedReservation = await showDialog<ReservationSaveModel>(
      context: context,
      builder: (context) => ModifyReservationDialog(reservation: reservation),
    );

    if (modifiedReservation != null) {
      try {
        // Replace with your actual API endpoint
        final response = await _dio.put(
          'https://api.example.com/reservations/${reservation.idReservation}',
          data: modifiedReservation.toJson(), // Ensure you have a toJson method in your Reservation model
        );
        if (response.statusCode == 200) {
          setState(() {
            widget.reservations[index] = modifiedReservation;
          });
        } else {
          // Handle error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to modify reservation')),
          );
        }
      } catch (e) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to modify reservation: $e')),
        );
      }
    }
  }
}

class ModifyReservationDialog extends StatelessWidget {
  final ReservationSaveModel reservation;

  const ModifyReservationDialog({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    TextEditingController vehiculeIdController = TextEditingController(text: reservation.idVehicule);
    TextEditingController clientIdController = TextEditingController(text: reservation.idClient);
    TextEditingController raisonSocialeController = TextEditingController(text: reservation.raisonSociale);
    TextEditingController adresseController = TextEditingController(text: reservation.adresse);
    TextEditingController numeroTelephoneController = TextEditingController(text: reservation.numeroTelephone);
    TextEditingController matriculeFiscalController = TextEditingController(text: reservation.matriculeFiscal);
    TextEditingController idDestinationController = TextEditingController(text: reservation.idDestination);
    TextEditingController noteController = TextEditingController(text: reservation.note);

    return AlertDialog(
      title: const Text('Modifier la Réservation'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: vehiculeIdController,
              decoration: const InputDecoration(labelText: 'ID Véhicule'),
            ),
            TextField(
              controller: clientIdController,
              decoration: const InputDecoration(labelText: 'ID Client'),
            ),
            TextField(
              controller: raisonSocialeController,
              decoration: const InputDecoration(labelText: 'Raison Sociale'),
            ),
            TextField(
              controller: adresseController,
              decoration: const InputDecoration(labelText: 'Adresse'),
            ),
            TextField(
              controller: numeroTelephoneController,
              decoration: const InputDecoration(labelText: 'Numéro de Téléphone'),
            ),
            TextField(
              controller: matriculeFiscalController,
              decoration: const InputDecoration(labelText: 'Matricule Fiscal'),
            ),
            TextField(
              controller: idDestinationController,
              decoration: const InputDecoration(labelText: 'ID Destination'),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Note'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            reservation.idVehicule = vehiculeIdController.text;
            reservation.idClient = clientIdController.text;
            reservation.raisonSociale = raisonSocialeController.text;
            reservation.adresse = adresseController.text;
            reservation.numeroTelephone = numeroTelephoneController.text;
            reservation.matriculeFiscal = matriculeFiscalController.text;
            reservation.idDestination = idDestinationController.text;
            reservation.note = noteController.text;

            Navigator.of(context).pop(reservation); 
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}
