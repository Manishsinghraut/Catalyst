@all
Feature: Testing zoom in, zoom out, zoom to fit and Full Screen functionality on Schedule tab (Ref : Jira Ticket No : AUTOMATION-992)

  Scenario Outline: I import file Construction Phase location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | ConstructionPhase.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify Timeline
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name        |
    | DeleteAccess | Delete Access Access | Construction Phase |

  Scenario Outline: As a delete user I verify Zoom Out view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click on the "Zoom out" button at the top
#    And I click on the "Zoom out" button at the top
#    And I verify Zoom out is clicked Month shall be displayed along with Weeks for the specific month
    And I verify the defualt gantt chart view
      | Mon 23 Sep 2019~Mon 30 Sep 2019~Mon 07 Oct 2019~Mon 14 Oct 2019~Mon 21 Oct 2019~Mon 28 Oct 2019 |
      | M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S             |
#      | Weeks: Mon 23 Sep 2019~Mon 30 Sep 2019~Mon 07 Oct 2019~Mon 14 Oct 2019~Mon 21 Oct 2019~Mon 28 Oct 2019~Mon 04 Nov 2019~Mon 11 Nov 2019~Mon 18 Nov 2019~Mon 25 Nov 2019~Mon 02 Dec 2019~Mon 09 Dec 2019~Mon 16 Dec 2019~Mon 23 Dec 2019~Mon 30 Dec 2019~Mon 06 Jan 2020~Mon 13 Jan 2020~Mon 20 Jan 2020~Mon 27 Jan 2020~Mon 03 Feb 2020~Mon 10 Feb 2020~Mon 17 Feb 2020~Mon 24 Feb 2020~Mon 02 Mar 2020~Mon 09 Mar 2020~Mon 16 Mar 2020~Mon 23 Mar 2020~Mon 30 Mar 2020~Mon 06 Apr 2020~Mon 13 Apr 2020 |
#      | Days: ~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S                                                             |
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I verify when Zoom out button is clicked Month shall be displayed along with Weeks for the specific month
      | month: 11/01/2019~12/01/2019~01/01/2020~02/01/2020                                                                     |
      | Weeks: 11 Nov~18 Nov~25 Nov~02 Dec~09 Dec~16 Dec~23 Dec~30 Dec~06 Jan~13 Jan~20 Jan~27 Jan~03 Feb~10 Feb~17 Feb~24 Feb |
#      | month: 03/18/2019~04/01/2019~05/01/2019~06/01/2019~07/01/2019~08/01/2019~09/01/2019~10/01/2019~11/01/2019~12/01/2019~01/01/2020~02/01/2020~03/01/2020~04/01/2020~05/01/2020~06/01/2020~07/01/2020~08/01/2020~09/01/2020~10/01/2020 |
#      | Weeks: 18 Mar~25 Mar~01 Apr~08 Apr~15 Apr~22 Apr~29 Apr~06 May~13 May~20 May~27 May~03 Jun~10 Jun~17 Jun~24 Jun                                                                                                                    |
#      | Weeks: 01 Jul~08 Jul~15 Jul~22 Jul~29 Jul~05 Aug~12 Aug~19 Aug~26 Aug~02 Sep~09 Sep~16 Sep~23 Sep~30 Sep~07 Oct~14 Oct~21 Oct~28 Oct                                                                                               |
#      | Weeks: 04 Nov~11 Nov~18 Nov~25 Nov~02 Dec~09 Dec~16 Dec~23 Dec~30 Dec~06 Jan~13 Jan~20 Jan~27 Jan~03 Feb~10 Feb~17 Feb~24 Feb~02 Mar~09 Mar~16 Mar~23 Mar~30 Mar                                                                   |
#      | Weeks: 06 Apr~13 Apr~20 Apr~27 Apr~04 May~11 May~18 May~25 May~01 Jun~08 Jun~15 Jun~22 Jun~29 Jun~06 Jul~13 Jul~20 Jul~27 Jul                                                                                                      |
#      | Weeks: 03 Aug~10 Aug~17 Aug~24 Aug~31 Aug~07 Sep~14 Sep~21 Sep~28 Sep~05 Oct~12 Oct~19 Oct                                                                                                                                         |
#          And I verify Zoom out is clicked year shall be displayed with month
#      | Apr 2018                                                                                                                                                                                                                           |
      #      | May 2018  |
      #      | Jun 2018  |
      #      | Jul 2018  |
      #      | Aug 2018  |
      #      | Sept 2018 |
      #      | Oct 2018  |
      #      | Nov 2018  |
      #      | Dec 2018  |
      #      | Jan 2019  |
      #      | Feb 2019  |
      #      | Mar 2019  |
      #      | Apr 2019  |
      #      | May 2019  |
      #      | Jun 2019  |
      #      | Jul 2019  |
      #      | Aug 2019  |
      #      | Sept 2019 |
      #      | Oct 2019  |
      #      | Nov 2019  |
      #      | Dec 2019  |
      #      | Jan 2020  |
      #      | Feb 2020  |
      #      | Mar 2020  |
      #      | Apr 2020  |
      #      | May 2020  |
      #      | Jun 2020  |
      #      | Jul 2020  |
      #      | Aug 2020  |
      #      | Sept 2020 |
      #      | Oct 2020  |
      #      | Nov 2020  |
      #      | Dec 2020  |
      #      | Jan 2021  |
      #      | Feb 2021  |
      #      | Mar 2021  |
      #      | Apr 2021  |
      #      | May 2021  |
      #      | Jun 2021  |
      #      | Jul 2021  |
      #      | Aug 2021  |
      #      | Sept 2021 |
      #      | Oct 2021  |
      #      | Nov 2021  |
      #      | Dec 2021  |
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I verify when Zoom out button is clicked year shall be displayed along with Months
      | Years: 2019~2020                                                                |
      | Months: Sep 2019~Oct 2019~Nov 2019~Dec 2019~Jan 2020~Feb 2020~Mar 2020~Apr 2020 |
#      | Years: 2018~2019~2020~2021                                                                                                                                                                                                                                                                                                                                                                                                   |
#      | Months: Apr 2018~May 2018~Jun 2018~Jul 2018~Aug 2018~Sep 2018~Oct 2018~Nov 2018~Dec 2018~Jan 2019~Feb 2019~Mar 2019~Apr 2019~May 2019~Jun 2019~Jul 2019~Aug 2019~Sep 2019~Oct 2019~Nov 2019~Dec 2019~Jan 2020~Feb 2020~Mar 2020~Apr 2020~May 2020~Jun 2020~Jul 2020~Aug 2020~Sep 2020~Oct 2020~Nov 2020~Dec 2020~Jan 2021~Feb 2021~Mar 2021~Apr 2021~May 2021~Jun 2021~Jul 2021~Aug 2021~Sep 2021~Oct 2021~Nov 2021~Dec 2021 |

    And I click on the "Zoom out" button at the top
#    And I verify Zoom out is clicked Quarters shall be displayed
#      | Q2 |
#      | Q3 |
#      | Q4 |
#      | Q1 |
#      | Q2 |
#      | Q3 |
#      | Q4 |
#      | Q1 |
#      | Q2 |
#      | Q3 |
#      | Q4 |
#      | Q1 |
#      | Q2 |
#      | Q3 |
#      | Q4 |
#      | Q1 |
#      | Q2 |
#      | Q3 |
#      | Q4 |
#      | Q1 |
#      | Q2 |
#      | Q3 |
#      | Q4 |

    And I verify when Zoom out button is clicked year shall be displayed along with Quarters
      | Years: 2019~2020    |
      | Months: Q3~Q4~Q1~Q2 |
#      | Years: 2017~2018~2019~2020~2021~2022                                                                                                                                                                                                                                                                                                                                                                                         |
#      | Months: Apr 2018~May 2018~Jun 2018~Jul 2018~Aug 2018~Sep 2018~Oct 2018~Nov 2018~Dec 2018~Jan 2019~Feb 2019~Mar 2019~Apr 2019~May 2019~Jun 2019~Jul 2019~Aug 2019~Sep 2019~Oct 2019~Nov 2019~Dec 2019~Jan 2020~Feb 2020~Mar 2020~Apr 2020~May 2020~Jun 2020~Jul 2020~Aug 2020~Sep 2020~Oct 2020~Nov 2020~Dec 2020~Jan 2021~Feb 2021~Mar 2021~Apr 2021~May 2021~Jun 2021~Jul 2021~Aug 2021~Sep 2021~Oct 2021~Nov 2021~Dec 2021 |

    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
    And I click on the "Zoom out" button at the top
#    And I verify Zoomed out to max shall displays years with five year span
#      | 1994 |
#      | 1999 |
#      | 2004 |
#      | 2009 |
#      | 2014 |
#      | 2019 |
#      | 2024 |
#      | 2029 |
#      | 2034 |
#      | 2039 |
#      | 2044 |
    And I verify Zoomed out to max shall displays years with five year span
      | Years: 2014~2019 |
#      | Years: 1994~1999~2004~2009~2014~2019~2024~2029~2034~2039~2044 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name        |
    | DeleteAccess | Delete Access Access | Construction Phase |

  Scenario Outline: As a delete user I verify Zoom to fit view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click on the "Zoom to fit" button at the top
    And I clicking on Zoom to fit shall display the default view
      | Mon 23 Sep 2019~Mon 30 Sep 2019~Mon 07 Oct 2019~Mon 14 Oct 2019~Mon 21 Oct 2019~Mon 28 Oct 2019 |
      | M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S             |
#      | Weeks: Mon 23 Sep 2019~Mon 30 Sep 2019~Mon 07 Oct 2019~Mon 14 Oct 2019~Mon 21 Oct 2019~Mon 28 Oct 2019~Mon 04 Nov 2019~Mon 11 Nov 2019~Mon 18 Nov 2019~Mon 25 Nov 2019~Mon 02 Dec 2019~Mon 09 Dec 2019~Mon 16 Dec 2019~Mon 23 Dec 2019~Mon 30 Dec 2019~Mon 06 Jan 2020~Mon 13 Jan 2020~Mon 20 Jan 2020~Mon 27 Jan 2020~Mon 03 Feb 2020~Mon 10 Feb 2020~Mon 17 Feb 2020~Mon 24 Feb 2020~Mon 02 Mar 2020~Mon 09 Mar 2020~Mon 16 Mar 2020~Mon 23 Mar 2020~Mon 30 Mar 2020~Mon 06 Apr 2020~Mon 13 Apr 2020 |
#      | Days: ~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S~M~T~W~T~F~S~S                                                             |
    And I click on the "Zoom in" button at the top
    And I verify when Zoom in button is clicked Month shall be displayed along with Weeks for the specific month
      | Months: 2019 December 30~2020 January 06                      |
      | Days: 02 Jan~03 Jan~04 Jan~05 Jan~06 Jan~07 Jan~08 Jan~09 Jan |
#      | Months: 2019 November 25~2019 December 02~2019 December 09~2019 December 16 2019~December 23 2019~December 30 2020~January 06 2020~January 13 2020~January 20~2020 January 27~2020 February 10                        |
#      | Days: 25 Nov~26 Nov~27 Nov~28 Nov~29 Nov~30 Nov                                                                                                                                                                       |
#      | Days: 1 Dec~2 Dec~3 Dec~4 Dec~5 Dec~6 Dec~7 Dec~8 Dec~9 Dec~10 Dec~11 Dec~12 Dec~13 Dec~14 Dec~15 Dec~16 Dec~17 Dec~18 Dec~19 Dec~20 Dec~21 Dec~22 Dec~23 Dec~24 Dec~25 Dec~26 Dec~27 Dec~28 Dec~29 Dec~30 Dec~31 Dec |
#      | Days: 1 Jan~2 Jan~3 Jan~4 Jan~5 Jan~6 Jan~7 Jan~8 Jan~9 Jan~10 Jan~11 Jan~12 Jan~13 Jan~14 Jan~15 Jan~16 Jan~17 Jan~18 Jan~19 Jan~20 Jan~21 Jan~22 Jan~23 Jan~24 Jan~25 Jan~26 Jan~27 Jan~28 Jan~29 Jan~30 Jan~31 Jan |
#      | Days: 1 Feb~2 Feb~3 Feb~4 Feb~5 Feb~6 Feb~7 Feb~8 Feb~9 Feb~ 10 Feb~11 Feb~12 Feb~13 Feb~14 Feb~15 Feb~16 Feb                                                                                                         |

    And I click on the "Zoom in" button at the top
    And I verify when Zoom in button is clicked hours shall be displayed along with days for the specific month
      | Days: Thu 26/12~Fri 27/12~Sat 28/12~Sun 29/12~Mon 30/12~Tue 31/12~Wed 01/01~Thu 02/01~Fri 03/01~Sat 04/01~Sun 05/01~Mon 06/01~Tue 07/01~Wed 08/01~Thu 09/01~Fri 10/01~Sat 11/01~Sun 12/01~Mon 13/01~Tue 14/01~Wed 15/01~Thu 16/01                                                                                                                                                                                                                                                         |
      | Hours: 12:00~18:00~0:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00~12:00~18:00~0:00~6:00 |
    And I click on the "Zoom in" button at the top
    And I verify when Zoom in button is clicked minuts shall be displayed along with hours for the specific day
      | Days: Sun, 6AM/05~Sun, 7AM/05~Sun, 8AM/05~Sun, 9AM/05~Sun, 10AM/05~Sun, 11AM/05~Sun, 12AM/05~Sun, 1PM/05~Sun, 2PM/05~Sun, 3PM/05~Sun, 4PM/05~Sun, 5PM/05~Sun, 6PM/05~Sun, 7PM/05~Sun, 8PM/05~Sun, 9PM/05~Sun, 10PM/05~Sun, 11PM/05~Mon, 12AM/06                                                                                                                                                                                       |
      | Days: Mon, 12AM/06~Mon, 1AM/06~Mon, 2AM/06~Mon, 3AM/06~Mon, 4AM/06~Mon, 5AM/06~Mon, 6AM/06~Mon, 7AM/06~Mon, 8AM/06~Mon, 9AM/06~Mon, 10AM/06~Mon, 11AM/06~Mon, 12PM/06~Mon, 1PM/06~Mon, 2PM/06~Mon, 3PM/06~Mon, 4PM/06~Mon, 5PM/06                                                                                                                                                                                                     |
      | Minuts: 45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00~15~30~45~00 |
    And I click on the "Zoom in" button at the top
    And I verify when Zoom in button is clicked seconds shall be displayed along with hours for the specific day
      | Days: Sun, 9PM/05~Sun, 10PM/05~Sun, 11PM/05~Sun, 12AM/05~Sun, 1AM/06~Sun, 2AM/06                                                                                                                       |
      | Seconds:05~10~15~20~25~30~35~40~45~50~55~05~10~15~20~25~30~35~40~45~50~5505~10~15~20~25~30~35~40~45~50~5505~10~15~20~25~30~35~40~45~50~5505~10~15~20~25~30~35~40~45~50~5505~10~15~20~25~30~35~40~45~50 |

    And I click on the "Full Screen" action panel button
    And I verify the full screen of gantt chart schedule view
    And I click on the "Exit Full Screen" action panel button
    And I expand gantt chart
    And I verify the defualt view of the gantt chart
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name        |
    | DeleteAccess | Delete Access Access | Construction Phase |

