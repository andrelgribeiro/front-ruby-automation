require 'cucumber'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'pry'
require 'site_prism'
require 'yaml'
require 'rspec'
require 'rspec/core'
require 'rspec/expectations'
require 'report_builder'
require 'faker'
#require 'cpf_faker'
#require_relative 'hooks'

ENV['NO_PROXY']="127.0.0.1"
include RSpec::Matchers


# Arquivo de definição de ambiente definitions
DEBUG = ENV['DEBUG'] || false
AMBIENTE = ENV['AMBIENTE']
ENVIRONMENT = YAML.load_file(File.dirname(__FILE__) + "/config/#{AMBIENTE}/environment.yml")

Capybara.javascript_driver = :driver_chrome

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15    
end


Capybara.register_driver :driver_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  #options.add_argument('--headless')
  options.add_argument('--incognito')
  options.add_argument("--start-maximized")
  options.add_argument("--disable-web-security")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-infobars")
  options.add_argument("--disable-notifications")
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options    
  )

end
Capybara.default_driver = :driver_chrome
