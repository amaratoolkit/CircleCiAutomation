require 'selenium-webdriver'
require 'rubygems'
require "webdrivers"

class DockerPage

  def loginAsUser(){
    @driver=Selenium::WebDriver.for :safari
    @driver.manage.window.maximize
    @driver.navigate.to "http://automationpractice.com/index.php"
  }
