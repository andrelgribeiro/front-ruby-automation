class Portal_VR < SitePrism::Page
    
    set_url ENVIRONMENT['portal_vr']
           
    element :btn_compre_online, '#buttonCompreOnline'

  
    def clicar_compre_online
      btn_compre_online.click
    end
    

end