// To parse this JSON data, do
//
//     final reservations = reservationsFromJson(jsonString);

import 'dart:convert';

ReservationListModel reservationListModelFromJson(String str) => ReservationListModel.fromJson(json.decode(str));

String reservationListModelToJson(ReservationListModel data) => json.encode(data.toJson());

class ReservationListModel {
    List<Reservation> reservation;
    List<dynamic> messages;
    bool succeeded;

    ReservationListModel({
        required this.reservation,
        required this.messages,
        required this.succeeded,
    });

    factory ReservationListModel.fromJson(Map<String, dynamic> json) => ReservationListModel(
        reservation: List<Reservation>.from(json["Reservation"].map((x) => Reservation.fromJson(x))),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "Reservation": List<dynamic>.from(reservation.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "succeeded": succeeded,
    };
}

class Reservation {
    String idReservation;
    String idVehicule;
    String idClient;
    String raisonSociale;
    String adresse;
    String numeroTelephone;
    String matriculeFiscal;
    DateTime dateDepart;
    DateTime dateRetour;
    String idDestination;
    String note;
    int montantTotal;
    int montantNetHt;
    dynamic caution;
    List<dynamic> conducteurs;
    List<dynamic> paiements;

    Reservation({
        required this.idReservation,
        required this.idVehicule,
        required this.idClient,
        required this.raisonSociale,
        required this.adresse,
        required this.numeroTelephone,
        required this.matriculeFiscal,
        required this.dateDepart,
        required this.dateRetour,
        required this.idDestination,
        required this.note,
        required this.montantTotal,
        required this.montantNetHt,
        required this.caution,
        required this.conducteurs,
        required this.paiements,
    });

    factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idReservation: json["idReservation"],
        idVehicule: json["idVehicule"],
        idClient: json["idClient"],
        raisonSociale: json["raisonSociale"],
        adresse: json["adresse"],
        numeroTelephone: json["numeroTelephone"],
        matriculeFiscal: json["matriculeFiscal"],
        dateDepart: DateTime.parse(json["dateDepart"]),
        dateRetour: DateTime.parse(json["dateRetour"]),
        idDestination: json["idDestination"],
        note: json["note"],
        montantTotal: json["montantTotal"],
        montantNetHt: json["montantNetHt"],
        caution: json["caution"],
        conducteurs: List<dynamic>.from(json["conducteurs"].map((x) => x)),
        paiements: List<dynamic>.from(json["paiements"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "idReservation": idReservation,
        "idVehicule": idVehicule,
        "idClient": idClient,
        "raisonSociale": raisonSociale,
        "adresse": adresse,
        "numeroTelephone": numeroTelephone,
        "matriculeFiscal": matriculeFiscal,
        "dateDepart": dateDepart.toIso8601String(),
        "dateRetour": dateRetour.toIso8601String(),
        "idDestination": idDestination,
        "note": note,
        "montantTotal": montantTotal,
        "montantNetHt": montantNetHt,
        "caution": caution,
        "conducteurs": List<dynamic>.from(conducteurs.map((x) => x)),
        "paiements": List<dynamic>.from(paiements.map((x) => x)),
    };
}
