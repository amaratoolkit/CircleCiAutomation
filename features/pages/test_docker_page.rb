require 'selenium-webdriver'
require 'rubygems'
require 'webdrivers'

class DockerPage
  def loginAsUser
    # @driver=Selenium::WebDriver.for :safari
    # @driver.manage.window.maximize
    # @driver.navigate.to "http://automationpractice.com/index.php"
    caps = Selenium::WebDriver::Remote::Capabilities.send('chrome')
    # @driver = Selenium::WebDriver.for(:remote, url: "http://0.0.0.0:4444/wd/hub", desired_capabilities: caps)
    @driver = Selenium::WebDriver.for(:remote, url: 'http://siva266:7Wfwz8qNKAn9X4XyNTXE@hub.browserstack.com:80/wd/hub', desired_capabilities: caps)
    @driver.manage.window.maximize
    @driver.navigate.to 'http://automationpractice.com/index.php'
  end

  def navigateToPages
    puts('navigateToPages')
    sleep 3
    @driver.find_element(:xpath, "//a[@title='Log in to your customer account']").click
    sleep 5
    @driver.find_element(:xpath, "//*[@id='email']").send_keys 'testing username'
    @driver.find_element(:xpath, "//*[@id='passwd']").send_keys 'testing passwprd'
    @driver.find_element(:id, 'SubmitLogin').click
  end

  def signOnWeb
    puts('SIgn')
    @driver.quit
  end
end
