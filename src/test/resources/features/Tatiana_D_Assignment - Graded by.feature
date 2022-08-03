#Automate test set "Assignment - Graded by"
#https://jira.portnov.com/browse/ACB-364
#Author: Tatiana D

  @graded_by
  Feature: Assignment - Graded by

  @graded_by1
  Scenario: Assignment's details table has "Graded By" column
    Given I open url "http://ask-internship.portnov.com/#/login"
    Then I type "kldw@goodvps.us" into element with xpath "//input[@formcontrolname='email']"
    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for 1 sec
    Given I click on element with xpath "//div[@class='mat-list-text']/*[contains(text(),'Assignments')]"
    And I wait for element with xpath "//mat-accordion/*[1]" to be present
    When  I click on element with xpath "//mat-accordion/*[1]"
    And I wait for 2 sec
    Then element with xpath "//mat-accordion/*[1]//th[contains(text(),'Graded By')]" should be present

  @graded_by2
  Scenario: "Graded By" shows "-" if Assignment is not submitted yet
    Given I open url "http://ask-internship.portnov.com/#/login"
    Then I type "kldw@goodvps.us" into element with xpath "//input[@formcontrolname='email']"
    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for 1 sec
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
    Then I click on element with xpath "//*[contains(text(),'Single-Choice')]"
    Then I type "Question 1" into element with xpath "//textarea[@formcontrolname='question']"
    Then I type "Option 1" into element with xpath "//textarea[@placeholder='Option 1*']"
    Then I type "Option 2" into element with xpath "//textarea[@placeholder='Option 2*']"
    Then I click on element with xpath "(//mat-radio-button[@class='mat-radio-button mat-accent'])[2]"
    Then I click on element with xpath "//span[contains(text(),'Save')]"
    Then I wait for element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" to be present
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" should contain text "Tatiana Quiz 1"
      #Create new assignment
    When I click on element with xpath "//div[@class='mat-list-text']/*[contains(text(),'Assignments')]"
    And  I click on element with xpath "//span[contains(text(),'Create New Assignment')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    And I click on element with xpath "//mat-select[@placeholder='Select Quiz To Assign']"
    And I wait for element with xpath "//span[contains(text(),'Tatiana Quiz 1')]" to be present
    And I click on element with xpath "//span[contains(text(),'Tatiana Quiz 1')]"
    And I click on "Peter Gone" in  the student list (TD)
    And I click on element with xpath "//button[@class='mat-raised-button mat-primary']"
      #Check the Graded By colon
    And I click on element with xpath "//div[@class='mat-list-text']/*[contains(text(),'Assignments')]"
    And I wait for 5 sec
    When I click on the assignment "Tatiana Quiz 1" in the assignment list (TD)
    And I wait for element with xpath "//mat-expansion-panel[1]//div[contains(@class, 'mat-expansion-panel-content')]//td[@class='graded-by']" to be present
    Then element with xpath "//mat-expansion-panel[1]//div[contains(@class, 'mat-expansion-panel-content')]//td[@class='graded-by']" should contain text "-" (TD)

    @graded_by3
    Scenario: "Graded By" shows "Auto" if quiz was graded automatically and does not require teacher's review
      Given I open url "http://ask-internship.portnov.com/#/login"
      And I maximize window
      Then I type "mfornige@btcmod.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "123456" into element with xpath "//input[@formcontrolname='password']"
      Then I click on element with xpath "//span[contains(text(),'Sign In')]"
      Then I wait for 1 sec
      When I click on element with xpath "//span[contains(text(),'Go To My Assignments')]"
      Then I wait for element with xpath "//button[@class='mat-raised-button mat-primary']" to be present
      And I wait for 2 sec
      And I click on element with xpath "//button[@class='mat-raised-button mat-primary']"
      And I wait for 2 sec
      And I click on element using JavaScript with xpath "(//input[contains(@class,'mat-radio-input')])[2]"
      And I wait for 2 sec
      And I click on element with xpath "//button[@class='mat-raised-button mat-primary']"
      And I wait for 2 sec
      And I click on element using JavaScript with xpath "//ac-modal-notification/div[@class='mat-dialog-actions']/button"
      And I wait for 2 sec
      And I click on element using JavaScript with xpath "//h5[contains(text(),'Log Out')]"
      And I wait for 1 sec
      And I click on element using JavaScript with xpath "//span[contains(text(),'Log Out')]/.."
      #Login as a Teacher
      And I wait for 3 sec
      Then I type "kldw@goodvps.us" into element with xpath "//input[@formcontrolname='email']"
      Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
      Then I click on element with xpath "//span[contains(text(),'Sign In')]"
      Then I wait for 1 sec
      #Check Graded By
      When I click on element with xpath "//div[@class='mat-list-text']/*[contains(text(),'Assignments')]"
      And I wait for element with xpath "//span[contains(text(),'Tatiana Quiz 1')]" to be present
      When I click on the assignment "Tatiana Quiz 1" in the assignment list (TD)
      And I wait for element with xpath "//mat-expansion-panel[1]//div[contains(@class, 'mat-expansion-panel-content')]//td[@class='graded-by']" to be present
      Then element with xpath "//mat-expansion-panel[1]//div[contains(@class, 'mat-expansion-panel-content')]//td[@class='graded-by']" should contain text "Auto" (TD)
#      #Delete the assignment
      And I click on element using JavaScript with xpath "//mat-expansion-panel//mat-expansion-panel-header//span[@class='mat-content']//mat-panel-title//button"
      Then I wait for 3 sec
      And I click on element using JavaScript with xpath "//span[contains(text(), 'Delete Assignment')]"
      And I wait for 3 sec
      And I click on element using JavaScript with xpath "//span[contains(text(), 'Delete')]"
      And I wait for 3 sec
      #Delete the quiz
      When I click on element with xpath "//div[@class='mat-list-text']/*[contains(text(),'Quizzes')]"
      And I wait for 2 sec
      When I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]"
      And I wait for 2 sec
      Then I click on element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]/../../..//span[contains(text(),'Delete')]"
      And I wait for 2 sec
      Then I click on element with xpath "//div[@mat-dialog-actions]//span[contains(text(),'Delete')]"
      Then I wait for 2 sec
      Then element with xpath "//mat-panel-title[contains(text(),'Tatiana Quiz 1')]" should not be present

  