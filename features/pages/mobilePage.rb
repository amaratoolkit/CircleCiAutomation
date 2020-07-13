require "rubygems"
require "appium_lib"


class MobileLogin
def start_server
  caps = {}
  caps["name"] = "Ruby Appium Example"
  caps["deviceName"] = "amsung Galaxy S10e"
  caps["platformName"] = "Android"
  caps["version"] = "9.0"
  caps["build"] = "Android Test"
 caps["project"] = "Naukri"
 caps["name"] = "Sample Test"
  #caps["app"] = "mobile_apps/naukri.apk"
  caps["app"] = "bs://e85129c8ea86099f3d7abb096d287f1decc1ecd1"
  #caps["realDevice"] = true
#:server_url => "http://127.0.0.1:4723/wd/hub",
  #@appium_driver = Selenium::WebDriver.for :remote
  @appium_driver = Appium::Driver.new({
    "caps" => caps,
    "appium_lib" => {
      :server_url => "http://siva518:UQZfAXgr43CUqsZKxhF6@hub.browserstack.com:80/wd/hub",
    },
  }, true)
  @appium_driver = @appium_driver.start_driver


end

def login
  @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
  @wait.until { @appium_driver.find_element(:id, "b_login").displayed? }

  @appium_driver.find_element(:id, "b_login").click
  sleep 5
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
  @appium_driver.quit
end
end
