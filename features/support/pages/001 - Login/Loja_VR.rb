class Loja_VR < SitePrism::Page
    
    set_url ENVIRONMENT['loja_vr']
           
    element :btn_close, '.close-button'
    element :btn_plus_auto, '.plus-button'
    element :campo_valor_auto, '#produto-auto-valor'
    element :btn_adicionar_auto, '#btn-adicionar-carrinho-auto'
    element :btn_entendi, '#sc_terms-consent'
    element :btn_cartoes_vr, '#btn-selecionar-modalidade-avulso'
    element :painel_avulso, '#modalidade-avulso-page'
 
      
    def initialize
    end
  

    def clicar_fechar
      btn_entendi.click
      btn_close.click
    end
    
    def clicar_cartoes_vr
      btn_cartoes_vr.click
    end    

    def clicar_mais_auto
      page.execute_script "window.scrollBy(0,500)"
      all(:css, '.plus-button').last.click
    end

    def clicar_adicionar_auto
      btn_adicionar_auto.click
    end
        
    def digitar_valor_auto (valor)
      campo_valor_auto.set valor
    end

    def validar_texto_painel_avulso (valor)
      expect(painel_avulso.text).to include(valor)
    end
end