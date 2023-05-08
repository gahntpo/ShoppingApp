//
//  APIService.swift
//  Music Search
//
//  Created by Karin Prater on 24.07.22.
//

import Foundation

class APIService {
    
    private var dataTask: URLSessionDataTask?
    
    func fetchProducts(completion: @escaping(Result<[Product],APIError>) -> Void) {
        let url = URL(string: "https://fakestoreapi.com/products")
        fetch([Product].self, url: url) { result in
            completion(result)
        }
    }
    
    func fetchProducts(for category: String, completion: @escaping(Result<[Product],APIError>) -> Void) {
        let url = URL(string: "https://fakestoreapi.com/products/category/" + category)
        print("fetch for: \(category): \(url)")
        fetch([Product].self, url: url) { result in
            completion(result)
        }
    }
    
    func fetchCaategories(completion: @escaping(Result<[String],APIError>) -> Void) {
        let url = URL(string: "https://fakestoreapi.com/products/categories")
        fetch([String].self, url: url) { result in
            completion(result)
        }
    }

   private func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
       print("fetch - \(url.absoluteString)")
        dataTask?.cancel()
        
        dataTask = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch {
                    print("load error: \(error.localizedDescription)")
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }

            }
        }

        dataTask?.resume()
    }
}
