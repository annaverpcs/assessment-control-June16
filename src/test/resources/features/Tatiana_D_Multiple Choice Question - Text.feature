#Automate test set "Multiple Choice Question - Text"
#https://jira.portnov.com/browse/ACB-379
#Author: Tatiana D

  @multiple_text
  Feature: Multiple Choice Question - Text

  Background:
    Given I open url "http://ask-internship.portnov.com/#/login"
    And I maximize window
    Then I type "kldw@goodvps.us" into element with xpath "//input[@formcontrolname='email']"
    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for 1 sec

  @multiple_text1
  Scenario Outline: Write valid question text

    #Create new quiz
    Given I wait for element with xpath "//h5[contains(text(),'Quizzes')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for 1 sec
    Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    Then I wait for 1 sec
    Then I type "Tatiana Quiz 1" into element with xpath "//input[@placeholder='Title Of The Quiz *']"
      #Click on Create new question button
    Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
      #Create new question
    Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be displayed
    Then I click on element with xpath "//*[contains(text(),'Multiple-Choice')]"
    And  I wait for 2 sec
    Then I type <questionText> into Question  field (TD)
    Then I type "Option 1" into element with xpath "//textarea[@placeholder='Option 1*']"
    Then I type "Option 2" into element with xpath "//textarea[@placeholder='Option 2*']"
    Then I click on element with xpath "(//mat-checkbox[@class='answer mat-checkbox mat-accent'])[2]"
    Then I click on element with xpath "//span[contains(text(),'Save')]"
    Then I wait for element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" to be present
    And I wait for 3 sec
    #Verification
    When I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]"
    And I wait for 2 sec
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]/../../..//span[contains(text(),'Preview')]"
    And I wait for 2 sec
    Then I verify that Question shows correct <questionText> (TD)
    And I click on element with xpath "//span[contains(text(),'Close')]"
    #Delete the Quiz
    And I wait for 2 sec
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]/../../..//span[contains(text(),'Delete')]"
    And I wait for 2 sec
    Then I click on element with xpath "//div[@mat-dialog-actions]//span[contains(text(),'Delete')]"
    Then I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" should not be present

    Examples:
    |questionText|
    |"How many centimeters in 0.5 meter"|
    |"2+2="                   |
    |"Boris Rhein was born on 2 January 1972 in Frankfurt. His father, Peter Rhein, headed a department at a local school. After obtaining his Abitur at Frankfurts Lessing-Gymnasium, Rhein studied law at Goethe University Frankfurt from 1991 until 1997. From 2001 until 2006, he practiced as a lawyer in his hometown."                                 |

    @multiple_text2
    Scenario: The field can not be empty

        #Create new quiz
      Given I wait for element with xpath "//h5[contains(text(),'Quizzes')]" to be present
      When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
      Then I wait for 1 sec
      Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
      Then I wait for 1 sec
      Then I type "Tatiana Quiz 1" into element with xpath "//input[@placeholder='Title Of The Quiz *']"
      #Click on Create new question button
      Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
      #Create new question
      Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be displayed
      Then I click on element with xpath "//*[contains(text(),'Multiple-Choice')]"
      And  I wait for 2 sec
      Then I type "Option 1" into element with xpath "//textarea[@placeholder='Option 1*']"
      Then I type "Option 2" into element with xpath "//textarea[@placeholder='Option 2*']"
      Then I click on element with xpath "(//mat-checkbox[@class='answer mat-checkbox mat-accent'])[2]"
      Then I click on element with xpath "//span[contains(text(),'Save')]"
      And I wait for 3 sec
      Then error message "This field is required" should be displayed (TD)

    @multiple_text3
    Scenario Outline: Check the field's length 1 char

      #Create new quiz
      Given I wait for element with xpath "//h5[contains(text(),'Quizzes')]" to be present
      Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
      Then I wait for 1 sec
      Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
      Then I wait for 1 sec
      Then I type "Tatiana Quiz 1" into element with xpath "//input[@placeholder='Title Of The Quiz *']"
      #Click on Create new question button
      Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
      #Create new question
      Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be displayed
      Then I click on element with xpath "//*[contains(text(),'Multiple-Choice')]"
      And  I wait for 2 sec
      #1  character
      When I enter <amount> alphanumeric characters into Question field (TD)
      Then I type "Option 1" into element with xpath "//textarea[@placeholder='Option 1*']"
      Then I type "Option 2" into element with xpath "//textarea[@placeholder='Option 2*']"
      Then I click on element with xpath "(//mat-checkbox[@class='answer mat-checkbox mat-accent'])[2]"
      Then I click on element with xpath "//span[contains(text(),'Save')]"
      Then I wait for element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" to be present
      And I wait for 3 sec
      #Delete the Quiz
      When I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]"
      And I wait for 2 sec
      Then I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]/../../..//span[contains(text(),'Delete')]"
      And I wait for 2 sec
      Then I click on element with xpath "//div[@mat-dialog-actions]//span[contains(text(),'Delete')]"
      Then I wait for 2 sec
      Then element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" should not be present

      Examples:
      |amount|
      |1     |
      |100   |







