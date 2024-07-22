// To parse this JSON data, do
//
//     final vehiculeListModel = vehiculeListModelFromJson(jsonString);

import 'dart:convert';

VehiculeListModel vehiculeListModelFromJson(String str) => VehiculeListModel.fromJson(json.decode(str));

String vehiculeListModelToJson(VehiculeListModel data) => json.encode(data.toJson());

class VehiculeListModel {
    List<Vehicule> vehicules;
    List<dynamic> messages;
    bool succeeded;

    VehiculeListModel({
        required this.vehicules,
        required this.messages,
        required this.succeeded,
    });

    factory VehiculeListModel.fromJson(Map<String, dynamic> json) => VehiculeListModel(
        vehicules: List<Vehicule>.from(json["vehicules"].map((x) => Vehicule.fromJson(x))),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "vehicules": List<dynamic>.from(vehicules.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "succeeded": succeeded,
    };
}

class Vehicule {
    String idVehicule;
    String matricule;
    String idMarque;
    String idModele;
    String idCategorieVehicule;
    String anneeConstruction;
    String idCouleur;
    String numeroSerie;
    String idTypeCarburant;
    DateTime dateAcquisition;
    int prixAchat;
    int kilometrageAcquisition;
    int poids;
    int nbCvadministratives;
    DateTime dateMiseEnService;
    bool estEnService;
    bool bAirClimatise;
    bool bAirbags;
    bool bCruiseControl;
    bool bPosteRadioCd;
    String typeBoiteVitesse;
    int kilometrage;
    DateTime dateExpirationGarantie;
    DateTime dateLimiteExploitation;
    String note;

    Vehicule({
        required this.idVehicule,
        required this.matricule,
        required this.idMarque,
        required this.idModele,
        required this.idCategorieVehicule,
        required this.anneeConstruction,
        required this.idCouleur,
        required this.numeroSerie,
        required this.idTypeCarburant,
        required this.dateAcquisition,
        required this.prixAchat,
        required this.kilometrageAcquisition,
        required this.poids,
        required this.nbCvadministratives,
        required this.dateMiseEnService,
        required this.estEnService,
        required this.bAirClimatise,
        required this.bAirbags,
        required this.bCruiseControl,
        required this.bPosteRadioCd,
        required this.typeBoiteVitesse,
        required this.kilometrage,
        required this.dateExpirationGarantie,
        required this.dateLimiteExploitation,
        required this.note,
    });

    factory Vehicule.fromJson(Map<String, dynamic> json) => Vehicule(
        idVehicule: json["idVehicule"],
        matricule: json["matricule"],
        idMarque: json["idMarque"],
        idModele: json["idModele"],
        idCategorieVehicule: json["idCategorieVehicule"],
        anneeConstruction: json["anneeConstruction"],
        idCouleur: json["idCouleur"],
        numeroSerie: json["numeroSerie"],
        idTypeCarburant: json["idTypeCarburant"],
        dateAcquisition: DateTime.parse(json["dateAcquisition"]),
        prixAchat: json["prixAchat"],
        kilometrageAcquisition: json["kilometrageAcquisition"],
        poids: json["poids"],
        nbCvadministratives: json["nbCvadministratives"],
        dateMiseEnService: DateTime.parse(json["dateMiseEnService"]),
        estEnService: json["estEnService"],
        bAirClimatise: json["bAirClimatise"],
        bAirbags: json["bAirbags"],
        bCruiseControl: json["bCruiseControl"],
        bPosteRadioCd: json["bPosteRadioCd"],
        typeBoiteVitesse: json["typeBoiteVitesse"],
        kilometrage: json["kilometrage"],
        dateExpirationGarantie: DateTime.parse(json["dateExpirationGarantie"]),
        dateLimiteExploitation: DateTime.parse(json["dateLimiteExploitation"]),
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "idVehicule": idVehicule,
        "matricule": matricule,
        "idMarque": idMarque,
        "idModele": idModele,
        "idCategorieVehicule": idCategorieVehicule,
        "anneeConstruction": anneeConstruction,
        "idCouleur": idCouleur,
        "numeroSerie": numeroSerie,
        "idTypeCarburant": idTypeCarburant,
        "dateAcquisition": dateAcquisition.toIso8601String(),
        "prixAchat": prixAchat,
        "kilometrageAcquisition": kilometrageAcquisition,
        "poids": poids,
        "nbCvadministratives": nbCvadministratives,
        "dateMiseEnService": dateMiseEnService.toIso8601String(),
        "estEnService": estEnService,
        "bAirClimatise": bAirClimatise,
        "bAirbags": bAirbags,
        "bCruiseControl": bCruiseControl,
        "bPosteRadioCd": bPosteRadioCd,
        "typeBoiteVitesse": typeBoiteVitesse,
        "kilometrage": kilometrage,
        "dateExpirationGarantie": dateExpirationGarantie.toIso8601String(),
        "dateLimiteExploitation": dateLimiteExploitation.toIso8601String(),
        "note": note,
    };
}
