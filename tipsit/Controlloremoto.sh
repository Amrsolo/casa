if [ $# -lt 2 ]; then                                                                                          
    echo "Usage: $0 operation operand1 operand2 [...]"
    exit 1
fi

# Controlla se l'operazione    valida
valid_operations=("add" "sub" "mul" "div")
operation=$1
if ! [[ "${valid_operations[@]}" =~ "${operation}" ]]; then
    echo "Error: Invalid operation $operation"
    exit 2
fi

# Salva l'operazione e il primo operando
operation=$1
result=$2
shift 2

# Cicla sugli operandi
for num in "$@"; do
    # Controlla se l'operando    un numero
    if ! [[ $num =~ ^[0-9]+$ ]]; then
        echo "Error: $num is not a valid number"
        exit 3
    fi

    # Esegue l'operazione
    if [ "$operation" = "add" ]; then
        result=$((result + num))
    elif [ "$operation" = "sub" ]; then
        result=$((result - num))
    elif [ "$operation" = "mul" ]; then
        result=$((result * num))
    elif [ "$operation" = "div" ]; then
        if [ $num -eq 0 ]; then
            echo "Error: division by zero!"
            exit 4
        fi
        result=$((result / num))
    fi
done

echo "Result of $operation = $result"

