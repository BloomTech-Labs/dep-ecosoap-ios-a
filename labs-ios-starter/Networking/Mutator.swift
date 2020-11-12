//
//  Mutator.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Mutator: Request {

    var body: String

    var payload: ResponseModel

    var name: String

    private static let collection = [MutationName.schedulePickup: Mutator.schedulePickup,
                                     .updatePickup: Mutator.updatePickup,
                                     .cancelPickup: Mutator.cancelPickup,
                                     .createProductionReport: Mutator.createProductionReport,
                                     .updateProductionReport: Mutator.updateProductionReport,
                                     .deleteProductionReport: Mutator.deleteProductionReport,
                                     .createPayment: Mutator.createPayment,
                                     .updateUserProfile: Mutator.updateUserProfile,
                                     .updateProperty: Mutator.updateProperty
    ]

    private static let payloads: [MutationName: ResponseModel] = [.schedulePickup: .pickup,
                                                                  .cancelPickup: .pickup,
                                                                  .createPayment: .payment,
                                                                  .createProductionReport: .productionReport,
                                                                  .updateProductionReport: .productionReport,
                                                                  .deleteProductionReport: .productionReport,
                                                                  .updateUserProfile: .user,
                                                                  .updateProperty: .property,
                                                                  .updateCorporateSponsor: .corporateSponsors]

    init?(name: MutationName, input: Input) {
        guard let function = Mutator.collection[name] else {
            NSLog("Couldn't find this mutation in the collection. Check your implementation.")
            return nil
        }

        guard let body = function(input) else {
            return nil
        }

        guard let payload = Mutator.payloads[name] else {
            NSLog("Couldn't find a matching payload name. Check your implementation.")
            return nil
        }
        self.body = body
        self.payload = payload
        self.name = name.rawValue
    }


    // MARK: - Create Production Report
    private static func createProductionReport(input: Input) -> String? {
        guard let productionReport = input as? CreateProductionReportInput else {
            NSLog("Couldn't cast input to CreateProductReportInput. Please make sure your input matches the mutation's required input.")
            return nil
        }

        return """
        mutation {
        createProductionReport(input: {\(productionReport.formatted)}) {
            productionReport {
              id
              hub {
                id
              }
              date
              barsProduced
              soapmakersWorked
              soapmakerHours
              soapPhotos
              media
            }
          }
        }
        """
    }


    // MARK: - Update Production Report
    private static func updateProductionReport(input: Input) -> String? {
           guard let productionReport = input as? UpdateProductionReportInput else {
               NSLog("Couldn't cast input to UpdateProductReportInput. Please make sure your input matches the mutation's required input.")
               return nil
           }

           return """
           mutation {
            updateProductionReport(input: {"\(productionReport.formatted)"}) {
               productionReport {
                 id
                 hub {
                   id
                 }
                 date
                 barsProduced
                 soapmakersWorked
                 soapmakerHours
                 soapPhotos
                 media
               }
             }
           }
           """
    }


    // MARK: - Delete Production Report
    private static func deleteProductionReport(input: Input) -> String? {
              guard let productionReport = input as? DeleteProductionReportInput else {
                  NSLog("Couldn't cast input to DeleteProductReportInput. Please make sure your input matches the mutation's required input.")
                  return nil
              }
        return """
        mutation {
          deleteProductionReport(
        input: { id: "\(productionReport.formatted)" }
          ) {
            success
            error
          }
        }
        """
    }


    // MARK: - Schedule Pickup
    private static func schedulePickup(input: Input) -> String? {
        guard let pickup = input as? PickupInput else {
            NSLog("Couldn't cast input to PickupInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        return """
        mutation {
          schedulePickup(input:{
        \(pickup.formatted)
          }) {
            pickup {
              id
              confirmationCode
              collectionType
              status
              readyDate
              pickupDate
              property {
                id
              }
              cartons {
                id
                product
                percentFull
              }
              notes
            }
            label
          }
        }
        """
    }

    // MARK: - Update Pickup
    private static func updatePickup(input: Input) -> String? {
        guard let pickup = input as? PickupInput else {
            NSLog("Couldn't cast input to UpdatePickupInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        return """
        mutation {
          updatePickup(input: {
            pickupId: \(pickup)}) {
            pickup {
              id
              confirmationCode
              collectionType
              status
              readyDate
              pickupDate
              property {
                id
                name
                shippingAddress {
                  address1
                  address2
                  city
                  state
                  postalCode
                }
              }
              cartons {
                id
                product
                percentFull
              }
              label
              driver
              notes
            }
          }
        }


        """

    }

    // MARK: - Cancel Pickup
    private static func cancelPickup(input: Input) -> String? {
        guard let pickup = input as? CancelPickupInput else {
            NSLog("Couldn't cast input to CancelPickupInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        return """
        mutation {
          cancelPickup(input: {
            \(pickup.formatted)
          }) {
            pickup {
              id
              confirmationCode
              collectionType
              status
              readyDate
              pickupDate
              property {
                id
              }
              cartons {
                id
                product
                percentFull
              }
              notes
            }
          }
        }

        """
    }

    // MARK: - Create Payment
    private static func createPayment(input: Input) -> String? {
        guard let payment = input as? CreatePaymentInput else {
            NSLog("Couldn't cast input to CreatePaymentInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        return """
        mutation {
          createPayment(input: {
            \(payment.formatted)
          }) {
            payment {
              id
              invoiceCode
              invoice
              amountPaid
              amountDue
              date
              invoicePeriodStartDate
              invoicePeriodEndDate
              dueDate
              paymentMethod
              hospitalityContract {
                id
              }
            }
          }
        }
        """
    }

    // MARK: - Create User Profile
    private static func createUserProfile(input: Input) -> String? {
        guard let user = input as? RegisterInput else {
            NSLog("Couldn't cast input to RegisterInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        return """
        mutation {
        register(input: {
        \(user.formatted)
        }) {
        email
        password
        firstName
        middleName: String
        lastName
        title
        company
        phone
        skype
        }
        }
        }
        """
    }

    // MARK: - Update User Profile
    private static func updateUserProfile(input: Input) -> String? {
        guard let user = input as? UpdateUserProfileInput else {
            NSLog("Couldn't cast input to UpdateUserProfileInput. Please make sure your input matches the mutation's required input.")
            return nil
        }

        return """
        mutation {
          updateUserProfile(input: {
            \(user.formatted)
          }) {
            user {
              id
              firstName
              middleName
              lastName
              title
              company
              email
              password
              phone
              skype
              address {
                address1
                address2
                address3
                city
                state
                postalCode
                country
                # formattedAddress
              }
              signupTime
              properties {
                id
              }
            }
          }
        }

        """
    }

    // MARK: - Update Property
    private static func updateProperty(input: Input) -> String? {
        guard let property = input as? UpdatePropertyInput else {
            NSLog("Couldn't cast input to UpdateUserProfileInput. Please make sure your input matches the mutation's required input.")
            return nil
        }

        return """
        mutation {
          updateProperty(input: {
            \(property.formatted)
          }) {
            property {
                id
                name
                propertyType
                rooms
                services
                collectionType
                logo
                phone
                billingAddress {
                  address1
                  address2
                  address3
                  city
                  state
                  postalCode
                  country
                  # formattedAddress
                }
                shippingAddress {
                  address1
                  address2
                  address3
                  city
                  state
                  postalCode
                  country
                  # formattedAddress
                }
                coordinates {
                  longitude
                        latitude

                }
                shippingNote
                notes
                hub {
                  id
                  name
                  address {
                    address1
                    address2
                    address3
                    city
                    state
                    postalCode
                    country
                    # formattedAddress
                  }
                  email
                  phone
                  coordinates {
                    longitude
                            latitude
                  }
                  properties {
                    id
                  }
                  workflow
                  impact {
                    soapRecycled
                    linensRecycled
                    bottlesRecycled
                    paperRecycled
                    peopleServed
                    womenEmployed
                  }
                }
                impact {
                  soapRecycled
                  linensRecycled
                  bottlesRecycled
                  paperRecycled
                  peopleServed
                  womenEmployed
                }
                users {
                  id
                }
                pickups {
                  id
                  confirmationCode
                  collectionType
                  status
                  readyDate
                  pickupDate
                  property {
                    id
                  }
                  cartons {
                    id
                    product
                    percentFull
                  }
                  notes
                }
                contract {
                  id
                  startDate
                  endDate
                  paymentStartDate
                  paymentEndDate
                  properties {
                    id
                  }
                  paymentFrequency
                  price
                  discount
                  billingMethod
                  automatedBilling
                  payments {
                    id
                    invoice
                    invoice
                    amountPaid
                    amountDue
                    date
                    invoicePeriodStartDate
                    invoicePeriodEndDate
                    dueDate
                    paymentMethod
                    hospitalityContract {
                      id
                    }
                  }
                }
            }
          }
        }
        """
    }
    
    //MARK: Update Corporate Sponsor
    
    func updateCorporateSponsor(input: Input) -> String? {
        guard let sponsor = input as? UpdateCorporateSponsorInput else {
            NSLog("Couldn't cast input to UpdateCorporateSponsorInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
        
        return """
        mutation {
          updateCorporateSponsor(input: {
            \(sponsor.formatted)
          }) {
            corporateSponsors {
                    id,
                    hub {
                      id,
                      name,
                      email,
                      phone,
                      address {
                        address1,
                        address2,
                        address3,
                        postalCode,
                        city,
                        formattedAddress
                      },
                      coordinates {
                        latitude,
                        longitude
                      },
                      properties {
                        id
                      }
                    },
                    name,
                    type,
                    contactName,
                    contactInfo,
                    address,
                    logo,
                    website,
                    sponsorshipType,
                    cashValue,
                    soapBars,
                    soapValue
                  }

          }
        }
        """
    }
    
    //MARK: Update Distribution
    func updateDistribution(input: Input) -> String? {
        guard let distribution = input as? UpdateDistributionInput else {
            NSLog("")
            return nil
        }
        
        return """
            mutation {
              updateDistribution(input: {
                \(distribution.formatted)
              }) {
                distribution {
                  id,
                  hub,
                  date,
                  partner,
                    soapDistributed,
                  bottlesDistributed,
                  linensDistributed,
                  photos,
                  videos,
                  notes
                }
              }
            }
            """
    }
}
