
import 'dart:convert';

VehiculeSaveModel vehiculeSaveModelFromJson(String str) => VehiculeSaveModel.fromJson(json.decode(str));

String vehiculeSaveModelToJson(VehiculeSaveModel data) => json.encode(data.toJson());

class VehiculeSaveModel {
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
    double prixAchat;
    double kilometrageAcquisition;
    double poids;
    int nbCvadministratives;
    DateTime dateMiseEnService;
    bool estEnService;
    bool bAirClimatise;
    bool bAirbags;
    bool bCruiseControl;
    bool bPosteRadioCd;
    String typeBoiteVitesse;
    double kilometrage;
    DateTime dateExpirationGarantie;
    DateTime dateLimiteExploitation;
    String note;

    VehiculeSaveModel({
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

    factory VehiculeSaveModel.fromJson(Map<String, dynamic> json) => VehiculeSaveModel(
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
