package definitions;

import cucumber.api.java.en.Given;

import static support.TestContext.getDriver;

public class SvitlanaStepDefs {
    @Given("I navigates {string}")
    public void iNavigates(String arg0) {
        getDriver().get("http://ask-internship.portnov.com/#/login");

    }
}
