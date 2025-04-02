# Projeto Flutter Corporativo

Este projeto é uma base robusta e modular para o desenvolvimento de aplicativos corporativos utilizando Flutter. Ele foi pensado para facilitar a criação e manutenção de múltiplos módulos com componentes reutilizáveis, garantindo escalabilidade e facilidade de integração com microserviços.

---

## Visão Geral

O foco principal deste template é o módulo de **Autenticação/Autorização**, que integra diversos métodos de login, incluindo:

- **Login/Senha**
- **Autenticação Biométrica** (impressão digital, reconhecimento facial)
- **Provedores Externos OAuth** (Google, Microsoft, Apple, GitHub)

A solução é altamente configurável, permitindo que cada aplicação corporativa ative apenas os métodos necessários, sem precisar alterar a base do código. Além disso, todos os módulos consomem dados por meio de um componente central que utiliza GraphQL para acessar os microserviços.

---

## Stack Tecnológica

- IDE: Android Studio com o plugin Flutter/Dart
- Framework: Flutter
- Arquitetura Modular: Flutter Modular (https://pub.dev/packages/flutter_modular)
- Injeção de Dependências: get_it (https://pub.dev/packages/get_it)
- Gerenciamento de Estado: flutter_bloc (https://pub.dev/packages/flutter_bloc)
- Autenticação/Autorização:
    - Login/Senha: Tela customizada ou flutter_login (https://pub.dev/packages/flutter_login)
    - Biometria: local_auth (https://pub.dev/packages/local_auth)
    - OAuth/Provedores: Flutter AppAuth (https://pub.dev/packages/flutter_appauth)
- Armazenamento Seguro: flutter_secure_storage (https://pub.dev/packages/flutter_secure_storage)
- Acesso a Dados: graphql_flutter (https://pub.dev/packages/graphql_flutter)

---

## Estrutura do Projeto

A estrutura modular ajuda na organização e manutenção do código. Segue um exemplo de estrutura:

/lib  
  /core  
    /data  
      - graphql_client.dart      // Configuração do cliente GraphQL centralizado  
    /services  
      - data_service.dart        // Serviço para acesso a microserviços  
      - auth_service.dart        // Serviço central de autenticação/autorização  
  /modules  
    /authentication  
      - auth_page.dart           // Tela de autenticação  
      - auth_bloc.dart           // Gerenciamento de estado da autenticação (BLoC)  
      /providers                // Implementações dos provedores:  
        - email_provider.dart  // Login/Senha  
        - biometric_provider.dart  // Biometria  
        - oauth_provider.dart      // OAuth (Google, Microsoft, Apple, GitHub)  
  /shared  
    /widgets  
      - custom_button.dart       // Componentes reutilizáveis

---

## Módulo de Autenticação/Autorização

### Abordagem e Componentes

1. Interfaces e Abstração:  
  - Definimos uma interface (IAuthProvider) que padroniza os métodos essenciais (login, logout, renovação de token, etc.), garantindo que cada provedor siga o mesmo contrato.

2. Métodos de Autenticação:  
  - Login/Senha: Pode ser implementado por meio de uma tela customizada ou utilizando o pacote flutter_login (https://pub.dev/packages/flutter_login).  
  - Biometria: Implementada com o local_auth (https://pub.dev/packages/local_auth) para oferecer suporte à autenticação biométrica.  
  - Provedores Externos (OAuth): Utilizamos o Flutter AppAuth (https://pub.dev/packages/flutter_appauth) para integrar os fluxos OAuth2/OpenID Connect com provedores como Google, Microsoft, Apple e GitHub.

3. Segurança e Armazenamento:  
  - Tokens e dados sensíveis são armazenados de forma segura utilizando o flutter_secure_storage (https://pub.dev/packages/flutter_secure_storage).  
  - Um serviço central (AuthService) gerencia os tokens e integra o fluxo de autenticação com a camada de acesso a dados.

---

## Acesso a Dados Centralizado

Nenhum módulo acessa microserviços diretamente. Em vez disso, um componente central gerencia todas as requisições de rede, utilizando GraphQL para obter dados dos endpoints. Isso garante que qualquer alteração no endpoint ou na política de autenticação seja gerenciada em um único local.

Exemplo de configuração do cliente GraphQL:

// graphql_client.dart  
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientProvider {  
  static GraphQLClient setupClient() {  
    final HttpLink httpLink = HttpLink('https://seu-endpoint.com/graphql');  
    return GraphQLClient(  
      cache: GraphQLCache(store: InMemoryStore()),  
      link: httpLink,  
    );  
  }  
}

---

## Como Executar o Projeto

1. Instalação do Ambiente:  
  - Certifique-se de ter o Android Studio (https://developer.android.com/studio) instalado com o plugin Flutter/Dart.  
  - Clone o repositório e execute "flutter pub get" para instalar as dependências.

2. Configuração:  
  - Configure os métodos de autenticação desejados (por meio de variáveis de ambiente ou arquivos de configuração), definindo quais provedores estarão ativos para cada aplicação.

3. Execução:  
  - Utilize o comando "flutter run" ou execute o projeto diretamente pelo Android Studio.

---

## Contribuição

Contribuições são bem-vindas! Se você deseja melhorar o projeto ou adicionar novas funcionalidades, sinta-se à vontade para abrir issues ou enviar pull requests. Nossa meta é oferecer uma base sólida e escalável para aplicações corporativas.

---

## Licença

Este projeto está licenciado sob a MIT License (LICENSE).

---

Sinta-se à vontade para ajustar a estrutura e as configurações conforme as necessidades específicas do seu ambiente corporativo. Se houver dúvidas ou sugestões, entre em contato ou abra uma issue para discutir melhorias.