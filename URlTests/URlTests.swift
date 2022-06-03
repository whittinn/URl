//
//  URlTests.swift
//  URlTests
//
//  Created by Nathaniel Whittington on 3/23/22.
//

import XCTest
@testable import URl

class URlTests: XCTestCase {
    var vm : ViewModel!
  
    override func setUpWithError() throws {
        vm = ViewModel()
     
        
        vm.array = [Album(id: 0, title: "1", url: "o", thumbnailUrl: "a"),Album(id: 1, title: "d", url: ".s", thumbnailUrl: "a")
        ]
    
       
    }

    override func tearDownWithError() throws {
        vm = nil
        
    }

    func testFirstMethod(){
      
        XCTAssertEqual(self.vm.getArraytitles(index: 0), "1")
    }

}
