function show_process(){
  ps -eo pid,user,%cpu,%mem,etime,comm,state
}

function get_pid(){
  read -p "Informe o PID do processo ou digite 's' para sair: " PID
}

function show_commands(){
  read -p "Informe o comando Desejado: " comando
    case "$comando" in
      p)
        kill -STOP "$PID" && echo ">> Processo pausado"
        return
        ;;
      c)
        kill -CONT "$PID" && echo ">> Processo continuado"
        return
        ;;
      m)
        kill -9 "$PID" && echo ">> Processo finalizado"
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





# Variaveis
PID=$1
ACAO=$2
while true; do
  show_process
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
    echo -e "Comandos disponíveis: p-pausar, c-continuar, m-matar, s-sair"
    show_commands
    echo
  fi
done