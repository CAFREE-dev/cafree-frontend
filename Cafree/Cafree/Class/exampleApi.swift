//
//  exampleApi.swift
//  Cafree
//
//  Created by 박승찬 on 2023/01/09.
//  api 통신 테스트

import Foundation

class exampleApi {
    //let url = URL(string: "https://~~~~~~")
//
    ////Request 객체
    //var request = URLRequest(url: url)
    //request.httpMethod = "GET"
    //
    ////URLSessionConfiguration - shared(singleton)
    ////URLSessionTask - DataTask
    ////Completion Handler를 통한 Response 처리
    //let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {[weak self] data, response, error in
    //    guard error == nil,
    //    let response = response as? HTTPURLResponse,
    //    let data = data,
    //    //응답으로 받은 JSON Decoding
    //    let movie = try? JSONDecoder().decode([movie].self, from: data) else{
    //          print("ERROR : URLSesstion data task \(error?.localizedDescription ?? "")")
    //          return
    //     }
//
    //    //상태 확인
    //    switch response.statusCode {
      //     case (200...299): //성공
      //        self.movieList += movie
//
      //        DispatchQueue.main.async {
      //          self.tableView.reloadData()
      //        }
      //
      //     case (400...499): //client error
      //        print("""
      //           ERROR: Client Error - \(response.statusCode)
      //           Response: \(response)
      //        """)
      //
      //     case(500...599): //server error
      //        print("""
      //           ERROR: Server Error - \(response.statusCode)
      //           Response: \(response)
      //        """)
      //
      //     default:
      //        print("""
  //               ERROR: \(response.statusCode)
  //               Response: \(response)
  //            """)
  //     }
  //  })
//
  //  //선언 후 꼭 resume(실행)을 해주어야 함
  //  dataTask.resume()
}
