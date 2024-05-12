#language: pt

@cenarios-de-loja_online
Funcionalidade: loja_online

@loja_online
Cenário: Validar adicao de cartoes auto no carrinho
	Dado que acesso a home do portal
	Quando clicar no botão Compre online para navegar até a loja
	E selecionar a opção Cartões VR
	E adicionar uma quantidade aleatória de cartões do produto Auto
	E digitar um valor de crédito aleatório para o produto Auto
	E clicar no botão Adicionar ao carrinho
	Então valido que produto foi adicionado ao carrinho com sucesso