# 🛍️ **El-Magueza — E-Commerce Mobile App**

## 📌 **Description**

El-Magueza est une application mobile e-commerce complète développée en **Dart** avec **Flutter** et intégrée à **Firebase**. L'application offre une plateforme mobile intuitive pour l'achat et la vente de produits, avec une authentification sécurisée, un panier d'achat complet et une gestion des commandes.

Le projet combine **développement mobile cross-platform**, **gestion d'état avec Provider**, **intégration Firebase** et **architecture MVC**. 

---

# 🎯 **Objectif du projet**

* Créer une application e-commerce mobile moderne et performante. 
* Offrir une expérience utilisateur fluide et intuitive.
* Gérer l'authentification des utilisateurs de manière sécurisée. 
* Permettre la gestion complète des produits (CRUD).
* Implémenter un système de panier et de commandes fonctionnel. 

---

# 🧠 **Contexte & Problématique**

Les achats en ligne sont devenus incontournables.  Les utilisateurs recherchent des applications mobiles rapides, intuitives et fiables pour effectuer leurs achats. 

El-Magueza résout ce problème en :

* **offrant une interface moderne** et responsive,
* **sécurisant les transactions** via Firebase Authentication,
* **centralisant la gestion** des produits, commandes et utilisateurs,
* **proposant une expérience** fluide sur Android et iOS.

---

# 🏗️ **Architecture du projet**

1. **Authentification**

   * Inscription et connexion utilisateur. 
   * Intégration Firebase Authentication.
   * Gestion des sessions utilisateur.

2. **Gestion des Produits**

   * Affichage catalogue produits.
   * Détails produit avec images et descriptions.
   * Ajout aux favoris.
   * CRUD complet pour les administrateurs.

3. **Panier d'Achat**

   * Ajout/suppression de produits.
   * Calcul automatique du total.
   * Gestion des quantités. 

4. **Système de Commandes**

   * Validation du panier.
   * Historique des commandes.
   * Suivi des commandes.

5. **Gestion d'État**

   * Provider pour la gestion d'état réactive.
   * ChangeNotifier pour les mises à jour UI.

---

# 🛠️ **Technologies utilisées**

**Langages :**

* Dart

**Framework :**

* Flutter

**Backend & Base de données :**

* Firebase Authentication
* Firebase Realtime Database
* Firebase Core

**Gestion d'état :**

* Provider

**HTTP & Networking :**

* HTTP package

---

# 📚 **Compétences mobilisées**

### **Développement Mobile**

* Flutter SDK
* Widgets personnalisés
* Navigation et routing
* Formulaires et validation

### **Gestion d'État**

* Provider pattern
* ChangeNotifier
* Consumer widgets
* State management

### **Backend & Firebase**

* Firebase Authentication
* Realtime Database
* CRUD operations
* Gestion des erreurs HTTP

### **UI/UX**

* Material Design
* Interface responsive
* Animations et transitions
* Composants réutilisables

---

# 🚀 **Fonctionnalités principales**

* 🔐 Authentification sécurisée (Login/Register)
* 🛒 Panier d'achat complet
* 📦 Gestion des commandes
* ⭐ Système de favoris
* 🔍 Catalogue de produits
* 👤 Profil utilisateur
* ✏️ Gestion des produits (Admin)
* 📱 Interface moderne et responsive

---

# 📂 **Structure du projet**

```
/el-magueza
│── /lib
│     ├── /models
│     │     ├── end_user.dart
│     │     ├── http_exceptions. dart
│     ├── /pages
│     │     ├── cart_screen.dart
│     │     ├── edit_product_screen.dart
│     │     ├── home. dart
│     │     ├── login.dart
│     │     ├── orders_screen.dart
│     │     ├── product_detail.dart
│     │     ├── products_overview_screen.dart
│     │     ├── profile.dart
│     │     ├── register.dart
│     │     ├── user_product_screen.dart
│     ├── /providers
│     │     ├── cart. dart
│     │     ├── orders.dart
│     │     ├── product.dart
│     │     ├── product_provider.dart
│     ├── /services
│     │     ├── auth_services.dart
│     ├── /widgets
│     │     ├── app_drawer.dart
│     │     ├── badge.dart
│     │     ├── BezierContainer.dart
│     │     ├── cart_item.dart
│     │     ├── category_item. dart
│     │     ├── order_item.dart
│     │     ├── product_item.dart
│     │     ├── products_grid.dart
│     │     ├── user_product_item.dart
│     │     ├── userApp_drawer.dart
│     ├── main.dart
│     ├── firebase_options.dart
│── /android
│── /ios
│── pubspec.yaml
│── README. md
```

---

# ▶️ **Installation & Exécution**

## 1.  Cloner le projet

```bash
git clone https://github.com/WassimTorjmen/El-Magueza.git
cd El-Magueza
```

## 2. Installer les dépendances Flutter

```bash
flutter pub get
```

## 3. Configurer Firebase

* Créer un projet Firebase. 
* Ajouter les fichiers de configuration (`google-services.json` pour Android, `GoogleService-Info. plist` pour iOS).
* Activer Authentication et Realtime Database.

## 4. Lancer l'application

```bash
flutter run
```

## 5. Build pour production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

---

# 📊 **Exemples d'utilisation**

### Connexion Utilisateur

> L'utilisateur entre ses identifiants et accède à la page principale.

### Ajout au Panier

> Depuis le catalogue, l'utilisateur ajoute un produit à son panier en cliquant sur l'icône. 

### Passage de Commande

```
Panier → Validation → Commande créée → Historique
```

### Gestion Produit (Admin)

```
Liste produits → Édition → Sauvegarde Firebase
```

---

# 🧪 **Tests**

* Tests unitaires des providers
* Tests des widgets
* Tests d'intégration Firebase
* Tests de navigation

---

# 🎯 **Roadmap**

- [ ] Intégration de paiement mobile
- [ ] Notifications push
- [ ] Mode hors ligne
- [ ] Géolocalisation pour livraison
- [ ] Programme de fidélité
- [ ] Multi-langue
- [ ] Mode sombre

---

# 📧 **Contact & Support**

* **Développeur** : Wassim Torjmen
* **Repository** : [GitHub - El-Magueza](https://github.com/WassimTorjmen/El-Magueza)

---

**Merci d'utiliser El-Magueza!  ⭐**
