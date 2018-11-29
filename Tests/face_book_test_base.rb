require 'selenium-webdriver'
require 'test/unit'
require_relative '../PageObjects/login_page'

class FaceBookTestBase < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @login_page = LoginPage.new(@driver)
    @driver.navigate.to("https://www.facebook.com/")
  end

  def teardown
    unless passed?
      @driver.save_screenshot("TestScreenshot #{self.name.to_s}.png")
      # I would store the screenshots in a better place, or convert to a base64 string and move to a whatever
      # system is being used as a test result reporting.
    end

    @driver.quit
  end

end