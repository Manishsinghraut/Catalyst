Feature: Example that illustrates how you can write a Cucumber test case. The idea is to
  1) Login with administrator access rights
  2) Import security
  3) Import members
  4) Import various entities (e.g. Contracts)
  The above steps seed the database with records on which your test case depends. Now
  you can switch users to one of the members you imported so your test will be affected
  by the access rights of that member. Finally you exercise the IWMS web-ui via selenium
  to test what you originally intended on testing.

  Scenario:
    Given I login to IWMS using LxAdmin credentials
#      And I import "Data/security/tutorial.xml"
#      And I import "Data/members/tutorial.xls"
#      And I import "Data/entities/tutorial.xml"
      And I switch to user "bobc"
     Then I take a screenshot to file "logged-in.png"
