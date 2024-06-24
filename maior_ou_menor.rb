def pergunta_nome
	puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
	puts "Qual o seu nome? \n\n\n"
	nome = gets.strip


	puts "Começaremos o jogo para você, " + nome + "\n\n\n\n\n"
	nome
end

def pede_dificuldade
	puts "Qual o nivel de dificuldade que deseja? (1 fácil, 5 difícil)"
	dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2 
		maximo = 60
	when 3 
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	puts "Escolhendo um numero secreto entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1
	puts "Escolhido... que tal tentar adivinhar nosso numero secreto? \n\n\n\n"
	sorteado
end

def pede_um_numero(chutes, tentativa, limite_tentativas)
	puts "Tentativa #{tentativa}  de #{limite_tentativas}"
	puts "Chutes ate agora: " + chutes.to_s
	puts "Entre com o numero:"
	chute = gets.strip
	puts "Sera que acertou? Voce chutou " + chute
	chute.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = chute.to_i == numero_secreto
	maior = numero_secreto > chute.to_i

	if acertou
		ganhou
		return true
	end

	if maior
		puts "O numero secreto é maior!!"
	else
		puts "O numero secreto é menor!!"
	end

	false
end

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	limite_tentativas = 5
	pontos_Ate_agora = 1000
	chutes = []


	for tentativa in 1..limite_tentativas
		if nome == "Jennifer"
			puts "Acertou!"
		break
	end
	chute = pede_um_numero chutes, tentativa, limite_tentativas
	pontos_a_perder = (chute - numero_secreto).abs / 2.0
	pontos_Ate_agora -= pontos_a_perder
	chutes << chute
	 break if verifica_se_acertou numero_secreto, chute
	 	
end

puts "Voce ganhou #{pontos_Ate_agora} pontos."
end

def nao_quer_jogar?
	puts "Deseja continuar jogando? (S/N)"
	quero_jogar = gets.strip
	quero_jogar.upcase == "N"
end

nome = pergunta_nome
dificuldade = pede_dificuldade

loop do 
	joga nome, dificuldade
	if nao_quer_jogar?
		break
	end
end