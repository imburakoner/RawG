//
//  RequestType.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

enum HTTPMethod: String {
       case get = "GET"
       case put = "PUT"
       case post = "POST"
       case delete = "DELETE"
       case head = "HEAD"
       case options = "OPTIONS"
       case trace = "TRACE"
       case connect = "CONNECT"
   }
