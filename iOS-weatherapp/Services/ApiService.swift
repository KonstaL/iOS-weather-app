import Foundation;
import RxSwift;

//
//  ApiService.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 09/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//
/**
 Singleton class that handles HTTP connections as a service
 */
class ApiService {
    static fileprivate var instance: ApiService!;
    
    static func getInstance() -> ApiService {
        if let apiService = ApiService.instance {
            return apiService;
        }
        ApiService.instance = ApiService.init();
        
        return ApiService.getInstance();
    }
    
    fileprivate init() {}
    
    func getUrl(url : String) -> Observable<WeatherResponse?> {
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        let url : URL? = URL(string: url)
        let result = BehaviorSubject<WeatherResponse?>(value: nil);
        let result$ = result.asObservable();
        
        //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}
        //61.49911, 23.78712

        let task = session.dataTask(with: url!)  { (data, response, error) in
            guard data != nil && error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(WeatherResponse.self, from: data!)
                print("response");
                print(response);
                result.onNext(response);
                
            } catch let error {
                print("Failed to decode json:", error)
            }
        }
        
        // Starts the task, spawns a new thread and calls the callback function
        task.resume();
        
        return result$;
    }

    func doneFetching(data: Data?, response: URLResponse?, error: Error?) {
        let resstr = String(data: data!, encoding: String.Encoding.utf8)
        
        // Execute stuff in UI thread
        DispatchQueue.main.async(execute: {() in
            NSLog(resstr!)
        })
    }
}
