#!/bin/bash

# Verifica o status atual do Bluetooth
STATUS=$(systemctl is-active bluetooth)

if [ "$STATUS" = "active" ]; then
    echo "O Bluetooth já está ligado."
else
    # Inicia o serviço Bluetooth
    echo "Ligando o Bluetooth..."
    sudo systemctl start bluetooth

    # Confirma se o Bluetooth foi ligado com sucesso
    NEW_STATUS=$(systemctl is-active bluetooth)

    if [ "$NEW_STATUS" = "active" ]; then
        echo "Bluetooth foi ligado com sucesso."
    else
        echo "Houve um erro ao tentar ligar o Bluetooth."
    fi
fi
