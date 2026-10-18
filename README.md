# HidroPlantix 🌱

**Sistema de irrigação inteligente com monitoramento e controle remoto utilizando Flutter, ESP32-C3 e MQTT.**

## Sobre o projeto

O **HidroPlantix** é um projeto acadêmico que tem como objetivo desenvolver um sistema de irrigação inteligente capaz de monitorar a umidade do solo e controlar a irrigação de duas zonas de cultivo.

O sistema integra um aplicativo móvel desenvolvido em Flutter a um microcontrolador ESP32-C3, utilizando comunicação MQTT por meio do EMQX Cloud. A proposta é permitir o monitoramento das condições do solo e o controle das válvulas de irrigação de forma manual ou automática.

## Objetivos

- Monitorar a umidade do solo em duas zonas independentes.
- Permitir o controle remoto das válvulas pelo aplicativo.
- Oferecer modos de operação manual e automático.
- Configurar limites de umidade para o acionamento da irrigação.
- Utilizar IoT para comunicação entre o aplicativo e o dispositivo.
- Permitir que a automação local continue funcionando sem conexão com o aplicativo, quando implementada e configurada na ESP32-C3.

## Tecnologias utilizadas

| Tecnologia | Finalidade |
|---|---|
| Flutter | Desenvolvimento do aplicativo móvel |
| Dart | Linguagem de programação do aplicativo |
| ESP32-C3 | Controle do hardware e leitura dos sensores |
| Arduino IDE | Desenvolvimento e gravação do firmware |
| C++ | Programação da ESP32-C3 |
| MQTT | Comunicação entre o aplicativo e o dispositivo |
| EMQX Cloud | Broker MQTT |
| Wi-Fi | Conexão do dispositivo à internet |
| TLS | Proteção da comunicação MQTT |

## Arquitetura do sistema

O funcionamento proposto é organizado da seguinte forma:

1. Os sensores realizam a leitura da umidade do solo.
2. A ESP32-C3 processa as leituras e controla as saídas de irrigação.
3. O dispositivo publica informações no broker EMQX Cloud utilizando MQTT.
4. O aplicativo Flutter recebe os dados e apresenta as informações ao usuário.
5. Os comandos enviados pelo aplicativo são recebidos pela ESP32-C3, que valida e executa as ações permitidas.

**Fluxo de comunicação:**

`Aplicativo Flutter ↔ EMQX Cloud (MQTT) ↔ ESP32-C3 ↔ Sensores e válvulas`

## Hardware previsto

- 1 microcontrolador ESP32-C3.
- 2 sensores de umidade do solo.
- 1 módulo de relés de dois canais compatível com os sinais de controle da ESP32-C3.
- 2 válvulas solenoides de 12 V.
- Fonte de alimentação adequada às válvulas e aos componentes.
- Cabos e conexões necessários para a montagem.

> **Atenção:** as válvulas de 12 V não devem ser alimentadas diretamente pelos pinos da ESP32-C3. A montagem deve respeitar as especificações elétricas dos componentes.

## Comunicação MQTT

O projeto utiliza os seguintes tópicos MQTT:

| Tópico | Finalidade |
|---|---|
| `jardim/dados` | Publicação das leituras e dos estados do dispositivo |
| `jardim/comando` | Recebimento de comandos e configurações |

A comunicação utiliza o broker EMQX Cloud. A implementação final deverá validar as permissões de acesso, as credenciais e a conexão segura com TLS.

**Importante:** as senhas e os certificados privados, quando aplicável, não devem ser publicados no repositório. Não inclua credenciais reais em exemplos, capturas de tela ou arquivos versionados.

## Funcionalidades previstas

- [ ] Monitoramento da umidade da zona 1.
- [ ] Monitoramento da umidade da zona 2.
- [ ] Exibição dos dados em tempo real no aplicativo.
- [ ] Indicação do estado da conexão.
- [ ] Acionamento manual independente das duas válvulas.
- [ ] Seleção entre modo manual e automático.
- [ ] Configuração dos limites de umidade pelo aplicativo.
- [ ] Irrigação automática com limites de início e parada.
- [ ] Desligamento por tempo máximo de segurança.
- [ ] Persistência das configurações na ESP32-C3.
- [ ] Tratamento de falhas de sensores e comunicação.

Os itens acima representam o escopo planejado e devem ser marcados como concluídos somente após a implementação e os testes correspondentes.

## Status do desenvolvimento

O projeto está em desenvolvimento.

Até o momento, foi realizado um teste inicial da ESP32-C3 com conexão Wi-Fi, conexão ao broker EMQX Cloud, assinatura do tópico `jardim/comando` e publicação de uma mensagem de teste.

A integração completa com os sensores, as válvulas e o aplicativo Flutter ainda deve ser implementada e validada conforme o andamento do projeto.

## Organização do repositório

A estrutura definitiva será atualizada conforme a implementação:

```text
HidroPlantix/
├── app_flutter/       # Aplicativo Flutter
├── firmware_esp32/    # Código da ESP32-C3
├── docs/              # Documentação e diagramas
└── README.md          # Apresentação do projeto
```

Os nomes das pastas podem ser ajustados para corresponder à estrutura real do repositório.

## Segurança e funcionamento offline

- Utilizar credenciais distintas para os clientes MQTT.
- Restringir as permissões de publicação e assinatura aos tópicos necessários.
- Validar os comandos antes de acionar as válvulas.
- Definir um tempo máximo de irrigação.
- Tratar leituras inválidas dos sensores de forma segura.
- Implementar a lógica automática diretamente na ESP32-C3 para permitir seu funcionamento sem conexão com o aplicativo ou broker.
- Armazenar localmente as configurações necessárias para a automação offline.

O funcionamento offline depende da implementação e da validação dessas funcionalidades no firmware.

## Objetivo acadêmico

O HidroPlantix é desenvolvido como projeto acadêmico, com foco em desenvolvimento mobile, programação de microcontroladores, Internet das Coisas (IoT), comunicação MQTT e integração entre software e hardware.

## Autoria

**Desenvolvimento:** Nathalia Mimi

**Instituição:** Fatec — Itapetininga - ADS

**Ano:** 2026

---

Projeto acadêmico em desenvolvimento.
