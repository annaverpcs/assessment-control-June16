# Automation Test Set - Registration First Name
  #https://jira.portnov.com/browse/ACB-393
  #Author Valeria Sorokovskaja

@registration
Feature: Registration First Name

  Background:
    Given I open url "http://ask-internship.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I click on element with xpath "//span[contains(text(),'Register Now')]"
    And I wait for 1 sec
    And element with xpath "//*[contains(text(),'Registration')]" should be present

  @registration1
  Scenario: First name field allows to use letters
    When I type "Albina" into element with xpath "//input[@placeholder='First Name']"
    Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
    Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "12345" into element with xpath "//input[@placeholder='Password']"
    Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present

  @registration2
  Scenario: First name field allows to use numbers
    When I type "12345" into element with xpath "//input[@placeholder='First Name']"
    Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
    Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "12345" into element with xpath "//input[@placeholder='Password']"
    Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present

  @registration3
  Scenario: First name field allows to use letters and numbers
    When I type "Albina123" into element with xpath "//input[@placeholder='First Name']"
    Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
    Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "12345" into element with xpath "//input[@placeholder='Password']"
    Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present

  @registration4
  Scenario: First name field allows to use special characters
    When I type "!@#$%" into element with xpath "//input[@placeholder='First Name']"
    Then I click on element with xpath "//input[@placeholder='Last Name']"
    And element with xpath "//*[contains(text(),'Should contain only latin characters, space or numbers')]" should be present

  @registration5
  Scenario: First name field allows to use special characters
    When I type "Albina12345!@#$%" into element with xpath "//input[@placeholder='First Name']"
    Then I click on element with xpath "//input[@placeholder='Last Name']"
    And element with xpath "//*[contains(text(),'Should contain only latin characters, space or numbers')]" should be present

  @registration6
  Scenario: First name field is left blank
    When I type "" into element with xpath "//input[@placeholder='First Name']"
    Then I click on element with xpath "//input[@placeholder='Last Name']"
    And element with xpath "//input[@placeholder='First Name']/../../../..//*[contains(text(),'This field is required')]" should be present

  @registration7
  Scenario: First name should accept 98 characters
    When I type "asldkfjasldfkjalkjf2938472983472938429384 aasdfkasjhfd 2938792384294 skdjfhjhdfajshf 283782374827jh" into element with xpath "//input[@placeholder='First Name']"
    Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
    Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "12345" into element with xpath "//input[@placeholder='Password']"
    Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present

    @registration8
    Scenario: First Name should not allow more that 98 characters
      When I type "asldkfjasldfkjalkjf2938472983472938429384i aasdfkasjhfd 2938792384294 skdjfhjhdfajshf 283782374827jh" into element with xpath "//input[@placeholder='First Name']"
      Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
      Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
      Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
      Then I type "12345" into element with xpath "//input[@placeholder='Password']"
      Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for 2 sec
      And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present

      @registration9
      Scenario: First name field should accept minimum 1 character
        When I type "A" into element with xpath "//input[@placeholder='First Name']"
        Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
        Then I type "abc@gmail.com" into element with xpath "//input[@placeholder='Email']"
        Then I type "ACB" into element with xpath "//input[@placeholder='Group Code']"
        Then I type "12345" into element with xpath "//input[@placeholder='Password']"
        Then I type "12345" into element with xpath "//input[@placeholder='Confirm Password']"
        And I click on element with xpath "//button[@type='submit']"
        And I wait for 2 sec
        And element with xpath "//*[contains(text(),'You have been Registered.')]" should be present


        @registration10
        Scenario: Whitespaces are not allowed
          When I type "Albina Junior" into element with xpath "//input[@placeholder='First Name']"
          Then I type "B" into element with xpath "//input[@placeholder='Last Name']"
          And element with xpath "//*[contains(text(),'Should contain only latin characters, space or numbers')]" should be present

          #whitespaces are allowed and is written error message, how to procede? Just file a bug?







              





