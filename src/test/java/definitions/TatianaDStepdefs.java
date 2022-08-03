package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class TatianaDStepdefs {
    @Given("I go to {string}")
    public void iGoTo(String arg0) {
        getDriver().get("http://ask-internship.portnov.com/#/login");
    }

    @And("I click on {string} in  the student list \\(TD)")
    public void iClickOnInTheStudentListTD(String name) {
        List<WebElement> studentNames = getDriver().findElements(By.xpath("//mat-list-option"));
        for (WebElement item : studentNames) {
            if (item.getText().contains(name)) {
                item.click();
            }
        }
    }

    @Then("I click on the assignment {string} in the assignment list \\(TD)")
    public void iClickOnTheAssignmentInTheAssignmentListTD(String assignment) {
        List<WebElement> assignmentList = getDriver().findElements(By.xpath("//mat-expansion-panel//mat-expansion-panel-header//span[@class='mat-content']//mat-panel-title"));
        for (WebElement item : assignmentList) {
            if (item.getText().contains(assignment)) {
                item.click();
                break;
            }
        }
    }

    @Then("element with xpath {string} should contain text {string} \\(TD)")
    public void elementWithXpathShouldContainTextTD(String xpath, String text) {
        String actualText = getDriver().findElement(By.xpath(xpath)).getText();
        System.out.println("Text equals " + actualText);
        assertThat(actualText).containsIgnoringCase(text);
    }

    @Then("I refresh the page \\(TD)")
    public void iRefreshThePageTD() {
        getDriver().navigate().refresh();
    }

    @Then("I type {string} into Question  field \\(TD)")
    public void iTypeIntoQuestionFieldTD(String sQuestion) {
        getDriver().findElement(By.xpath("//textarea[@placeholder='Question *']")).sendKeys(sQuestion);
    }

    @Then("I verify that Question shows correct {string} \\(TD)")
    public void iVerifyThatQuestionShowsCorrectTD(String questionText) {
        String  actualQuestionText = getDriver().findElement(By.xpath("//h3[contains(text(),'" + questionText + "')]")).getText();
        System.out.println("Text equals " + actualQuestionText);
        assertThat(actualQuestionText).containsIgnoringCase(questionText);
    }

    @Then("error message {string} should be displayed \\(TD)")
    public void errorMessageShouldBeDisplayedTD(String errorMessage) {
        getDriver().findElement(By.xpath("//mat-error[contains (text(), 'This field is required')]")).isDisplayed();
        String actualErrorMessage = getDriver().findElement(By.xpath("//mat-error[contains (text(), 'This field is required')]")).getText();
        assertThat(actualErrorMessage).containsIgnoringCase(errorMessage);
    }

    @When("I enter {int} alphanumeric characters into Question field \\(TD)")
    public void iEnterAlphanumericCharactersTD(int length) {
            boolean useLetters = true;
            boolean useNumbers = true;
            String generatedString = RandomStringUtils.random(length, useLetters, useNumbers);
            System.out.println(generatedString);
            getDriver().findElement(By.xpath("//textarea[@placeholder='Question *']")).sendKeys(generatedString);
        }

}

