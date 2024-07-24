function inicializar_tabuleiro()
    local tabuleiro = {}
    for i = 1, 3 do
        tabuleiro[i] = { ' ', ' ', ' ' }
    end
    return tabuleiro
end

function imprimir_tabuleiro(tabuleiro)
    for i = 1, 3 do
        print(" " .. tabuleiro[i][1] .. " | " .. tabuleiro[i][2] .. " | " .. tabuleiro[i][3])
        if i < 3 then
            print("---+---+---")
        end
    end
end

function verificar_vencedor(tabuleiro, jogador)
    for i = 1, 3 do
        if (tabuleiro[i][1] == jogador and tabuleiro[i][2] == jogador and tabuleiro[i][3] == jogador) or
           (tabuleiro[1][i] == jogador and tabuleiro[2][i] == jogador and tabuleiro[3][i] == jogador) then
            return true
        end
    end
    if (tabuleiro[1][1] == jogador and tabuleiro[2][2] == jogador and tabuleiro[3][3] == jogador) or
       (tabuleiro[1][3] == jogador and tabuleiro[2][2] == jogador and tabuleiro[3][1] == jogador) then
        return true
    end
    return false
end

function verificar_empate(tabuleiro)
    for i = 1, 3 do
        for j = 1, 3 do
            if tabuleiro[i][j] == ' ' then
                return false
            end
        end
    end
    return true
end

function main()
    local tabuleiro = inicializar_tabuleiro()
    local jogador_atual = 'X'
    local jogo_ativo = true

    while jogo_ativo do
        imprimir_tabuleiro(tabuleiro)
        print("Jogador " .. jogador_atual .. ", digite sua jogada (linha e coluna): ")
        local linha, coluna = io.read("*n", "*n")

        if linha and coluna and linha >= 1 and linha <= 3 and coluna >= 1 and coluna <= 3 and tabuleiro[linha][coluna] == ' ' then
            tabuleiro[linha][coluna] = jogador_atual
            if verificar_vencedor(tabuleiro, jogador_atual) then
                imprimir_tabuleiro(tabuleiro)
                print("Parabens, Jogador " .. jogador_atual .. "! Voce venceu!")
                jogo_ativo = false
            elseif verificar_empate(tabuleiro) then
                imprimir_tabuleiro(tabuleiro)
                print("Empate! O jogo terminou sem vencedor.")
                jogo_ativo = false
            else
                jogador_atual = (jogador_atual == 'X') and 'O' or 'X'
            end
        else
            print("Entrada inválida. Tente novamente.")
        end
    end
end

main()
