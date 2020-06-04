require 'selenium-webdriver'
require 'rubygems'
require "webdrivers"


Before do
  puts("Pre Condition")
  # @driver=Selenium::WebDriver.for :safari
  # @driver.manage.window.maximize
end

After do
  puts("Post Condition")
  #  @driver.quit
end
