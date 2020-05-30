require 'selenium-webdriver'
require 'rubygems'
require "webdrivers"
require 'capybara'

class HomePageWeb

def start_server


  Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  chromeOptions: { args: %w(headless disable-gpu) }
)

Capybara::Selenium::Driver.new(
  app,
  browser: :chrome,
  desired_capabilities: capabilities
)
end
    #sleep 60
    @driver.manage.window.maximize
end

def launch_app
    @driver.navigate.to "http://the-internet.herokuapp.com/"
end

def kill_server
    @driver.quit
end

def get_title
  @driver.title
  #puts("title=== #{@driver.title}" )
end


end
