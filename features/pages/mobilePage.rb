require "rubygems"
require "appium_lib"


class MobileLogin
def start_server
  caps = {}
  caps["name"] = "Ruby Appium Example"
  caps["deviceName"] = "Galaxy S10"
  caps["platformName"] = "Android"
  caps["version"] = "10.0"
  caps["app"] = "mobile_apps/naukri.apk"

  #caps["realDevice"] = true

  @appium_driver = RemoteWebDriver::Driver.new({
    "caps" => caps,
    "appium_lib" => {
      :server_url => "http://127.0.0.1:4723/wd/hub",
    },
  }, true)
  @appium_driver = @appium_driver.start_driver


end

def login
  @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
  @wait.until { @appium_driver.find_element(:id, "b_login").displayed? }

  @appium_driver.find_element(:id, "b_login").click

  @appium_driver.find_element(:id, "et_email").send_keys "sivakolli"
  @appium_driver.find_element(:id, "et_password").send_keys "123456"
end


#result = driver.find_element(:accessibility_id, "sum")

# if (!result.nil?) && (result.text.eql? "15")
#   puts "Test Passed"
# else
#   puts "Test Failed"
# end
def kill_server
  @driver.quit
end
end
