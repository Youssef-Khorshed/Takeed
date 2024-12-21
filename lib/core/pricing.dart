// https://takeed.runasp.net/api/v1/air/search_and_shopping/post-flight-offers-pricing

/*
  [
   {
                "type": "flight-offer",
                "id": "1",
                "source": "GDS",
                "instantTicketingRequired": false,
                "nonHomogeneous": false,
                "oneWay": false,
                "lastTicketingDate": "2024-12-14",
                "lastTicketingDateTime": "2024-12-14",
                "numberOfBookableSeats": 9,
                "itineraries": [
                    {
                        "duration": "PT6H50M",
                        "segments": [
                            {
                                "id": "6",
                                "numberOfStops": 0,
                                "blacklistedInEU": false,
                                "carrierCode": "SV",
                                "number": "386",
                                "duration": "PT2H15M",
                                "departure": {
                                    "iataCode": "CAI",
                                    "terminal": "2",
                                    "at": "2024-12-13T23:55:00"
                                },
                                "arrival": {
                                    "iataCode": "JED",
                                    "terminal": "1",
                                    "at": "2024-12-14T03:10:00"
                                },
                                "aircraft": {
                                    "code": "330"
                                },
                                "operating": {
                                    "carrierCode": "SV"
                                }
                            },
                            {
                                "id": "7",
                                "numberOfStops": 0,
                                "blacklistedInEU": false,
                                "carrierCode": "SV",
                                "number": "1018",
                                "duration": "PT1H45M",
                                "departure": {
                                    "iataCode": "JED",
                                    "terminal": "1",
                                    "at": "2024-12-14T06:00:00"
                                },
                                "arrival": {
                                    "iataCode": "RUH",
                                    "terminal": "5",
                                    "at": "2024-12-14T07:45:00"
                                },
                                "aircraft": {
                                    "code": "320"
                                },
                                "operating": {
                                    "carrierCode": "SV"
                                }
                            }
                        ]
                    },
                    {
                        "duration": "PT5H50M",
                        "segments": [
                            {
                                "id": "48",
                                "numberOfStops": 0,
                                "blacklistedInEU": false,
                                "carrierCode": "SV",
                                "number": "1039",
                                "duration": "PT1H55M",
                                "departure": {
                                    "iataCode": "RUH",
                                    "terminal": "5",
                                    "at": "2024-12-31T16:00:00"
                                },
                                "arrival": {
                                    "iataCode": "JED",
                                    "terminal": "1",
                                    "at": "2024-12-31T17:55:00"
                                },
                                "aircraft": {
                                    "code": "320"
                                },
                                "operating": {
                                    "carrierCode": "SV"
                                }
                            },
                            {
                                "id": "49",
                                "numberOfStops": 0,
                                "blacklistedInEU": false,
                                "carrierCode": "SV",
                                "number": "389",
                                "duration": "PT2H25M",
                                "departure": {
                                    "iataCode": "JED",
                                    "terminal": "1",
                                    "at": "2024-12-31T19:25:00"
                                },
                                "arrival": {
                                    "iataCode": "CAI",
                                    "terminal": "2",
                                    "at": "2024-12-31T20:50:00"
                                },
                                "aircraft": {
                                    "code": "330"
                                },
                                "operating": {
                                    "carrierCode": "SV"
                                }
                            }
                        ]
                    }
                ],
                "price": {
                    "grandTotal": "581.50",
                    "additionalServices": [
                        {
                            "type": "CHECKED_BAGS",
                            "amount": 662.00
                        }
                    ],
                    "currency": "SAR",
                    "total": "581.50",
                    "base": "76.00",
                    "tayarrTaxes": "0",
                    "tayarrFees": "0",
                    "fees": [
                        {
                            "amount": "0.00",
                            "type": "SUPPLIER"
                        },
                        {
                            "amount": "0.00",
                            "type": "TICKETING"
                        }
                    ]
                },
                "pricingOptions": {
                    "includedCheckedBagsOnly": true,
                    "fareType": [
                        "PUBLISHED"
                    ],
                    "refundableFare": false,
                    "noRestrictionFare": false,
                    "noPenaltyFare": false
                },
                "validatingAirlineCodes": [
                    "SV"
                ],
                "travelerPricings": [
                    {
                        "travelerId": "1",
                        "fareOption": "STANDARD",
                        "travelerType": "ADULT",
                        "price": {
                            "currency": "SAR",
                            "total": "581.50",
                            "base": "76.00",
                            "tayarrTaxes": "0",
                            "tayarrFees": "0"
                        },
                        "fareDetailsBySegment": [
                            {
                                "segmentId": "6",
                                "cabin": "ECONOMY",
                                "fareBasis": "VARTEGB4",
                                "brandedFare": "NBASICE",
                                "class": "V",
                                "isAllotment": false,
                                "includedCheckedBags": {
                                    "quantity": 1,
                                    "weight": 0
                                }
                            },
                            {
                                "segmentId": "7",
                                "cabin": "ECONOMY",
                                "fareBasis": "VARTEGB4",
                                "brandedFare": "NBASICE",
                                "class": "E",
                                "isAllotment": false,
                                "includedCheckedBags": {
                                    "quantity": 1,
                                    "weight": 0
                                }
                            },
                            {
                                "segmentId": "48",
                                "cabin": "ECONOMY",
                                "fareBasis": "VARTEGB4",
                                "brandedFare": "NBASICE",
                                "class": "E",
                                "isAllotment": false,
                                "includedCheckedBags": {
                                    "quantity": 1,
                                    "weight": 0
                                }
                            },
                            {
                                "segmentId": "49",
                                "cabin": "ECONOMY",
                                "fareBasis": "VARTEGB4",
                                "brandedFare": "NBASICE",
                                "class": "V",
                                "isAllotment": false,
                                "includedCheckedBags": {
                                    "quantity": 1,
                                    "weight": 0
                                }
                            }
                        ]
                    }
                ],
                "fareRules": {
                    "rules": [
                        {
                            "category": "EXCHANGE",
                            "maxPenaltyAmount": "200.00"
                        },
                        {
                            "category": "REFUND",
                            "notApplicable": true
                        },
                        {
                            "category": "REVALIDATION",
                            "maxPenaltyAmount": "200.00"
                        }
                    ]
                }
            }
]

 */
