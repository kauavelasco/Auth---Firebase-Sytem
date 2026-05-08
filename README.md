# Flutter Auth System

Um aplicativo Flutter básico demonstrando o fluxo de autenticação: Cadastro, Login e Encerramento de Sessão (Logout).

## 🚀 Funcionalidades

- **Cadastro:** Criação de usuário com e-mail e senha.
- **Login:** Autenticação de usuário existente.
- **Sessão:** Persistência do estado de login (mantém o usuário logado).
- **Logout:** Encerramento da sessão e retorno à tela de login.

## 🛠️ Tecnologias Utilizadas

- [Flutter](https://flutter.dev) - Framework de UI.
- [Firebase Auth](https://google.com) - (Opcional, mas recomendado para este tipo de app) Para autenticação backend.
- [Provider](https://pub.dev) - Gerenciamento de estado.

## 📋 Pré-requisitos

- Flutter SDK instalado.
- IDE de sua preferência (VS Code, Android Studio).
- Configuração do Firebase no projeto (se for usar Firebase Auth).

## 🔧 Como Instalar e Rodar

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/kauavelasco/Auth---Firebase-Sytem.git
    ```

2.  **Entre na pasta do projeto:**
    ```bash
    cd seu-projeto
    ```

3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

4.  **Configure o Firebase (Se aplicável):**
    - Adicione o `google-services.json` (Android) e `GoogleService-Info.plist` (iOS).

5.  **Rode o projeto:**
    ```bash
    flutter run
    ```

## 📂 Estrutura do Projeto

```text
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── home_screen.dart
└── services/
    └── auth_service.dart
```

## 👤 Autor

**Kauã Velasco**
- [GitHub](https://github.com/kauavelasco)