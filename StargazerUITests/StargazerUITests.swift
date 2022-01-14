//
//  StargazerUITests.swift
//  StargazerUITests
//
//  Created by Renoy Chowdhury on 14/01/22.
//

import XCTest

class StargazerUITests: XCTestCase {

    func testSearchAndSwipe() throws {        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.textFields["ownerLabel"]/*[[".textFields[\"Owner\"]",".textFields[\"ownerLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["ownerLabel"]/*[[".textFields[\"Owner\"]",".textFields[\"ownerLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("octocat")
        
        app/*@START_MENU_TOKEN@*/.textFields["repositoryLabel"]/*[[".textFields[\"Repository\"]",".textFields[\"repositoryLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["repositoryLabel"]/*[[".textFields[\"Repository\"]",".textFields[\"repositoryLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("spoon-knife")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".buttons[\"searchButton\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.tables.element.swipeUp()
        app.tables.element.swipeUp()
        app.tables.element.swipeUp()
        app.tables.element.swipeUp()
        app.tables.element.swipeUp()
    }
    
    func testSearchemptyTextFields() throws {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".buttons[\"searchButton\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.alerts.element.label, "Attention")
        app.alerts.buttons.firstMatch.tap()
    }
    
    func testSearchWrongRepository() throws {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.textFields["ownerLabel"]/*[[".textFields[\"Owner\"]",".textFields[\"ownerLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["ownerLabel"]/*[[".textFields[\"Owner\"]",".textFields[\"ownerLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("octodog")
        
        app/*@START_MENU_TOKEN@*/.textFields["repositoryLabel"]/*[[".textFields[\"Repository\"]",".textFields[\"repositoryLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["repositoryLabel"]/*[[".textFields[\"Repository\"]",".textFields[\"repositoryLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("fork-knife")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".buttons[\"searchButton\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.alerts.element.label, "Error")
        app.alerts.buttons.firstMatch.tap()
        
    }
}
