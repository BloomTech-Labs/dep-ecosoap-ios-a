//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

func newError(message string: String) -> NSError {
    return NSError(domain: string, code: 0, userInfo: nil)
}

class BackendController {
    
    enum Errors: Error {
        case ObjectInitFail
        case RequestInitFail
        case NoDataInResponse
    }
    
    // MARK: - Properties
    private let apiURL: URL = URL(string: "http://35.208.9.187:9294/ios-api-1")!
    
    var loggedInUser: User = User()
    
    static let shared: BackendController = BackendController()
    
    private init() {
    }
    
    var users: [String: User] = [:]
    var properties: [String: Property] = [:]
    var pickups: [String: Pickup] = [:]
    var hubs: [String: Hub] = [:]
    var payments: [String: Payment] = [:]
    var pickupCartons: [String: PickupCarton] = [:]
    var hospitalityContracts: [String: HospitalityContract] = [:]
    var productionReports: [String: HubDailyProduction] = [:]
    var impactStats: [String: ImpactStats] = [:]
    var corporateSponsors: [String: CorporateSponsor] = [:]
    var distributionPartners: [String: DistributionPartner] = [:]
    var distributions: [String: Distribution] = [:]
    var teamMembers: [String: TeamMember] = [:]

    private var parsers: [ResponseModel: (Any?) throws ->()] = [.property: BackendController.propertyParser,
                                                                .properties: BackendController.propertiesParser,
                                                                .impactStats: BackendController.impactStatsParser,
                                                                .user: BackendController.userParser,
                                                                .users: BackendController.usersParser,
                                                                .pickup:  BackendController.pickupParser,
                                                                .pickups: BackendController.pickupsParser,
                                                                .hub: BackendController.hubParser,
                                                                .hubs: BackendController.hubsParser,
                                                                .payment: BackendController.paymentParser,
                                                                .payments: BackendController.paymentsParser,
                                                                .productionReports: BackendController.productionReportsParser,
                                                                .productionReport: BackendController.productionReportParser(data:),
                                                                .corporateSponsors: BackendController.corporateSponsorParser(data:),
                                                                .distributionPartners: BackendController.distributionPartnerParser(data:),
                                                                .distributions: BackendController.distributionsParser(data:)
                                                                
    ]
    
    // MARK: Property Parsers
    private static func propertyParser(data: Any?) throws {
        guard let propertyContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't cast data as PROPERTY dictionary for initialization")
        }
        
        guard let property = Property(dictionary: propertyContainer) else {
            throw Errors.ObjectInitFail
        }
        shared.properties[property.id] = property
    }
    
    private static func propertiesParser(data: Any?) throws {
        guard let propertiesContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't PROPERTIES cast data as dictionary for initialization")
        }
        
        for prop in propertiesContainer {
            try? propertyParser(data:prop)
        }
    }
    
    // MARK: - Impact Stat Parsers
    private static func impactStatsParser(data: Any?) throws {
        guard let impactStatsContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't cast Impact Stats data as dictionary for initialization.")
        }
        guard let impactStats = ImpactStats(dictionary: impactStatsContainer) else {
            throw Errors.ObjectInitFail
        }
        shared.loggedInUser.hub?.impact = impactStats
    }
    
    //MARK: - User Parsers
    private static func userParser(data: Any?) throws {
        guard let userContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't USER cast data as dictionary for initialization")
        }
        
        guard let user = User(dictionary: userContainer) else {
            throw Errors.ObjectInitFail
        }
        shared.users[user.id] = user
    }
    
    private static func usersParser(data: Any?) throws {
        guard let usersContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for USERS initialization")
        }
        
        for user in usersContainer {
            try userParser(data: user)
        }
    }
    
    // MARK: - Pickup Parsers
    private static func pickupParser(data: Any?) throws {
        guard let pickupContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't PICKUP cast data as dictionary for initialization")
        }
        
        guard let pickup = Pickup(dictionary: pickupContainer) else {
            throw Errors.ObjectInitFail
        }
        
        if let cartonContainer = pickupContainer["cartons"] as? [[String: Any]] {
            try cartonParser(data: cartonContainer)
        }
        shared.pickups[pickup.id] = pickup
    }
    
    private static func pickupsParser(data: Any?) throws {
        guard let pickupsContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for PICKUPS container.")
        }
        
        for pickup in pickupsContainer {
            try pickupParser(data: pickup)
        }
    }
    
    //MARK: - Hub Parsers
    private static func hubParser(data: Any?) throws {
        guard let hubContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't cast data as dictionary for HUB initialization.")
        }
        
        
        guard let hub = Hub(dictionary: hubContainer) else {
            throw Errors.ObjectInitFail
        }
        shared.hubs[hub.id] = hub
    }
    
    private static func hubsParser(data: Any?) throws {
        guard let hubsContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for HUBS initialization")
        }
        
        for hub in hubsContainer {
            try hubParser(data: hub)
        }
    }
    
    // MARK: - Production Report Parsers
    private static func productionReportParser(data: Any?) throws {
        guard let productionReportContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't cast data as dictionary for PRODUCTION REPORT initialization.")
        }
        
        guard let productionReport = HubDailyProduction(dictionary: productionReportContainer) else {
            throw Errors.ObjectInitFail
        }
        
        shared.productionReports[productionReport.id] = productionReport
    }
    
    private static func productionReportsParser(data: Any?) throws {
        guard let productionReportsContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for PRODUCTION REPORTS container.")
        }
        
        for productionReport in productionReportsContainer {
            try productionReportParser(data: productionReport)
        }
    }
    
    //MARK: - Payment Parsers
    private static func paymentParser(data: Any?) throws {
        guard let paymentContainer = data as? [String: Any] else {
            throw newError(message: "Couldn't cast data as dictionary for PAYMENT initialization.")
        }
        
        guard let payment = Payment(dictionary: paymentContainer) else {
            throw Errors.ObjectInitFail
        }
        shared.payments[payment.id] = payment
    }
    
    private static func paymentsParser(data: Any?) throws {
        guard let paymentsContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for PAYMENTS container.")
        }
        
        for payment in paymentsContainer {
            try paymentParser(data: payment)
        }
    }
    
    // MARK: - Carton Parser
    private static func cartonParser(data: Any?) throws {
        guard let cartonsContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for Cartons container.")
        }
        
        for cartonDict in cartonsContainer {
            if let carton = PickupCarton(dictionary: cartonDict) {
                shared.pickupCartons[carton.id] = carton
            }
        }
    }
    
    // MARK: - Corporate Sponsor Parser
    private static func corporateSponsorParser(data: Any?) throws {
        guard let sponsorContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for instantiating corporate sponsors.")
        }
        
        for sponsorDict in sponsorContainer {
            if let sponsor = CorporateSponsor(dictionary: sponsorDict) {
                shared.corporateSponsors[sponsor.id] = sponsor
            }
        }
    }
    
    // MARK: - Distribution Parsers
    
    private static func distributionPartnerParser(data: Any?) throws {
        guard let partnerContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for instantiating distribution partners.")
        }
        
        for partnerDict in partnerContainer {
            if let partner = DistributionPartner(dictionary: partnerDict) {
                shared.distributionPartners[partner.id] = partner
            }
        }
    }
    
    private static func distributionsParser(data: Any?) throws {
        guard let distributions = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for instantiating distributions.")
        }
        
        for distributionDict in distributions {
            if let distribution = Distribution(dictionary: distributionDict) {
                shared.distributions[distribution.id] = distribution
            }
        }
    }
    
    // MARK: - Team Members Parser
    private static func teamMemberParser(data: Any?) throws {
        guard let teamMemberContainer = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for instantiating distribution partners.")
        }
        
        for memberDict in teamMemberContainer {
            if let member = TeamMember(dictionary: memberDict) {
                shared.teamMembers[member.id] = member
            }
        }
    }
    
    private static func teamMembersParser(data: Any?) throws {
        guard let members = data as? [[String: Any]] else {
            throw newError(message: "Couldn't cast data as dictionary for instantiating distributions.")
        }
        
        for memberDict in members {
            if let member = TeamMember(dictionary: memberDict) {
                shared.teamMembers[member.id] = member
            }
        }
    }


    // MARK: - Queries -
    
    
    // MARK: - Properties by User Id
    func propertiesByUserId(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .propertiesByUserId, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Team Members
    func fetchTeamMembers(completion: @escaping([TeamMember]?, Error?) -> Void) {
        guard let request = Queries(name: .teamMembers, id: "") else {
            completion(nil,Errors.RequestInitFail)
            return
        }

        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(nil,error)
                return
            }

        }
  }

    // MARK: - Properties by Property Id
    func propertyById(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .propertyById, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Single User by Id
    func userById(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .userById, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - All Users
    func allUsers(_ id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .allUsers, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    // MARK: - All Hubs
    func getAllHubs(completion: @escaping (Error?) -> Void ) {
        guard let request = Queries(name: .allHubs, id: "") else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
        print("All hubs request \(request)")
    }
    // MARK: - Hub by Property Id
    func hubByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .hubByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: Pickups by Property Id
    func pickupsByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .pickupsByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Pickups by Hub Id
    func pickupsByHubId(hubID: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .pickupsByHubId, id: hubID) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Production Reports by Hub Id
    func productionReportsByHubId(hubId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .productionReportsByHubId, id: hubId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Next Payment by Property Id
    func nextPaymentByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .nextPaymentByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: Payments by Property Id
    func paymentsByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .paymentsByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Impact Stats by Property Id
    func impactStatsByPropertyId(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .impactStatsByPropertyId, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(error)
                return
            }
            
            guard let property = self.properties[id] else {
                NSLog("This property is not currently stored into memory. Can't store impact stats.")
                completion(NSError(domain: "Error locating property.", code: 0, userInfo: nil))
                return
            }
            
            guard let container = data as? [String: Any] else {
                NSLog("Couldn't unwrap data as dictionary for initializing an ImpactStats object.")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            
            guard let stats = ImpactStats(dictionary: container) else {
                completion(NSError(domain: "Error initializing ImpactStats", code: 0, userInfo: nil))
                return
            }
            property.impact = stats
            completion(nil)
        }
    }
    
    // MARK: - Impact Stats by Hub Id
    func impactStatsByHubId(id: String, completion: @escaping (Any? ,Error?) -> Void) {
        guard let request = Queries(name: .impactStatsByHubId, id: id) else {
            completion(nil, Errors.RequestInitFail)
            return
        }
        
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
    }
    
    // MARK: - Distributions and Distributioon Partners
    
    func distributions(_ id: String = "id", completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .distributions, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(error)
                return
            }
            
            guard let container = data as? [String: Any] else {
                NSLog("Couldn't unwrap DISTRIBUTION data as dictionary in initial fetch.")
                NSLog("\(String(describing: data))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            
            do {
                try BackendController.distributionsParser(data: container)
            } catch {
                NSLog("Error: Couldn't parse DISTRIBUTION objects.\(error)")
                completion(error)
                return
            }
        }
    }
    
    func distributionPartners(_ id: String = "id", completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .distributionPartners, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(error)
                return
            }
            
            guard let container = data as? [String : Any] else {
                NSLog("Couldn't unwrap DISTRIBUTION PARTNER data as dictionary in initial fetch.")
                NSLog("\(String(describing: data))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            
            do {
                try BackendController.distributionPartnerParser(data: container)
            } catch {
                NSLog("Error: Couldn't parse DISTRIBUTION PARTNER objects.\(error)")
                completion(error)
                return
            }
        }
    }
    
    // MARK: - Initial Fetch
    func initialFetch(userId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .monsterFetch, id: userId) else {
            completion(Errors.RequestInitFail)
            return
        }
        
        requestAPI(with: request) { (data, error) in
            if let error = error {
                completion(error)
                return
            }
            
            // Cast the data as a dictionary.
            guard let container = data as? [String: Any] else {
                NSLog("Couldn't unwrap USER data as dictionary in initial fetch.")
                NSLog("\(String(describing: data))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            
            // Start by initializing the user.
            guard let user = User(dictionary: container) else {
                NSLog("Failed to initialize new user in initial fetch.")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            self.users[user.id] = user
            
            // Unwrap array of Properties if present
            guard let properties = container["properties"] as? [[String: Any]] else {
                NSLog("Failed to unwrap properties array from user payload.")
                NSLog("\tProperties: \(String(describing: container["properties"]))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            
            // Initialize every property and add it to the dictionary
            for propertyContainer in properties {
                // Initializer handles error logs if failed to initialize.
                if let property = Property(dictionary: propertyContainer) {
                    self.properties[property.id] = property
                    
                    // For every properly initialized property.
                    // If they contain a valid Hub, add it to the dictionary.
                    if let hub = property.hub {
                        self.hubs[hub.id] = hub
                    }
                    
                    // Handle pickups.
                    if let pickups = propertyContainer["pickups"] as? [[String: Any]] {
                        for pickupContainer in pickups {
                            // Initializer handles error logs if failed to initialize.
                            if let pickup = Pickup(dictionary: pickupContainer) {
                                self.pickups[pickup.id] = pickup
                                
                                // Handle Cartons
                                if let cartons = pickupContainer["cartons"] as? [[String: Any]] {
                                    for cartonContainer in cartons {
                                        // Initializer handles error logs if failed to initialize.
                                        if let carton = PickupCarton(dictionary: cartonContainer) {
                                            self.pickupCartons[carton.id] = carton
                                        }
                                    }
                                } else {
                                    NSLog("Couldn't cast array of dictionary for pickup cartons data for pickup with ID: \(pickup.id)")
                                }
                            }
                        }
                    } else {
                        NSLog("Couldn't cast array of dictionary for pickup data for property with ID: \(property.id)")
                    }
                    
                    // Handle contract.
                    if let contractContainer = propertyContainer["contract"] as? [String: Any] {
                        // Initializer handles error logs if failed to initialize.
                        if let contract = HospitalityContract(dictionary: contractContainer) {
                            self.hospitalityContracts[contract.id] = contract
                            
                            // Handle payments.
                            if let payments = contractContainer["payments"] as? [[String: Any]] {
                                for paymentContainer in payments {
                                    // Initializer handles error logs if failed to initialize.
                                    if let payment = Payment(dictionary: paymentContainer) {
                                        self.payments[payment.id] = payment
                                    }
                                }
                            } else {
                                NSLog("Couldn't cast payments dictionary array for contract with ID: \(contract.id)")
                            }
                        }
                    } else {
                        NSLog("Couldn't cast contract dictionary for property with ID: \(property.id)")
                    }
                }
            }
            
            completion(nil)
        }
    }
    
    // MARK: - Mutations -
    
    // MARK: - Create Production Report
    func createProductionReport(input: CreateProductionReportInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .createProductionReport, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    // MARK: - Update Production Report
    func updateProductionReport(input: UpdateProductionReportInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .updateProductionReport, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Schedule Pickup
    func schedulePickup(input: PickupInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .schedulePickup, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    func updatePickup(input: PickupInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .updatePickup, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    // MARK: - Cancel Pickup
    func cancelPickup(input: CancelPickupInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .cancelPickup, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    // MARK: - Create Payment
    func createPayment(input: CreatePaymentInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .createPayment, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    // MARK: - Update User Profile
    func updateUserProfile(input: UpdateUserProfileInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .shortUpdateUserProfile, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    
    // MARK: - Update Property
    func updateProperty(input: UpdatePropertyInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .updateProperty, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    func updateDistribution(input: UpdateDistributionInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .updateDistribution, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { _, error in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    // MARK: - Request API -
    private func requestAPI(with request: Request, completion: @escaping (Any?, Error?) -> Void) {
        var urlRequest = URLRequest(url: apiURL)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: ["query": request.body], options: [])
        
        print("Request body")
        print(String(data: urlRequest.httpBody!, encoding: .utf8)!)
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let _ = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, Errors.NoDataInResponse)
                return
            }
            
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                guard let dataContainer = dict?["data"]  as? [String: Any] else {
                    NSLog("No data in request response.")
                    completion(nil, Errors.NoDataInResponse)
                    return
                }
                
                var queryContainer: [String: Any]?
                
                
                let payloadString = request.payload.rawValue
                
                if request.name == "monsterFetch" {
                    guard let queryContainer = dataContainer["userById"] as? [String: Any] else {
                        completion(nil, NSError(domain: "Query container is nil.", code: 0, userInfo: nil))
                        return
                    }
                    completion(queryContainer[payloadString], nil)
                    return
                } else if request.name == "users" {
                    guard let usersQueryContainer = dataContainer["users"] as? [[String: Any]] else {
                        completion(nil, NSError(domain: "Query container is nil.", code: 0, userInfo: nil))
                        return
                    }
                    queryContainer = [payloadString: usersQueryContainer]
                    
                    completion(usersQueryContainer, nil)
                    
                } else if request.name == "allHubs" {
                    guard let hubsQueryContainer = dataContainer["hubs"] as? [[String: Any]] else {
                        completion(nil, NSError(domain: "Hubs container is nil.", code: 0, userInfo: nil))
                        return
                    }
                    queryContainer = [payloadString: hubsQueryContainer]
                    
                    completion(hubsQueryContainer, nil)
                }
                else {
                    queryContainer = dataContainer[request.name] as? [String: Any]
                }
                
                guard let parser = self.parsers[request.payload] else {
                    print("The payload \(payloadString) doesn't possess a parser.")
                    completion(queryContainer?[payloadString], nil)
                    return
                }
                
                try parser(queryContainer?[payloadString])
                
                completion(nil, nil)
                
            } catch let error {
                completion(nil, error)
            }
        }.resume()
    }
}
