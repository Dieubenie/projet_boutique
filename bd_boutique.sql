/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  10/03/2022 15:45:41                      */
/*==============================================================*/


drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Role;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table : Achat                                                */
/*==============================================================*/
create table Achat
(
   code_achat           int not null,
   code_article         int not null,
   date_achat           datetime,
   quantite             int,
   prix_unitaire        float,
   prix_total           float,
   primary key (code_achat)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   code_article         int not null,
   code_categorie       int not null,
   libelle              varchar(254),
   description          varchar(254),
   prix_unitaire        float,
   quantite             int,
   primary key (code_article)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   code_categorie       int not null,
   nom_categorie        varchar(254),
   primary key (code_categorie)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   code_client          int not null,
   code_achat           int not null,
   nom_client           varchar(254),
   prenom_client        varchar(254),
   adresse              varchar(254),
   tel                  int,
   email                varchar(254),
   primary key (code_client)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   code_fournisseur     int not null,
   code_achat           int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   tel                  int,
   email                varchar(254),
   primary key (code_fournisseur)
);

/*==============================================================*/
/* Table : Role                                                 */
/*==============================================================*/
create table Role
(
   code_role            int not null,
   nom_role             varchar(254),
   primary key (code_role)
);

/*==============================================================*/
/* Table : Utilisateur                                          */
/*==============================================================*/
create table Utilisateur
(
   code_utilisateur     int not null,
   code_achat           int not null,
   code_vente           int not null,
   code_role            int not null,
   nom                  varchar(254),
   email                varchar(254),
   mot_de_passe         varchar(254),
   primary key (code_utilisateur)
);

/*==============================================================*/
/* Table : Vente                                                */
/*==============================================================*/
create table Vente
(
   code_vente           int not null,
   code_article         int not null,
   date_vente           datetime,
   quantite             int,
   prix_unitaire        float,
   prix_total           float,
   primary key (code_vente)
);

alter table Achat add constraint FK_Association_4 foreign key (code_article)
      references Article (code_article) on delete restrict on update restrict;

alter table Article add constraint FK_Association_1 foreign key (code_categorie)
      references Categorie (code_categorie) on delete restrict on update restrict;

alter table Client add constraint FK_Association_7 foreign key (code_achat)
      references Achat (code_achat) on delete restrict on update restrict;

alter table Fournisseur add constraint FK_Association_5 foreign key (code_achat)
      references Achat (code_achat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_10 foreign key (code_achat)
      references Achat (code_achat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_6 foreign key (code_role)
      references Role (code_role) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_8 foreign key (code_vente)
      references Vente (code_vente) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_9 foreign key (code_article)
      references Article (code_article) on delete restrict on update restrict;

