//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.

import Foundation

class Queries: Request {

    // MARK: - Properties
    var body: String

    var payload: ResponseModel

    var name: String

    private static let collection = [QueryName.userById: Queries.userById,
                                     .allUsers: Queries.allUsers,
                                     .propertyById: Queries.propertyById,
                                     .propertiesByUserId: Queries.propertiesByUserId,
                                     .impactStatsByPropertyId: Queries.impactStatsByPropertyId,
                                     .impactStatsByHubId: Queries.impactStatsByHubId,
                                     .hubByPropertyId: Queries.hubByPropertyId,
                                     .pickupsByPropertyId: Queries.pickupsByPropertyId,
                                     .nextPaymentByPropertyId: Queries.nextPaymentByPropertyId,
                                     .paymentsByPropertyId: Queries.paymentsByPropertyId,
                                     .monsterFetch: Queries.monsterFetch,
                                     .productionReportsByHubId: Queries.productionReportsByHubId]

    private static let payloads: [QueryName: ResponseModel] = [.userById: .user,
                                                               .allUsers: .user,
                                                               .propertyById: .property,
                                                               .propertiesByUserId: .properties,
                                                               .impactStatsByPropertyId: .impactStats,
                                                               .hubByPropertyId: .hub,
                                                               .pickupsByPropertyId: .pickups,
                                                               .nextPaymentByPropertyId: .payment,
                                                               .paymentsByPropertyId: .payments,
                                                               .monsterFetch: .user,
                                                               .productionReportsByHubId: .properties]

    init?(name: QueryName, id: String) {
        guard let body = Queries.collection[name] else {
            NSLog("Couldn't find this query in the collection. Check your implementation.")
            return nil
        }

        guard let payload = Queries.payloads[name] else {
            NSLog("Couldn't find a matching payload name. Check your implementation.")
            return nil
        }

        self.body = body(id)
        self.payload = payload
        self.name = name.rawValue
    }

    // MARK: - Properties by UserId
    private static func propertiesByUserId(propertyID: String) -> String {
        return """
        {
            propertiesByUserId(input: { userId: "\(propertyID)" }) {
                properties {
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

    // MARK: - Single User by Id
    private static func userById(userID: String) -> String {
        return """
        query {
        userById(input: { userId:  \"\(userID)\" }) {
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
        signupTime
        properties {
            id
        }
        }
        }
        }
        """
    }

    // MARK: - All Users

    // FIXME: - This function breaks the initializer when property configured to pass NO userID.  Need to determine why.
    
    private static func allUsers(userID: String) -> String {
         return """
        query {
          users {
            id
            firstName
            middleName
            lastName
            title
            company
            email
            phone
            skype
            address {
              address1
              address2
              city
              state
              postalCode
              country
            }
            signupTime
            role
          }
        }
        """
    }

    // MARK: - Property by Property Id
    private static func propertyById(propertyID: String) -> String {
        return """
        {
        propertyById(input: {
        propertyId: "\(propertyID)"
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

    // MARK: - Impact Stats by Property Id
    private static func impactStatsByPropertyId(propertyID: String) -> String {
        return """
        query {
        impactStatsByPropertyId(input: {
        propertyId: "\(propertyID)"
        }) {
        impactStats {
        soapRecycled
        linensRecycled
        bottlesRecycled
        paperRecycled
        peopleServed
        womenEmployed
        }
        }
        }
        """
    }

    // MARK: - Hub by Property Id
    private static func hubByPropertyId(propertyID: String) -> String {
        """
        query {
          hubByPropertyId(input: {
            propertyId: "\(propertyID)"
          }) {
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
          }
        }

        """
    }

    // MARK: - Production Report by Hub Id
    private static func productionReportsByHubId(hubID: String) -> String {
        """
        query {
          productionReportsByHubId(input: {hubId: "\(hubID)"}) {
            productionReports {
              id
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

    // MARK: - Impact Stats by HubId
    private static func impactStatsByHubId(hubID: String) -> String {
        """
        query {
          impactStatsByHubId(input: {
            hubId: "\(hubID)" {
            impactStats {
              soapRecycled
              linensRecycled
              bottlesRecycled
              paperRecycled
              peopleServed
              womenEmployed
            }
          }
        }

        """
}


    // MARK: - Pickups by Property Id
    private static func pickupsByPropertyId(propertyID: String) -> String {
        """
        query {
          pickupsByPropertyId(input: {
            propertyId: "\(propertyID)"
          })  {
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
          }
        }

        """
    }

    // MARK: - Next Payment by Property Id

    private static func nextPaymentByPropertyId(propertyID: String) -> String {
        """
        query {
          nextPaymentByPropertyId(input: {
            propertyId: "\(propertyID)"
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

    // MARK: - Payments by Property Id

    private static func paymentsByPropertyId(propertyID: String) -> String {
        """
        query {
          paymentsByPropertyId(input: {
            propertyId: "\(propertyID)"
          }) {
          payments {
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

    // MARK: - Monster Fetch

    private static func monsterFetch(userID: String) -> String {
        return """
        query {
          userById(input: {
            userId: "\(userID)"
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
                  amountPaid
                }
              }
            }
          }
        }
        """
    }

}
