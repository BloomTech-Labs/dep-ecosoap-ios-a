//
//  ProfileController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class ProfileController {

    // MARK: - Singleton
    static let shared = ProfileController()

    // MARK: - Properties
    let oktaAuth = OktaAuth(baseURL: URL(string: "https://dev-668428.okta.com/")!,
                            clientID: "0oapaqacafrGUTfKx4x6",
                            redirectURI: "labs://scaffolding/implicit/callback")
    
    private(set) var authenticatedUserProfile: User?
    private(set) var profiles: [User] = []
    private let controller = BackendController.shared

    
    private let baseURL = URL(string: "https://labs-api-starter.herokuapp.com/")!
    
    private init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshProfiles),
                                               name: .oktaAuthenticationSuccessful,
                                               object: nil)
    }
    
    @objc private func refreshProfiles() {
        getAllProfiles()
    }

    // MARK: - Get All Profiles
    func getAllProfiles(completion: @escaping () -> Void = {}) {
        
        var oktaCredentials: OktaCredentials
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to get profiles from API")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        controller.allUsers("") { (error) in
            if let error = error {
                print("Error fetching all users \(error)")
            }
        }

    }

    // MARK: - Get Authenticated User Profile
    func getAuthenticatedUserProfile(completion: @escaping () -> Void = { }) {
        var oktaCredentials: OktaCredentials
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to get authenticated user profile from API")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        
        guard let userID = oktaCredentials.userID else {
            NSLog("User ID is missing.")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        
        getSingleProfile(userID) { (profile) in
            self.authenticatedUserProfile = profile
            if profile != nil {
                self.controller.loggedInUser = profile! }
            DispatchQueue.main.async {
                completion()
            }
        }
    }


    // MARK: - Check for Existing Authenticated Single User Profile
    func checkForExistingAuthenticatedUserProfile(completion: @escaping (Bool) -> Void) {
        getAuthenticatedUserProfile {
            completion(self.authenticatedUserProfile != nil)
        }
    }

    // MARK: - Get Single User Profile
    func getSingleProfile(_ userID: String, completion: @escaping (User?) -> Void) {
        
        var oktaCredentials: OktaCredentials
        var fetchedProfile: User?
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to get profile from API")
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }

        controller.userById(id: userID) { (error) in
            if let error = error {
                print("Error fetching user info \(error)")
                completion(nil)
            }
            fetchedProfile = self.controller.users[userID]
            completion(fetchedProfile)
        }                                                                                       
    }

    // MARK: - Update Authenticated User Profile
    func updateAuthenticatedUserProfile(_ profile: UpdateUserProfileInput, with name: String, email: String, completion: @escaping (User?) -> Void) {
        
        var oktaCredentials: OktaCredentials
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to get authenticated user profile from API")
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }

        controller.updateUserProfile(input: profile) { (error) in
            if let error = error {
                NSLog("There was an error updating the user profile \(error)")
                completion(nil)
            }
        }

    }
    
    // MARK: - Create User Profile
    // NOTE: This method is unused, but left as an example for creating a profile.
    func createProfile(with email: String, name: String, avatarURL: URL) -> Profile? {
        var oktaCredentials: OktaCredentials
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to create a profile for the authenticated user")
            return nil
        }
        
        guard let userID = oktaCredentials.userID else {
            NSLog("Credentials do not exist. Unable to create profile")
            return nil
        }
        return Profile(id: userID, email: email, name: name, avatarURL: avatarURL)
    }

    // MARK: - Add User Profile
    // NOTE: This method is unused, but left as an example for creating a profile on the scaffolding backend.
    func addProfile(_ profile: Profile, completion: @escaping () -> Void) {
        var oktaCredentials: OktaCredentials
        
        do {
            oktaCredentials = try oktaAuth.credentialsIfAvailable()
        } catch {
            postAuthenticationExpiredNotification()
            NSLog("Credentials do not exist. Unable to add profile to API")
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }
            return
        }

        // TODO: Need to finish implementation of create user profile (aka register) functionality in Mutator and NetworkingController.

    }

    // MARK: - Get Image
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            var fetchedImage: UIImage? = nil
            
            defer {
                DispatchQueue.main.async {
                    completion(fetchedImage)
                }
            }
            if let error = error {
                NSLog("Error fetching image for url: \(url.absoluteString), error: \(error)")
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    return
            }
            fetchedImage = image
        }
        dataTask.resume()
    }

    // MARK: - Post Authentication Expired Notification
    func postAuthenticationExpiredNotification() {
        NotificationCenter.default.post(name: .oktaAuthenticationExpired, object: nil)
    }
}
