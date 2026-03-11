# 💸 iExpense

Application iOS de suivi des dépenses personnelles et professionnelles, développée avec **SwiftUI** et **SwiftData**.

`Swift` `iOS` `SwiftUI` `SwiftData`

## 📱 Aperçu

<div align="center">
  <img src="./assets/demo.gif" width="300" alt="iExpense Demo">
</div>

## ✨ Fonctionnalités

- 💵 Ajout de dépenses avec nom, type et montant
- 🏷️ Catégorisation (Personal / Business)
- 🔍 Filtrage par type de dépense
- 🔄 Tri multi-critères (nom A-Z / Z-A, montant croissant / décroissant)
- 🗑️ Suppression par swipe
- 💾 Persistance automatique avec SwiftData
- 💲 Format monétaire localisé (devise selon `Locale`)

## 🛠️ Technologies utilisées

| Technologie | Utilisation |
|---|---|
| Swift 6 | Langage de programmation |
| SwiftUI | Framework UI déclaratif |
| SwiftData | Persistance et modélisation des données |
| `#Predicate` | Filtrage dynamique des requêtes |

## 🏗️ Architecture

```
iExpense/
├── ExpenseItem.swift      # @Model SwiftData
├── ContentView.swift      # Navigation, toolbar (tri, filtre)
├── ExpensesView.swift     # @Query dynamique + liste
├── AddView.swift          # Sheet d'ajout via modelContext
└── View+Style.swift       # Extension style conditionnel selon montant
```

### Flux de données

```
┌─────────────────────────────────────────────────────┐
│  ExpenseItem (@Model)                               │
│  → Géré automatiquement par SwiftData               │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  ExpensesView                                       │
│  → @Query avec #Predicate dynamique (filtre type)   │
│  → SortDescriptor dynamique (nom / montant)         │
│  → Suppression via modelContext.delete()             │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  AddView                                            │
│  → Crée un ExpenseItem                              │
│  → modelContext.insert() pour persister              │
└─────────────────────────────────────────────────────┘
```

## 📚 Concepts SwiftUI appliqués

| Concept | Utilisation |
|---|---|
| `@Model` | Modèle de données SwiftData (remplace `Codable` + `UserDefaults`) |
| `@Query` | Requêtes automatiques avec tri et filtrage |
| `#Predicate` | Filtre dynamique (All / Personal / Business) |
| `@Environment(\.modelContext)` | Insertion et suppression de données |
| `@Environment(\.dismiss)` | Fermer la sheet après sauvegarde |
| `SortDescriptor` | Tri dynamique multi-critères |
| `.sheet` + `.presentationDetents` | Modal demi-hauteur pour ajout |
| `Locale.current.currency` | Devise locale automatique |

## 🚀 Installation

```bash
git clone https://github.com/votre-username/iExpense.git
cd iExpense
open iExpense.xcodeproj
```

## 📈 Améliorations possibles

- [ ] Icônes selon le type de dépense
- [ ] Graphiques de suivi (Charts framework)
- [ ] Support multi-devises
- [ ] Recherche par nom

## 👤 Auteur

**Guillaume Richard**

## 📚 Ressources

- [100 Days of SwiftUI - Project 7](https://www.hackingwithswift.com/books/ios-swiftui/iexpense-introduction)
