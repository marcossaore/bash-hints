#! /bin/bash

orderar_numeros() {
    local numeros=("$@")
    local numeros_ordenados=($(for i in "${numeros[@]}"; do echo $i; done | sort -n))
    echo "${numeros_ordenados[@]}"
}

numero_eh_maior_que_60() {
    if [ $1 -gt 60 ]; then
        return 0
    else
        return 1
    fi
}

numero_eh_menor_que_1() {
    if [ $1 -lt 1 ]; then
        return 0
    else
        return 1
    fi
}

sorteiar_mega_sena() {
    numeros=()
    while [ ${#numeros[@]} -lt 6 ]
    do
        local numero_sorteado=$((RANDOM % 60 + 1))

        if numero_eh_maior_que_60 $numero_sorteado; then
            continue
        fi

        # O operador =~ em bash é utilizado para comparação de padrões com expressões regulares. Ele permite verificar se uma string corresponde a um determinado padrão. No contexto do script fornecido, =~ é usado para verificar se um número já está presente no array numbers.
        if [[ " ${numeros[@]} " =~ " ${numero_sorteado} " ]]; then
            continue
        fi

        numeros+=(${numero_sorteado})
    done
    numeros_ordenados=$(orderar_numeros "${numeros[@]}")
    echo $numeros_ordenados
}

escolher_numeros_megasena() {
    numeros=()
    local contador=1
    local numeros_ja_existe=0
    while [ ${#numeros[@]} -lt 6 ]
    do
        local numero_escolhido
        if [ $numeros_ja_existe -gt 0 ]; then
            read -p "O número \"${numeros_ja_existe}\" já foi selecionado!"$'\n'"Escolha o ${contador}º número: " numero_escolhido
            numeros_ja_existe=0;
        else
            read -p "Escolha o ${contador}º número (entre 1 e 60):" numero_escolhido

            if numero_eh_maior_que_60 $numero_escolhido || numero_eh_menor_que_1 $numero_escolhido; then
                continue
            fi
        fi

        # O operador =~ em bash é utilizado para comparação de padrões com expressões regulares. Ele permite verificar se uma string corresponde a um determinado padrão. No contexto do script fornecido, =~ é usado para verificar se um número já está presente no array numbers.
        if [[ " ${numeros[@]} " =~ " ${numero_escolhido} " ]]; then
            numeros_ja_existe=$numero_escolhido
            continue
        fi
        contador=$((contador + 1))
        numeros+=(${numero_escolhido})
    done
    # Print the list of numbers
    numeros_orderados=$(orderar_numeros "${numeros[@]}")
    echo $numeros_orderados
}

obter_numeros_acertados() {
    local numeros_escolhidos=$1
    local numeros_sorteados=$2
    local acertos=0
    local numeros_acertados=()
    for numero in ${numeros_escolhidos[@]}
    do
        if [[ " ${numeros_sorteados[@]} " =~ " ${numero} " ]]; then
            numeros_acertados+=(${numero})
            acertos=$((acertos + 1))
        fi
    done
    echo -e "Quantidade de acertos: $acertos\nNumeros acertados: ${numeros_acertados[@]}"
}

escolher_jogo() {
    local jogo=$1
    case "$jogo" in
        "megasena") 
            local numeros_escolhidos=$(escolher_numeros_megasena)
            local numeros_sorteados=$(sorteiar_mega_sena)
            echo -e "\nNumeros escolhidos: $numeros_escolhidos"
            echo -e "Numeros sorteados: $numeros_sorteados"
            obter_numeros_acertados "${numeros_escolhidos[@]}" "${numeros_sorteados[@]}"
        ;;
         "megasena-random")

            # se arquivo não existir
            if [ ! -f megasena-random.txt ]; then
                touch megasena-random.txt
            fi

            local simularXVezes=${2:-1}

            echo $simularXVezes

            echo Simulacao do dia: $(date '+%d/%m/%Y %H_%M_%S') >> megasena-random.txt
            echo -e "\nNumeros escolhidos | Numeros sorteados\n" >> megasena-random.txt

            for ((i = 0; i < $simularXVezes; i++)); do
                local numeros_escolhidos_random=$(sorteiar_mega_sena)
                local numeros_sorteados=$(sorteiar_mega_sena)
                # salve em um arquivo
                echo -e "$numeros_escolhidos_random | $numeros_sorteados" >> megasena-random.txt
            done

            echo -e "\n" >> megasena-random.txt
        ;;
        *) echo "Jogo desconhecido" ;;
    esac
}

if [[ $# -lt 1 ]]; then
    echo "Informe o jogo!"
    exit 1  # Exit with an error code
fi

escolher_jogo $1 $2