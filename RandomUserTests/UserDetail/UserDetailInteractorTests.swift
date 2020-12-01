//
//  UserDetailInteractorTests.swift
//  RandomUserTests
//
//  Created by Andrianto Saputra Gunawan on 12/1/20.
//

import XCTest
@testable import RandomUser

class UserDetailInteractorTests: XCTestCase {
    var interactor: UserDetailInteractor?
    var mockPresenter: MockUserDetailPresenter?

    override func setUpWithError() throws {
        mockPresenter = MockUserDetailPresenter()
        
        interactor = UserDetailInteractor(user: MockUserDetailData.user)
        interactor?.presenter = mockPresenter
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        interactor = nil
    }

    func testFetchData() throws {
        interactor?.fetchData()
        
        XCTAssertTrue(mockPresenter!.isOnDataFetchedCalled)
        XCTAssertEqual(mockPresenter!.user!.email, MockUserDetailData.user.email)
    }
}

class MockUserDetailPresenter: UserDetailPresenterInteractorInterface {
    var isOnDataFetchedCalled: Bool = false
    var user: User?
    
    func onDataFetched(user: User) {
        isOnDataFetchedCalled = true
        self.user = user
    }
}

enum MockUserDetailData {
    static var user: User = User(name: User.Name(title: "Mr.", first: "Foo", last: "Bar"), email: "foo@bar.com", phone: "081081081081", picture: User.Picture(large: URL(string: "urlLarge")!, medium: URL(string: "urlMedium")!, thumbnail: URL(string: "urlThumbnail")!))
}
