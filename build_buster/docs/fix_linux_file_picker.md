# Fix: Support Linux platform for directory picker

## 🐛 Problème identifié

L'application Build Buster crashait sur Linux lors du clic sur le bouton "Scan for Projects" avec l'erreur suivante :

```
UnimplementedError: pickFileAndDirectoryPaths() has not been implemented.
```

## 🔍 Cause

Le code utilisait la méthode `FilePicker.platform.pickFileAndDirectoryPaths()` qui n'est **pas encore implémentée sur Linux** dans le package `file_picker`.

### Code avant (non fonctionnel sur Linux)

```dart
Future<void> _scanProjects(WidgetRef ref) async {
    List<String>? result = await FilePicker.platform.pickFileAndDirectoryPaths();
    if (result == null || result.isEmpty) {
      return; // User canceled the picker
    }
    ref.read(homePageViewModelProvider.notifier).fetchProjects(result.first);
  }
```

## ✅ Solution implémentée

Remplacement par `FilePicker.platform.getDirectoryPath()` qui est **supportée sur toutes les plateformes** (Windows, macOS, Linux, iOS, Android).

### Code après (multi-plateforme)

```dart
Future<void> _scanProjects(WidgetRef ref) async {
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result == null) {
      return; // User canceled the picker
    }
    ref.read(homePageViewModelProvider.notifier).fetchProjects(result);
  }
```

## 📊 Compatibilité

| Méthode | Windows | macOS | Linux | iOS | Android |
|---------|---------|-------|-------|-----|---------|
| `pickFileAndDirectoryPaths()` | ✅ | ✅ | ❌ | ❌ | ❌ |
| `getDirectoryPath()` | ✅ | ✅ | ✅ | ✅ | ✅ |

## 🔄 Changements techniques

- Type de retour changé de `List<String>?` vers `String?`
- Suppression de la vérification `result.isEmpty`
- Suppression de l'accès `result.first` (la méthode retourne directement le chemin)

## ✨ Résultat

- ✅ L'application fonctionne maintenant correctement sur Linux
- ✅ Compatibilité maintenue avec Windows et macOS
- ✅ Code plus simple et plus robuste
- ✅ Aucune régression sur les autres plateformes

## 📝 Fichier modifié

- `build_buster/lib/view/pages/views/projects_table.dart` (ligne 181-188)

---

**Date:** 12 janvier 2026  
**Auteur:** Maxime  
**Issue:** Support de la plateforme Linux pour le sélecteur de dossiers