// To parse this JSON data, do
//
//     final reservationSaveModel = reservationSaveModelFromJson(jsonString);

import 'dart:convert';


ReservationSaveModel reservationSaveModelFromJson(String str) => ReservationSaveModel.fromJson(json.decode(str));

String reservationSaveModelToJson(ReservationSaveModel data) => json.encode(data.toJson());

class ReservationSaveModel {
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
    double montantTotal;
    double montantNetHt;
    Caution caution;
    List<Conducteur> conducteurs;
    List<Paiement> paiements;

    ReservationSaveModel({
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

    factory ReservationSaveModel.fromJson(Map<String, dynamic> json) => ReservationSaveModel(
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
        caution: Caution.fromJson(json["caution"]),
        conducteurs: List<Conducteur>.from(json["conducteurs"].map((x) => Conducteur.fromJson(x))),
        paiements: List<Paiement>.from(json["paiements"].map((x) => Paiement.fromJson(x))),
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
        "caution": caution.toJson(),
        "conducteurs": List<dynamic>.from(conducteurs.map((x) => x.toJson())),
        "paiements": List<dynamic>.from(paiements.map((x) => x.toJson())),
    };
}

class Caution {
    String idReservation;
    String modeCaution;
    String idBanque;
    String reference;
    DateTime dateEcheance;
    DateTime dateEmission;
    double montant;

    Caution({
        required this.idReservation,
        required this.modeCaution,
        required this.idBanque,
        required this.reference,
        required this.dateEcheance,
        required this.dateEmission,
        required this.montant,
    });

    factory Caution.fromJson(Map<String, dynamic> json) => Caution(
        idReservation: json["idReservation"],
        modeCaution: json["modeCaution"],
        idBanque: json["idBanque"],
        reference: json["reference"],
        dateEcheance: DateTime.parse(json["dateEcheance"]),
        dateEmission: DateTime.parse(json["dateEmission"]),
        montant: json["montant"],
    );

    Map<String, dynamic> toJson() => {
        "idReservation": idReservation,
        "modeCaution": modeCaution,
        "idBanque": idBanque,
        "reference": reference,
        "dateEcheance": dateEcheance.toIso8601String(),
        "dateEmission": dateEmission.toIso8601String(),
        "montant": montant,
    };
}

class Conducteur {
    String idReservation;
    String idClient;
    String numeroPermis;

    Conducteur({
        required this.idReservation,
        required this.idClient,
        required this.numeroPermis,
    });

    factory Conducteur.fromJson(Map<String, dynamic> json) => Conducteur(
        idReservation: json["idReservation"],
        idClient: json["idClient"],
        numeroPermis: json["numeroPermis"],
    );

    Map<String, dynamic> toJson() => {
        "idReservation": idReservation,
        "idClient": idClient,
        "numeroPermis": numeroPermis,
    };
}

class Paiement {
    String idReservation;
    String idReglement;
    double montant;

    Paiement({
        required this.idReservation,
        required this.idReglement,
        required this.montant,
    });

    factory Paiement.fromJson(Map<String, dynamic> json) => Paiement(
        idReservation: json["idReservation"],
        idReglement: json["idReglement"],
        montant: json["montant"],
    );

    Map<String, dynamic> toJson() => {
        "idReservation": idReservation,
        "idReglement": idReglement,
        "montant": montant,
    };
}
