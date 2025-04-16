function show_process(){
  ps -eo pid,user,%cpu,%mem,etime,comm,state
}

function get_pid(){
  echo
  read -p "Informe o PID do processo ou digite 's' para sair: " PID
}

function try_kill(){
  local sinal=$1
  local mensagem=$2

  if kill $sinal "$PID" 2>/dev/null; then
    show_process
    echo -e "\n>> $mensagem"
    echo "$(date '+%Y-%m-%d %H:%M:%S') >> $mensagem" >> "$LOG_FILE"
  else
    echo "⚠️ Permissão de $sinal negada para o processo $PID"
    echo "$(date '+%Y-%m-%d %H:%M:%S') >> ⚠️ Permissão de $sinal negada para o processo $PID" >> "$LOG_FILE"
  fi
}

function show_commands(){
  echo "Processo selecionado: $PID"
  echo -e "Comandos disponíveis: p-pausar, c-continuar, m-matar, s-sair"
  read -p "Informe o comando Desejado: " comando
    case "$comando" in
      p)
        try_kill -STOP "⏳ Processo $PID pausado"
        return
        ;;
      c)
        try_kill -CONT "🎉 Processo $PID continuado"
        return
        ;;
      m)
        try_kill -9 "☠️ Processo $PID finalizado"
        return
        ;;
      s)
        echo "Até a próxima! :D"
        exit 0
        ;;
      *)
        echo "Comando inválido."
        # Se o comando não for válido, chama o menu novamente
        show_commands
        ;;
    esac
}

# Variaveis globais
PID=$1
ACAO=$2
LOG_FILE="list_process.log"

show_process
# Loop principal, só é encerrado quando o comando sair é  requisitado
while true; do
  
  get_pid
  # Desejou sair do programa
  if [[ "$PID" == "s" ]]; then
    echo "Até a próxima! :D"
    exit 0
  fi

  # Verificando se o processo existe
  if ! ps -p "$PID" > /dev/null 2>&1; then
    echo "Processo $PID não encontrado!"

  # Se o processo foi encontrado, lista as possibilidades
  else
    echo -e "\nProcesso encontrado: $PID"
    show_commands
    echo
  fi
done