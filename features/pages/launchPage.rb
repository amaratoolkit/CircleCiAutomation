require 'selenium-webdriver'
require 'rubygems'
require "webdrivers"
class LaunchPage

def start_server
    @driver=Selenium::WebDriver.for :safari
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
  puts("title=== #{@driver.title}" )
end


end
