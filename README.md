# Infraestrutura da Aplicação (`infra-repo`)

Bem-vindo ao repositório de **Infraestrutura da Aplicação**! Este repositório contém todas as configurações necessárias para provisionar a infraestrutura na **AWS** utilizando **Terraform**. Ele abrange a configuração de rede, instâncias de computação e outros recursos essenciais para hospedar a aplicação **Java Spring Boot 11**.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Arquitetura](#arquitetura)
- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Configuração e Implantação](#configuração-e-implantação)
    - [1. Clonar o Repositório](#1-clonar-o-repositório)
    - [2. Configurar Credenciais AWS](#2-configurar-credenciais-aws)
    - [3. Definir Variáveis de Ambiente](#3-definir-variáveis-de-ambiente)
    - [4. Inicializar o Terraform](#4-inicializar-o-terraform)
    - [5. Planejar e Aplicar a Infraestrutura](#5-planejar-e-aplicar-a-infraestrutura)
- [GitHub Actions](#github-actions)
- [Outputs](#outputs)
- [Boas Práticas](#boas-práticas)
- [Solução de Problemas](#solução-de-problemas)
- [Contribuição](#contribuição)
- [Licença](#licença)
- [Contato](#contato)

## 🌟 Visão Geral

Este repositório utiliza **Terraform** para definir e gerenciar a infraestrutura necessária para hospedar uma aplicação **Java Spring Boot 11** na **AWS**. A infraestrutura inclui:

- **VPC (Virtual Private Cloud):** Rede isolada para os recursos.
- **Subnets:** Segmentação da VPC em subnets públicas e privadas.
- **Internet Gateway:** Permite comunicação com a internet.
- **Security Groups:** Regras de firewall para controlar o tráfego de rede.
- **Instâncias EC2:** Servidores para executar a aplicação.
- **IAM Roles:** Gerenciamento de permissões e acessos.

Além disso, este repositório está configurado para utilizar **GitHub Actions** para automatizar o processo de provisionamento da infraestrutura sempre que houver alterações no ramo principal (`main`).

## 🏗️ Arquitetura

A seguir, uma visão simplificada da arquitetura provisionada:

![Arquitetura da Infraestrutura](./docs/architecture-diagram.png)

**Componentes:**

- **VPC:** Rede principal com CIDR `10.0.0.0/16`.
- **Subnets Públicas:** Duas subnets públicas para hospedar as instâncias EC2.
- **Subnets Privadas:** Duas subnets privadas para recursos internos (ex.: bancos de dados).
- **Internet Gateway:** Conecta a VPC à internet.
- **Security Groups:** Controla o acesso às instâncias EC2.
- **Instâncias EC2:** Servidores para executar a aplicação.

## ⚙️ Pré-requisitos

Antes de começarmos, certifique-se de que você tem o seguinte instalado e configurado:

- **Conta AWS:** Com permissões para criar recursos (VPC, EC2, etc.).
- **Terraform:** [Baixe e instale a última versão do Terraform](https://www.terraform.io/downloads.html) (versão >= 1.0.0).
- **Git:** Para clonar o repositório.
- **Conta no GitHub:** Para acessar os workflows do GitHub Actions.

## 📂 Estrutura do Repositório

infra-repo/ 
            ├── main.tf 
            ├── variables.tf 
            ├── outputs.tf 
            ├── networking/ │ ├── vpc.tf │ ├── subnets.tf │ 
            └── security_groups.tf 
            ├── compute/ │ └── ec2.tf 
            ├── .github/ │ └── workflows/ │ └── terraform.yml ├── README.md 
            └── docs/ └── architecture-diagram.png

**Descrição dos Arquivos e Diretórios:**

- **main.tf:** Arquivo principal que configura o provedor AWS e referencia os módulos.
- **variables.tf:** Define as variáveis utilizadas na configuração.
- **outputs.tf:** Define as saídas que serão exibidas após a execução do Terraform.
- **networking/:** Contém as configurações de rede, incluindo VPC, subnets e security groups.
- **compute/:** Contém a configuração das instâncias EC2.
- **.github/workflows/terraform.yml:** Workflow do GitHub Actions para automação do Terraform.
- **docs/:** Contém documentação adicional, como diagramas de arquitetura.

## 🚀 Configuração e Implantação

### 1. Clonar o Repositório

Primeiro, clone o repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/infra-repo.git
cd infra-repo
```


