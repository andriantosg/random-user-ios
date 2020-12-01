//
//  UserListInteractorTests.swift
//  RandomUserTests
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import XCTest
@testable import RandomUser

class UserListInteractorTests: XCTestCase {
    var interactor: UserListInteractor?
    var mockPresenter: MockUserListPresenter?
    
    var mockUserApiDataManager: MockUserApiDataManager = MockUserApiDataManager()
    var mockUserLocalDataManager: MockUserLocalDataManager = MockUserLocalDataManager()
    
    override func setUpWithError() throws {
        mockPresenter = MockUserListPresenter()
        
        interactor = UserListInteractor(userApiDataManager: mockUserApiDataManager, userLocalDataManager: mockUserLocalDataManager)
        interactor?.presenter = mockPresenter
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        interactor = nil
    }

    func testFetchDataFromNetworkOnSuccess() throws {
        mockUserApiDataManager.isSuccess = true
        
        interactor?.fetchData()
        
        XCTAssertTrue(mockPresenter!.isOnDataFetchedCalled)
    }
    
    func testFetchDataFromNetworkOnFailure() throws {
        mockUserApiDataManager.isSuccess = false
        
        interactor?.fetchData()
        
        XCTAssertTrue(mockPresenter!.isOnDataFetchedErrorCalled)
    }
    
    func testFetchDataFromLocalOnSuccess() throws {
        mockUserLocalDataManager.isSuccess = true
        
        interactor?.fetchDataFromLocal()
        
        XCTAssertTrue(mockPresenter!.isOnDataFetchedCalled)
    }
    
    func testFetchDataFromLocalOnFailure() throws {
        mockUserLocalDataManager.isSuccess = false
        
        interactor?.fetchDataFromLocal()
        
        XCTAssertEqual(mockUserLocalDataManager.error.localizedDescription, MockError.dataNotFound.localizedDescription)
    }
    
    func testSaveDataToLocal() throws {
        let users = MockUserListData.users
        
        interactor?.saveDataToLocal(users: users)
        
        XCTAssertTrue(mockUserLocalDataManager.isDataSaved)
    }
}

class MockUserListPresenter: UserListPresenterInteractorInterface {
    var isOnDataFetchedCalled: Bool = false
    var isOnDataFetchedErrorCalled: Bool = false
    
    func onDataFetched(users: [User]) {
        isOnDataFetchedCalled = true
    }
    
    func onDataFetchedError(error: Error) {
        isOnDataFetchedErrorCalled = true
    }
}

class MockUserApiDataManager: UserApiDataManagerProtocol {
    var isSuccess: Bool = false
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if isSuccess {
            completion(.success(MockUserListData.users))
        }
        else {
            completion(.failure(MockError.noInternetAccess))
        }
    }
}

class MockUserLocalDataManager: UserLocalDataManagerProtocol {
    var isSuccess: Bool = false
    
    var isDataSaved: Bool = false
    var error: MockError = MockError.unknown
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if isSuccess {
            completion(.success(MockUserListData.users))
        }
        else {
            error = MockError.dataNotFound
        }
    }
    
    func saveUsers(users: [User]) {
        isDataSaved = true
    }
}

enum MockUserListData {
    static var users: [User] = [
        User(name: User.Name(title: "Mr.", first: "Foo", last: "Bar"), email: "foo@bar.com", phone: "081081081081", picture: User.Picture(large: URL(string: "urlLarge")!, medium: URL(string: "urlMedium")!, thumbnail: URL(string: "urlThumbnail")!))
    ]
}

enum MockError: String, LocalizedError {
    case noInternetAccess = "No internet connection"
    case dataNotFound = "Data not found"
    case unknown = "Unknown"
    
    var errorDescription: String? {
        rawValue
    }
}
