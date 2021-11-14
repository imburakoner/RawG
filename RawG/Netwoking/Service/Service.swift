//
//  Service.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Service {

    let session: URLSession

    func makeRequest<Request: Requestable>(request: Request,
                                           completion: @escaping ServiceResultCompletion<Request.ResponseModel>) {
        session.dataTask(with: request.request) { (data, response, error) in
            let serviceResult: ServiceResult<Request.ResponseModel>
            if let error = error {
                serviceResult = .failure(error)
            } else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let response = try decoder.decode(Request.ResponseModel.self, from: data)
                    serviceResult = .success(response)
                } catch {
                    serviceResult = .failure(error)
                }
            } else {
                serviceResult = .failure(NSError(domain: "com.imbsoft.network", code: 999, userInfo: nil))
            }
            DispatchQueue.main.async {
                completion(serviceResult)
            }
        }.resume()
    }
}
