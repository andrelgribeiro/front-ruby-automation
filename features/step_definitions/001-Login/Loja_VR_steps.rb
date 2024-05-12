Dado('que acesso a home do portal') do             
    @Portal_VR.load
end                                                                          
                                                                               
Quando('clicar no botão Compre online para navegar até a loja') do                                  
    @Portal_VR.clicar_compre_online
    Capybara.current_session.driver.browser.switch_to.window(page.driver.browser.window_handles.last)

end

Quando('selecionar a opção Cartões VR') do
    @Loja_VR.clicar_fechar
    @Loja_VR.clicar_cartoes_vr
end
               

Quando('adicionar uma quantidade aleatória de cartões do produto Auto') do
    @Loja_VR.clicar_mais_auto
end


Quando('digitar um valor de crédito aleatório para o produto Auto') do
    @Loja_VR.digitar_valor_auto '100'
end

Quando('clicar no botão Adicionar ao carrinho') do
    @Loja_VR.clicar_adicionar_auto
end

                                                                               
Então('valido que produto foi adicionado ao carrinho com sucesso') do           
    @Loja_VR.validar_texto_painel_avulso "Produto adicionado!"
end                                                                                  