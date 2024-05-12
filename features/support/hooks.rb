# Before sem uma tag executa antes de todos os cenários                                                                      
Before do 
    @Loja_VR = Loja_VR.new  
    @Portal_VR = Portal_VR.new  
end

# After sem uma tag executa depois de todos os cenários
After do
end
  
# Anexar os prints ao relatório
After do |scenario|    
     sleep 1
     nome_cenario = scenario.name.tr(' ', '_').downcase!
     nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')
     screenshot = "features/logs/shots/#{nome_cenario}.png"
     page.save_screenshot(screenshot)
     attach(screenshot, 'image/png')    
end


at_exit do
  time = Time.now.getutc
  ReportBuilder.configure do |config|
  config.json_path = 'features/logs/report.json'
  config.report_path = 'features/logs/ReportAutomacaoIUL'
  config.report_types = [:json, :html]
  config.report_tabs = %w[Overview Features Scenarios Errors]
  config.report_title = 'Interface Única de Liberação - Painel'
  config.compress_images = true
  config.additional_info = { 'Project name' => 'IUL Painel', 'Platform' => 'Windows', 'Report generated' => time }
  config.color = 'blue'
  #'cyan green' 
end
#ReportBuilder.build_report 
end