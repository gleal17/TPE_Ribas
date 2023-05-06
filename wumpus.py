seguro = {}
brisa = {}
poco = {}
cheiro = {}
wumpus = {}
ouro = {}
visitado = []
temParede = []
contador = 1
text = ""
direcao = 0
x = 0
y = 0

def temBrisa(entrada):
	brisa[f"{x},{y}"] = contador if entrada == '1' else -1*contador
	contador+=1
    

def temCheiro(entrada):
	cheiro[f"{x},{y}"] = contador if entrada == '1' else -1*contador
	contador+=1

def temOuro(entrada):
	if (entrada):
		print("P") 
		# exit direto?
		exit(0)

def bateu(entrada):
	if (entrada == 1):
		temParede[emFrente()] = contador
		contador += 1

def gritou(entrada):		
	if (entrada):
		for posicao in wumpus:
			if (wumpus[posicao] > 0):
				wumpus[posicao] = -1*wumpus[posicao]

def emFrente():
	if (direcao == 0):
		return f"{x},{y+1}"
	elif (direcao == 1):
		return f"{x+1},{y}"
	elif (direcao == 2):
		return f"{x},{y-1}"
	elif (direcao == 3):
		return f"{x-1},{y}"


while(1):
	entrada = input()
	temCheiro(entrada[0])
	temBrisa(entrada[1])
	temOuro(entrada[2])
	bateu(entrada[3])
	gritou(entrada[4])

	if seguro[emFrente()]:
		print("M")
	elif 