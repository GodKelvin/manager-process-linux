# 🖥️ manager_process.sh

Um script interativo em Bash para **monitorar e controlar processos no Linux**, com suporte a log automático e comandos como pausar, continuar e finalizar processos.

## 📦 Funcionalidades

- 📋 Lista todos os processos ativos com detalhes como:
  - PID
  - Usuário
  - Uso de CPU e Memória
  - Tempo de execução
  - Comando executado
  - Estado atual
- 🔍 Permite selecionar um processo pelo PID
- 🛑 Pausar (`STOP`), ▶️ continuar (`CONT`) ou ☠️ finalizar (`KILL`) um processo
- 🧾 Registra todas as ações em um arquivo de log (`manager_process.log`)
- 🛡️ Exibe alertas caso o processo requeira permissões de administrador

---

## ⚙️ Requisitos

- Sistema operacional Linux
- Shell Bash (`/bin/bash`)
- Permissões adequadas para manipular processos (pode requerer `sudo` em alguns casos)
- Ajustar as permissões do arquivo
  ```
  chmod +x manager_process.sh
  ```
---

## 🚀 Como usar

```bash
bash manager_process.sh
