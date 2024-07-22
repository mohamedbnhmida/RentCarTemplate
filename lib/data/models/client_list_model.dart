import 'dart:convert';

ClientListModel clientsFromJson(String str) => ClientListModel.fromJson(json.decode(str));

String clientsToJson(ClientListModel data) => json.encode(data.toJson());

class ClientListModel {
    List<Client> client;
    List<dynamic> messages;
    bool succeeded;

    ClientListModel({
        required this.client,
        required this.messages,
        required this.succeeded,
    });

    factory ClientListModel.fromJson(Map<String, dynamic> json) => ClientListModel(
        client: List<Client>.from(json["Client"].map((x) => Client.fromJson(x))),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "Client": List<dynamic>.from(client.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "succeeded": succeeded,
    };
}

class Client {
    String idClient;
    String prenom;
    String nom;
    String raisonSociale;
    String email;
    String fax;
    String nationalite;
    String idPays;
    DateTime dateNaissance;
    String lieuNaissance;
    String numeroPermis;
    DateTime dateLivPermis;
    String numeroCin;
    DateTime dateLivCin;
    String numeroPasseport;
    DateTime dateLivPasseport;
    String idFamilleClient;
    String matriculeFiscal;
    bool estPassager;
    bool estMorale;
    String numeroTelephone;
    String numeroMobile;
    AdresseFacturation adresseFacturation;
    List<Conducteur> conducteurs;

    Client({
        required this.idClient,
        required this.prenom,
        required this.nom,
        required this.raisonSociale,
        required this.email,
        required this.fax,
        required this.nationalite,
        required this.idPays,
        required this.dateNaissance,
        required this.lieuNaissance,
        required this.numeroPermis,
        required this.dateLivPermis,
        required this.numeroCin,
        required this.dateLivCin,
        required this.numeroPasseport,
        required this.dateLivPasseport,
        required this.idFamilleClient,
        required this.matriculeFiscal,
        required this.estPassager,
        required this.estMorale,
        required this.numeroTelephone,
        required this.numeroMobile,
        required this.adresseFacturation,
        required this.conducteurs,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        idClient: json["idClient"],
        prenom: json["prenom"],
        nom: json["nom"],
        raisonSociale: json["raisonSociale"],
        email: json["email"],
        fax: json["fax"],
        nationalite: json["nationalite"],
        idPays: json["idPays"],
        dateNaissance: DateTime.parse(json["dateNaissance"]),
        lieuNaissance: json["lieuNaissance"],
        numeroPermis: json["numeroPermis"],
        dateLivPermis: DateTime.parse(json["dateLivPermis"]),
        numeroCin: json["numeroCin"],
        dateLivCin: DateTime.parse(json["dateLivCin"]),
        numeroPasseport: json["numeroPasseport"],
        dateLivPasseport: DateTime.parse(json["dateLivPasseport"]),
        idFamilleClient: json["idFamilleClient"],
        matriculeFiscal: json["matriculeFiscal"],
        estPassager: json["estPassager"],
        estMorale: json["estMorale"],
        numeroTelephone: json["numeroTelephone"],
        numeroMobile: json["numeroMobile"],
        adresseFacturation: AdresseFacturation.fromJson(json["adresseFacturation"]),
        conducteurs: List<Conducteur>.from(json["conducteurs"].map((x) => Conducteur.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idClient": idClient,
        "prenom": prenom,
        "nom": nom,
        "raisonSociale": raisonSociale,
        "email": email,
        "fax": fax,
        "nationalite": nationalite,
        "idPays": idPays,
        "dateNaissance": dateNaissance.toIso8601String(),
        "lieuNaissance": lieuNaissance,
        "numeroPermis": numeroPermis,
        "dateLivPermis": dateLivPermis.toIso8601String(),
        "numeroCin": numeroCin,
        "dateLivCin": dateLivCin.toIso8601String(),
        "numeroPasseport": numeroPasseport,
        "dateLivPasseport": dateLivPasseport.toIso8601String(),
        "idFamilleClient": idFamilleClient,
        "matriculeFiscal": matriculeFiscal,
        "estPassager": estPassager,
        "estMorale": estMorale,
        "numeroTelephone": numeroTelephone,
        "numeroMobile": numeroMobile,
        "adresseFacturation": adresseFacturation.toJson(),
        "conducteurs": List<dynamic>.from(conducteurs.map((x) => x.toJson())),
    };
}

class AdresseFacturation {
    String libAdresse;
    String codePostal;
    String ville;
    String idPays;

    AdresseFacturation({
        required this.libAdresse,
        required this.codePostal,
        required this.ville,
        required this.idPays,
    });

    factory AdresseFacturation.fromJson(Map<String, dynamic> json) => AdresseFacturation(
        libAdresse: json["libAdresse"],
        codePostal: json["codePostal"],
        ville: json["ville"],
        idPays: json["idPays"],
    );

    Map<String, dynamic> toJson() => {
        "libAdresse": libAdresse,
        "codePostal": codePostal,
        "ville": ville,
        "idPays": idPays,
    };
}

class Conducteur {
    String numeroPermis;
    DateTime dateLivPermis;
    dynamic idCivilite;
    String nom;
    String prenom;
    dynamic nationalite;
    String numeroTelephone;
    dynamic numeroMobile;
    String numeroCin;
    DateTime dateLivCin;
    String numeroPasseport;
    DateTime dateLivPasseport;

    Conducteur({
        required this.numeroPermis,
        required this.dateLivPermis,
        required this.idCivilite,
        required this.nom,
        required this.prenom,
        required this.nationalite,
        required this.numeroTelephone,
        required this.numeroMobile,
        required this.numeroCin,
        required this.dateLivCin,
        required this.numeroPasseport,
        required this.dateLivPasseport,
    });

    factory Conducteur.fromJson(Map<String, dynamic> json) => Conducteur(
        numeroPermis: json["numeroPermis"],
        dateLivPermis: DateTime.parse(json["dateLivPermis"]),
        idCivilite: json["idCivilite"],
        nom: json["nom"],
        prenom: json["prenom"],
        nationalite: json["nationalite"],
        numeroTelephone: json["numeroTelephone"],
        numeroMobile: json["numeroMobile"],
        numeroCin: json["numeroCin"],
        dateLivCin: DateTime.parse(json["dateLivCin"]),
        numeroPasseport: json["numeroPasseport"],
        dateLivPasseport: DateTime.parse(json["dateLivPasseport"]),
    );

    Map<String, dynamic> toJson() => {
        "numeroPermis": numeroPermis,
        "dateLivPermis": dateLivPermis.toIso8601String(),
        "idCivilite": idCivilite,
        "nom": nom,
        "prenom": prenom,
        "nationalite": nationalite,
        "numeroTelephone": numeroTelephone,
        "numeroMobile": numeroMobile,
        "numeroCin": numeroCin,
        "dateLivCin": dateLivCin.toIso8601String(),
        "numeroPasseport": numeroPasseport,
        "dateLivPasseport": dateLivPasseport.toIso8601String(),
    };
}