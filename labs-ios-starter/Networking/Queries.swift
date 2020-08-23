//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {

    static let shared = Queries()

    let collection:[String: (String)->String]
    let payloads = [Key.userById.rawValue:"user",
                    Key.propertyById.rawValue:"property",
                    Key.propertiesByUserId.rawValue:"properties",
                    Key.impactStatsByPropertyId.rawValue:"impactStats",
                    Key.monsterFetch.rawValue:"user"]


    init() {
        self.collection = [Key.userById.rawValue:userById,
                           Key.propertyById.rawValue:propertyById,
                           Key.propertiesByUserId.rawValue:propertiesByUserId,
                           Key.impactStatsByPropertyId.rawValue:impactStatsByPropertyId,
                           Key.monsterFetch.rawValue:monsterFetch]
    }

    enum Key: String {
        case userById
        case propertiesByUserId
        case propertyById
        case impactStatsByPropertyId
        case monsterFetch
    }

    private let propertiesByUserId:(String) -> String = {
        return """
        {
        propertiesByUserId(input: { userId: "\($0)" }) {
            properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes,
                users {
                    id
                }
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
        }
        """
    }

    private let userById:(String) -> String = {
        return """
        {
        userById(input: { userId:  \"\($0)\" }) {
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

    private let propertyById:(String) -> String = {
        return """
        {
        propertyById(input: {
        propertyId: "\($0)"
        }) {
        property {
          id,
          name,
          rooms,
          phone,
          billingAddress,
          shippingAddress,
          coordinates,
          shippingNote,
          notes,
          users {
            id
          }
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
        }
        """
    }

    private let impactStatsByPropertyId:(String) -> String = {
        return """
        query {
        impactStatsByPropertyId(input: {
        propertyId: "\($0)"
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

    private let hubByPropertyId:(String) -> String = {
        """
        query {
          hubByPropertyId(input: {
            propertyId: "\($0)"
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

    private let pickupsByPropertyId:(String) -> String = {
        """
        query {
          pickupsByPropertyId(input: {
            propertyId: "\($0)"
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

    private let nextPaymentByPropertyId:(String) -> String = {
        """
        query {
          nextPaymentByPropertyId(input: {
            propertyId: "\($0)"
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

    private let paymentsByPropertyId:(String) -> String = {
        """
        query {
          paymentsByPropertyId(input: {
            propertyId: "\($0)"
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

    private let monsterFetch:(String) -> String = {
        return """
        query {
          userById(input: {
            userId: "\($0)"
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
