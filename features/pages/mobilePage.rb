require 'rubygems'
require 'appium_lib'

class MobileLogin
  def start_server
    caps = {}
    caps['name'] = 'Ruby Appium Example'
    caps['deviceName'] = 'Samsung Galaxy S10e'
    caps['platformName'] = 'Android'
    caps['build'] = 'Android Build Sample'
    caps['project'] = 'Naukri'
    caps['name'] = 'Login Scenario'
    caps['version'] = '9.0'
    caps['app'] = 'bs://894a3e3631eb11539ad9be734bda317b3f072e53'

    # caps["realDevice"] = true

    # @appium_driver = Selenium::WebDriver.for :remote
    @appium_driver = Appium::Driver.new({
                                          'caps' => caps,
                                          'appium_lib' => {
                                            server_url: 'http://siva266:7Wfwz8qNKAn9X4XyNTXE@hub.browserstack.com:80/wd/hub'
                                          }
                                        }, true)
    @appium_driver = @appium_driver.start_driver
  end

  def login
    @wait = Selenium::WebDriver::Wait.new(timeout: 60)
    @wait.until { @appium_driver.find_element(:id, 'b_login').displayed? }

    @appium_driver.find_element(:id, 'b_login').click
    sleep 5
    @appium_driver.find_element(:id, 'et_email').send_keys 'sivakolli'
    @appium_driver.find_element(:id, 'et_password').send_keys '123456'
  end

  # result = driver.find_element(:accessibility_id, "sum")

  # if (!result.nil?) && (result.text.eql? "15")
  #   puts "Test Passed"
  # else
  #   puts "Test Failed"
  # end
  def kill_server
    @appium_driver.quit
  end
end
