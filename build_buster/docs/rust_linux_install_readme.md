# Installation de Rust sur Linux

Ce document explique comment installer Rust sur un système Linux, en particulier lorsque vous rencontrez des problèmes avec la version Snap de curl.

## Problème rencontré

Lors de l'installation standard de Rust avec la commande suivante :
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Si vous utilisez la version Snap de curl, vous pouvez rencontrer l'erreur suivante :
```
curl: (23) client returned ERROR on write of 16375 bytes
error: command failed: downloader https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
```

**Cause :** La version Snap de curl a des limitations dues à la sandbox de Snap qui empêchent l'accès à certains dossiers cachés du répertoire home ou d'autres zones restreintes du système.

## Solution : Installation manuelle avec wget

### Étape 1 : Télécharger l'installeur rustup

Utilisez `wget` pour télécharger directement l'installeur rustup :

```bash
wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -O /tmp/rustup-init
```

### Étape 2 : Rendre l'installeur exécutable

```bash
chmod +x /tmp/rustup-init
```

### Étape 3 : Lancer l'installation

Exécutez l'installeur avec l'option `-y` pour accepter les paramètres par défaut :

```bash
RUSTUP_USE_REQWEST=0 /tmp/rustup-init -y
```

**Note :** La variable d'environnement `RUSTUP_USE_REQWEST=0` permet d'éviter les problèmes avec curl lors de l'installation.

### Étape 4 : Configurer l'environnement shell

Pour utiliser Rust dans votre session shell actuelle :

```bash
source "$HOME/.cargo/env"
```

Pour les sessions futures, cette configuration sera automatiquement chargée via votre profil shell (~/.bashrc, ~/.zshrc, etc.).

### Étape 5 : Vérifier l'installation

Vérifiez que Rust et Cargo sont correctement installés :

```bash
rustc --version
cargo --version
```

Vous devriez voir quelque chose comme :
```
rustc 1.92.0 (ded5c06cf 2025-12-08)
cargo 1.92.0 (344c4567c 2025-10-21)
```

## Solution alternative : Remplacer curl Snap par la version native

Si vous souhaitez utiliser la méthode d'installation standard à l'avenir, vous pouvez installer la version native de curl :

```bash
# Installer la version native de curl
sudo apt install curl

# Supprimer la version Snap
sudo snap remove curl
```

Ensuite, vous pourrez utiliser la commande d'installation standard :
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Commandes utiles après l'installation

### Mettre à jour Rust
```bash
rustup update
```

### Voir les toolchains installées
```bash
rustup show
```

### Compiler un projet
```bash
cargo build
```

### Compiler en mode release (optimisé)
```bash
cargo build --release
```

### Exécuter un projet
```bash
cargo run
```

### Exécuter les tests
```bash
cargo test
```

## Ressources

- [Documentation officielle Rust](https://www.rust-lang.org/)
- [The Rust Book (livre officiel)](https://doc.rust-lang.org/book/)
- [Rustup documentation](https://rust-lang.github.io/rustup/)
- [Issue GitHub sur le problème curl Snap](https://github.com/boukendesho/curl-snap/issues/1)

## Date d'installation

Installation réalisée le : **6 janvier 2026**

Version installée : **Rust 1.92.0**
