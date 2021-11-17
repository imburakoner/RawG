//
//  Service.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Service {

    let session: URLSessionProtocol

    func makeRequest<Request: URLRequestConvertable>(request: Request,
                                                     completion: @escaping ServiceResultCompletion<Request.ResponseModel>) {

        session.dataTask(with: request) { data, response, error in
            let serviceResult: ServiceResult<Request.ResponseModel>
            if let error = error {
                serviceResult = .failure(ServiceError(withError: error))
            } else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let response = try decoder.decode(Request.ResponseModel.self, from: data)
                    serviceResult = .success(response)
                } catch {
                    serviceResult = .failure(.unknown)
                }
            } else {
                serviceResult = .failure(.unknown)
            }
            DispatchQueue.main.async {
                completion(serviceResult)
            }
        }.resume()
    }
}
