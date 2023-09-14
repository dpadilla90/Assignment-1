//
//  ViewController.swift
//  Assignment-1
//
//  Created by Daphne Rivera on 2023-09-13.
//



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var callCatAPIButton: UIButton!
    @IBOutlet weak var callDogAPIButton: UIButton!
    @IBOutlet weak var callDogFactsAPIButton: UIButton!
    
    @IBAction func callCatApi(_ sender: Any) {
        Task {
              do {
                  await print(try CatAPI_Helper.fetch())
              } catch API_Errors.CANNOT_CONVERT_STRING_TO_URL {
                  print("Please insert a correct URL")
              } catch API_Errors.CANNOT_PARSE_DATA_INTO_JSON {
                  print("Failed to parse JSON data")
              } catch let err {
                  print(err)
              }
          }
    }

    @IBAction func callCoffeeApi(_ sender: Any) {
        Task {
              do {
                  await print(try CoffeeAPI_Helper.fetch())
              } catch API_Errors.CANNOT_CONVERT_STRING_TO_URL {
                  print("Please insert a correct URL")
              } catch API_Errors.CANNOT_PARSE_DATA_INTO_JSON {
                  print("Failed to parse JSON data")
              } catch let err {
                  print(err)
              }
          }
    }

    @IBAction func callDogFactsApi(_ sender: Any) {
        Task {
              do {
                  await print(try DogFactsAPI_Helper.fetch())
              } catch API_Errors.CANNOT_CONVERT_STRING_TO_URL {
                  print("Please insert a correct URL")
              } catch API_Errors.CANNOT_PARSE_DATA_INTO_JSON {
                  print("Failed to parse JSON data")
              } catch let err {
                  print(err)
              }
          }
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view.
    }
}
