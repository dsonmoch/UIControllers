//
//  URLSessions.swift
//  LifeCycleTests
//
//  Created by Admin on 20/10/22.
//

import XCTest
@testable import LifeCycle

final class URLSessions: XCTestCase {
    let validatorObj = URLSessionValidator()
    let urlSessionObj = URLSessionViewController()
    func testCreateUserInputValidationWithEmptyStringsReturnsBooleanFalse() {
        
        let name = ""
        let job = ""
        let result = validatorObj.validateCreateUserInput(name: name, job: job)
        
        XCTAssertFalse(result)
        XCTAssertNotNil(result)
    }
    
    func testCreateUserInputValidationWithValidNameAndJobReturnsBooleanTrue(){
        let name = "John"
        let job = "Developer"
        let result = validatorObj.validateCreateUserInput(name: name, job: job)
        
        XCTAssertTrue(result)
        XCTAssertNotNil(result)
    }
    
    
    func createUserRequestBodyBuilder(name: String, job: String) -> URLRequest{
        var urlRequest = URLRequest(url: URL(string: Endpoint.createUser)!)
        urlRequest.httpMethod = "post"
        
        let dataDictionary = [
            "name": name,
            "job": job
        ]
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch{
            print("Error: \(error)")
        }
        return urlRequest
    }
    
    func testCreateUserApiCallThrowsNoError(){
        let name = "John"
        let job = "Developer"
        let urlRequest = createUserRequestBodyBuilder(name: name, job: job)
        let result: () = urlSessionObj.createUserApiCall(urlRequest: urlRequest, name: name, job: job)
        
        XCTAssertNoThrow("Failed to decode data!")
        XCTAssertNotNil(result)
    }

}
