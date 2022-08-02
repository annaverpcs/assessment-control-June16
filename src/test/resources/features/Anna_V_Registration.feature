#Exercise for ASK automation
#Author: Anna V
    @registration
  Feature: Registration page
    Background:
      Given I navigate "http://ask-internship.portnov.com/#/registration"

    @registration1
    Scenario Outline: Email field verification with invalida data
      When I type <firstname> into firstName field AV
      When I type "Last" into lastName field AV
      When I type <email> into eMail field AVv
      Then I type "123" into Group Code field AV
      Then I type "12345" into Password field AV
      Then I type "12345" into Confirm Password field AV
      When I click "Register Me" button AV
      Then I confirm that "Should be a valid email address" is displayed AV


      Examples:
      |email             |firstname|
      |"abc)cde.com"     |"First"|
      |"abc$@efg.com"    |"ABC"  |
      |"abc.com"         |"First"|

