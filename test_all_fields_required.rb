require 'selenium-webdriver'
require 'test/unit'

class LoginClass < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to("https://www.facebook.com/")

    @first_name = @driver.find_element(:name, "firstname")
    @last_name = @driver.find_element(:name, "lastname")
    @pass_wd = @driver.find_element(:name, "reg_passwd__")
    @email = @driver.find_element(:name, "reg_email__")
    @submit_button = @driver.find_element(:name, "websubmit")
  end

  def teardown
    if @_result != passed?
      @driver.save_screenshot("TestScreenshot #{self.name}")
    end
    @driver.quit
  end

  def test_no_fields_entered
    @submit_button.click

    assert_not_empty(@first_name.attribute("aria-describedby"))
    assert_not_empty(@last_name.attribute("aria-describedby"))
    assert_not_empty(@pass_wd.attribute("aria-describedby"))
    assert_not_empty(@email.attribute("aria-describedby"))
  end

  def test_firstname_entered
    @first_name.send_keys "Mike"
    sleep(1)
    @submit_button.click

    assert_nil(@first_name.attribute("aria-describedby"))
    assert_not_empty(@last_name.attribute("aria-describedby"))
    assert_not_empty(@pass_wd.attribute("aria-describedby"))
    assert_not_empty(@email.attribute("aria-describedby"))
  end

  def test_lastname_entered
    @last_name.send_keys "Tester"
    sleep(1)
    @submit_button.click

    assert_nil(@last_name.attribute("aria-describedby"))
    assert_not_empty(@first_name.attribute("aria-describedby"))
    assert_not_empty(@pass_wd.attribute("aria-describedby"))
    assert_not_empty(@email.attribute("aria-describedby"))
  end

  def test_email_entered
    @email.send_keys "mike.tester@test.com"
    sleep(1)
    @submit_button.click

    assert_nil(@email.attribute("aria-describedby"))
    assert_not_empty(@first_name.attribute("aria-describedby"))
    assert_not_empty(@pass_wd.attribute("aria-describedby"))
    assert_not_empty(@last_name.attribute("aria-describedby"))
  end

  def test_password_entered
    @pass_wd.send_keys "12345"
    sleep(1)
    @submit_button.click

    assert_nil(@pass_wd.attribute("aria-describedby"))
    assert_not_empty(@first_name.attribute("aria-describedby"))
    assert_not_empty(@email.attribute("aria-describedby"))
    assert_not_empty(@last_name.attribute("aria-describedby"))
  end

end

