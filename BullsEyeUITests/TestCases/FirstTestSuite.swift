/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest

class FirstTestSuite: TestCase {
  
  let page = BullsEyePageObject()


  func testCheckAlertSlide() throws {
    
    if page.typeButton.isSelected {
      page.slideButton.tap()
    }
    
    XCTAssertTrue(page.slideButton.exists, "Экран содержит вкладку Slide")
    XCTAssertTrue(page.slideButton.isSelected, "По умолчанию активна вкладка Slide")
    
    page.hitMeButton.tap()
    XCTAssertTrue(page.scoreAlert.exists, "Экран содержить алерт с надписью 'you scored 100 points'")
  }
  
  func testtestCheckAlertType() throws {
    
    page.typeButton.tap()
    XCTAssertTrue(page.typeButton.isSelected, "После тапа на вкладку Type, активна вкладка Type")
    
    page.scoreTextField.tap()
    page.scoreTextField.typeText("50")
    
    page.hitMeButton.tap()
    XCTAssertTrue(page.scoreAlert.exists, "Экран содержить алерт с надписью 'you scored 100 points'")
  }
  
    func testCheckErrorAlertType() throws {
        
      page.typeButton.tap()
      XCTAssertTrue(page.typeButton.isSelected, "После тапа на вкладку Type, активна вкладка Type")
      
      page.hitMeButton.tap()
      XCTAssertTrue(page.errorAlert.exists, "Экран содержить алерт с надписью 'Not A Number'")
    }
  
    func testResetPoints() throws {
      
      if page.typeButton.isSelected {
        page.slideButton.tap()
      }
      
      page.hitMeButton.tap()
      XCTAssertTrue(page.scoreAlert.exists, "Экран содержить алерт с надписью 'you scored 100 points'")
      
      page.typeButton.tap()
      XCTAssertTrue(page.typeButton.isSelected, "После тапа на вкладку Type, активна вкладка Type")
      
      let expectedRoundTwoText = "Round: 2"
      let scoreAfterRound = "Score: 100"
      XCTAssertEqual(page.round.label, expectedRoundTwoText,"Ожидали, текущее значение раунда '\(expectedRoundTwoText)'")
      XCTAssertEqual(page.score.label, scoreAfterRound,"Ожидали, текущее значение раунда '\(scoreAfterRound)'")

      page.startOverButton.tap()
      let expectedRoundOneText = "Round: 1"
      let initialScore = "Score: 0"
      XCTAssertEqual(page.round.label, expectedRoundOneText,"Ожидали, текущее значение раунда '\(expectedRoundOneText)'")
      XCTAssertEqual(page.score.label, initialScore,"Ожидали, текущее значение раунда '\(initialScore)'")
    }
}
