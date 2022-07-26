require 'selenium-webdriver'
require 'rubygems'
require "webdrivers"
require "report_builder"


Before do
  puts("Pre Condition")
  # @driver=Selenium::WebDriver.for :safari
  # @driver.manage.window.maximize
end

After do
  puts("Post Condition")
  #  @driver.quit
end

# at_exit do
#   ReportBuilder.configure do |config|
#    config.json_path = "./report/"
#    config.input_path = "./report/"
#    config.report_path = "./report/Automation_Full_Report"
#    config.report_types = [:html]
#    config.report_title = "Android Automation Report"
#    config.color = "cyan"
#    config.additional_info = {
#      Environment: "CircleCI",
#    }
#     end
#
#     ReportBuilder.build_report
# end
