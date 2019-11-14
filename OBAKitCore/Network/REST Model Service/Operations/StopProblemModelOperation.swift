//
//  StopProblemModelOperation.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 11/5/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import Foundation

/// Wraps the server response for submitting a trip problem report to the
/// `/api/where/report-problem-with-stop/{stopID}.json` endpoint.
public class StopProblemModelOperation: RESTModelOperation {
    public private(set) var success: Bool?

    override public func main() {
        super.main()

        guard
            let apiOperation = apiOperation,
            let response = apiOperation.response,
            !hasError
        else {
            return
        }

        let statusCode = response.statusCode

        success = (statusCode == 200)
    }
}
