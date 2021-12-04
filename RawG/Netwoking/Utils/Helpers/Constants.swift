//
//  Constants.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

typealias ServiceResult<T: Decodable> = Result<T, ServiceError>
typealias ServiceCompletion<T: Decodable> = (ServiceResult<T>) -> Void
