require 'selenium-webdriver'
require 'rubygems'
#require "chromedriver-helper"
class HomePage

def start_server
    @driver=Selenium::WebDriver.for :safari
  #Selenium::WebDriver::Chrome::Service.driver_path="drivers/chromedriver"
    # Input capabilities
    # caps = Selenium::WebDriver::Remote::Capabilities.new
    # caps['browser'] = 'Safari'
    # caps['browser_version'] = '13.0'
    # caps['os'] = 'OS X'
    # caps['os_version'] = 'Catalina'
    #
    # @driver = Selenium::WebDriver.for(:remote,
    #   :url => "http:127.0.0.1:4444/wd/hub",
    #   :desired_capabilities => caps)
    # profile = Selenium::WebDriver::Chrome::Profile.new
    # @driver = Selenium::WebDriver.new :chrome,:profile => profile
    # @driver = Selenium::WebDriver.for(url => "http:127.0.0.1:4444/wd/hub", :profile => profile )
    #@driver = Selenium::WebDriver.for :chrome
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
