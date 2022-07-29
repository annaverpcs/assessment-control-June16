package definitions;

import cucumber.api.java.en.Given;

import static support.TestContext.getDriver;

public class ValeriaStepDefs {
    @Given("I nagivated {string}")
    public void iNagivated(String arg0) {
        getDriver().get("http://ask-internship.portnov.com/#/login");
    }
}
