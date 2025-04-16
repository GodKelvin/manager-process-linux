function show_process(){
  ps -eo pid,user,%cpu,%mem,etime,comm,state
}

show_process

# Variaveis
PID=$1
ACAO=$2

while true; do
  read -p "Informe o PID do processo ou digite 's' para sair: " PID

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
    echo -e "\nComandos disponíveis: p-pausar, c-continuar, m-matar, s-sair"
  fi
done



while true; do
    read -p "Informe o comando Desejado: " comando

    case "$comando" in
        pausar)
            kill -STOP "$PID" && echo ">> Processo pausado"
            ;;
        continuar)
            kill -CONT "$PID" && echo ">> Processo continuado"
            ;;
        matar)
            kill -9 "$PID" && echo ">> Processo finalizado"
            break
            ;;
        sair)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Comando inválido. Use: pausar, continuar, matar, sair"
            ;;
    esac
done