#Exercise for ASK automation
#Author: Anna V

  @homepage
  Feature: Quiz verification

    Background:
      Given I open url "http://ask-internship.portnov.com/#/login"
      Then I type "annaverpcs.ask@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
      Then I click on element with xpath "//span[contains(text(),'Sign In')]"
      Then I wait for 1 sec

    @homepage1
    Scenario: Create a quiz
      When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
      Then I wait for 1 sec
      Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
      Then I wait for 1 sec
      Then I type "0 Anna Quiz Demo" into element with xpath "//input[@placeholder='Title Of The Quiz *']"
      #click on Create new question button
      Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
      #create new question
      Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be displayed
      Then I click on element with xpath "//*[contains(text(),'Single-Choice')]"
      Then I type "Question Demo 1" into element with xpath "//textarea[@formcontrolname='question']"
      Then I type "Option 1 Demo 1" into element with xpath "//textarea[@placeholder='Option 1*']"
      Then I type "Option 2 Demo 1" into element with xpath "//textarea[@placeholder='Option 2*']"
      Then I click on element with xpath "(//mat-radio-button[@class='mat-radio-button mat-accent'])[2]"
      Then I click on element with xpath "//span[contains(text(),'Save')]"
      Then I wait for 1 sec
      Then element with xpath "//mat-panel-title[contains(text(),'0 Anna Quiz Demo')]" should contain text "0 Anna Quiz Demo"
     #delete a quiz
      When I click on element with xpath "//mat-panel-title[contains(text(),'0 Anna Quiz Demo')]"
      Then I click on element with xpath "//mat-panel-title[contains(text(),'0 Anna Quiz Demo')]/../../..//span[contains(text(),'Delete')]"
      Then I click on element with xpath "//div[@mat-dialog-actions]//span[contains(text(),'Delete')]"
      Then I wait for 2 sec
      Then element with xpath "//mat-panel-title[contains(text(),'0 Anna Quiz Demo')]" should not be present

      


