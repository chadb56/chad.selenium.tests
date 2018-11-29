require 'selenium-webdriver'
require 'test/unit'
require_relative '../PageObjects/login_page'
require_relative 'face_book_test_base'

class LoginClass < FaceBookTestBase


  def test_no_fields_entered
    # Verify that if no info is entered into any of the fields and the submit button is clicked, all
    # fields change to an error state.
    login_page.click_submit

    assert_equal(true , login_page.first_name_in_error_state)
    assert_equal(true , login_page.last_name_in_error_state)
    assert_equal(true , login_page.passwd_in_error_state)
    assert_equal(true , login_page.email_in_error_state)
  end

  def test_firstname_entered
    # Verify that if only the fires name is entered and the submit button is clicked, all fields except
    # for the first name filed is in an error state.
    login_page.set_first_name("Mike")
    login_page.click_submit

    assert_equal(true, login_page.first_name_in_ok_state)
    assert_equal(true , login_page.last_name_in_error_state)
    assert_equal(true , login_page.passwd_in_error_state)
    assert_equal(true , login_page.email_in_error_state)
  end

  def test_lastname_entered
    # Verify that if only the last name is entered and the submit button is clicked, all fields except
    # for the last name field is in an error state.
    login_page.set_last_name("McTester")
    login_page.click_submit

    assert_equal(true , login_page.last_name_in_ok_state)
    assert_equal(true , login_page.first_name_in_error_state)
    assert_equal(true , login_page.passwd_in_error_state)
    assert_equal(true , login_page.email_in_error_state)
  end

  def test_email_entered
    # Verify that if only the email is entered and the submit button is clicked, all fields except
    # for the email field is in an error state.
    login_page.set_email("mike.mctester@test.com")
    login_page.click_submit

    assert_equal(true , login_page.email_in_ok_state)
    assert_equal(true , login_page.first_name_in_error_state)
    assert_equal(true, login_page.passwd_in_error_state)
    assert_equal(true, login_page.last_name_in_error_state)
  end

  def test_password_entered
    # Verify that if only the password is entered and the submit button is clicked, all fields except
    # for the password field is in an error state.
    login_page.set_passwd("12345")
    login_page.click_submit

    assert_equal(true , login_page.passwd_in_ok_state)
    assert_equal(true, login_page.first_name_in_error_state)
    assert_equal(true, login_page.email_in_error_state)
    assert_equal(true, login_page.last_name_in_error_state)
  end

end

# in addition to these negative tests I would include tests that cover the different gender options.
# I would also test the DOB filed and see if there is a min age or max age requirement.
# I would also probably test for SQL injection exploits.

