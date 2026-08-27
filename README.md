# CineBox

CineBox est une application Flutter moderne conçue pour la découverte et la gestion de films. Elle propose une interface utilisateur soignée permettant d'explorer différentes catégories, de consulter les détails techniques des œuvres et de gérer une liste de favoris.

## Fonctionnalités principales

L'application a été récemment mise à jour pour inclure une refonte majeure de l'interface utilisateur :

### Exploration par Catégories
- Remplacement des listes classiques par une grille moderne (GridView).
- Utilisation de fonds en dégradé et d'icônes spécifiques à chaque genre cinématographique.
- Amélioration de la typographie pour une meilleure hiérarchie visuelle.
- Ajout d'effets visuels au toucher (InkWell) avec gestion des ombres et des arrondis.

### Détails des Films
- Mise en page optimisée utilisant des piles (Stack) pour superposer les éléments.
- Intégration d'animations Hero pour assurer des transitions fluides des affiches entre les écrans.
- Superposition de dégradés sur les images pour garantir la lisibilité du texte.
- Implémentation de badges stylisés pour les notes et les dates de sortie.
- Ajout d'un bouton d'appel à l'action pour le visionnage.

### Gestion des Favoris
- Interface dédiée aux favoris avec une gestion spécifique de l'état vide (Empty State).
- Présentation d'un message descriptif et d'un bouton de navigation pour encourager l'utilisateur à découvrir du contenu.

## Stack Technique

- Framework : Flutter
- Langage : Dart / Kotlin
- Gestion de projet : Gradle (Kotlin DSL)
- Analyse statique : Configuration personnalisée pour exclure les répertoires de build et de plateforme.

## Structure du projet

Le code source est organisé de la manière suivante dans le répertoire lib :

- presentation/screens/categorie.dart : Gestion de la grille des genres.
- presentation/screens/detail.dart : Fiche détaillée des films et animations.
- presentation/screens/favorie.dart : Écran des favoris et gestion de l'état vide.
- presentation/widgets/ : Composants réutilisables tels que les carrousels et les boutons personnalisés.
- data/services/ : Logique de récupération des données via API.

## Installation et Utilisation

1. Cloner le dépôt :
   git clone https://github.com/Ananijosue19/cinebox.git

2. Installer les dépendances :
   flutter pub get

3. Lancer l'application :
   flutter run

## Développeur

Dépôt géré par [Ananijosue19](https://github.com/Ananijosue19/)
