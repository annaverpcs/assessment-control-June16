#ACB-378
  #Author Valeria Sorokovskaja


  @quizPoints
  Feature: Checking

    Background:
    Given I open url "http://ask-internship.portnov.com/#/login"
      Then I type "qa.sofi@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
      Then I click on element with xpath "//span[contains(text(),'Sign In')]"
      Then I wait for 1 sec

    @quizPoints1
    Scenario: Maximum amount of Points
      Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
      Then I wait for 1 sec
      Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
      Then I wait for 1 sec
      Then I type "Valeria Test" into element with xpath "//input[@placeholder='Title Of The Quiz *']"
      Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
      Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be displayed
      Then I click on element with xpath "//*[contains(text(),'Multiple-Choice')]"
      Then I



      @quizPoints1
      Scenario:

