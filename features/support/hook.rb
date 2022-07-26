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

at_exit do
  ReportBuilder.configure do |config|
      config.report_path = "consolidated_test_report"
      config.report_types = [:html]
      config.report_title = "----- Consolidated Test Report -----"
    end

    ReportBuilder.build_report
end

