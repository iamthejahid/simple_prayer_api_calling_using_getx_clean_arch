// ignore_for_file: avoid_print

import "dart:io";
import 'dart:async';
import "dart:convert";
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import "package:http/http.dart" as http;

import '../models/error_response.dart';

Map<String, String> basicHeaderInfo() {
  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    // HttpHeaders.authorizationHeader:
    //     "Basic " + base64Encode(utf8.encode("$_username:$_password")),
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // "Access-Control-Allow-Credentials":
    //     true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  };
}

Future<Map<String, String>> bearerHeaderInfo() async {
  // String accessToken = await GetUserLocalStorage().accessToken();
  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    // HttpHeaders.authorizationHeader: "Bearer $accessToken",
  };
}

class ApiMethod {
  ApiMethod(this.isBasic);

  bool isBasic;

  Future<Map<String, dynamic>?> get(String url) async {
    debugPrint('++----------------- get method hitted-----------------++');
    debugPrint(url);
    debugPrint('++----------------- get method details ended --------++');

    try {
      final response = await http
          .get(
            Uri.parse(url),
            // headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
            // headers: {
            //   HttpHeaders.acceptHeader: "application/json",
            //   HttpHeaders.contentTypeHeader: "application/json",
            // }
          )
          .timeout(const Duration(seconds: 15));
      debugPrint(
          '\n' + response.body.toString() + '\n------- GET RESPONSE ------+');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        debugPrint('Hitted Here!**|token-expire|*******' + url);

        // NavigationService.instance.navigateTo("login");
        Get.snackbar(
          'Unvalid Token',
          'Your token are no longer valid',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );

        return null;
      } else if (response.statusCode == 204) {
        return null;
      } else {
        debugPrint(
            'unknown error hitted in status code' + jsonDecode(response.body));
        // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        // Get.snackbar(
        //   'Error Occured',
        //   res.message!,
        //   backgroundColor: Colors.red,
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        return null;
      }
    } on SocketException {
      Get.snackbar(
        'Broken Internet',
        'Check Your Internet Connection And Try Again!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
      return null;
    } on TimeoutException {
      debugPrint('Time out exception' + url);
      Get.snackbar(
        'Something went wrong',
        'Try again later!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );

      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint('client exception hitted');
      debugPrint(err.toString());
      debugPrint(stackrace.toString());
      return null;
    } catch (e) {
      debugPrint('unlisted error received');
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> post(String url, Map<String, String> body,
      {int code = 201}) async {
    try {
      debugPrint('++----------------- post method hitted-----------------++');
      debugPrint(url);
      debugPrint(body.toString());
      debugPrint('++----------------- post method details end------------++');

      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(const Duration(seconds: 30));
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == code) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 500) {
        Get.snackbar(
          'Some Erro Occured',
          'Server Error Occured',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      } else if (response.statusCode == 401) {
        debugPrint('Hitted Here!**|token-expire|*******' + url);

        // NavigationService.instance.navigateTo("login");
        Get.snackbar(
          'Unvalid Token',
          'Your token are no longer valid',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );

        return null;
      } else {
        debugPrint(
            'unknown error hitted in status code' + jsonDecode(response.body));
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

        Get.snackbar(
          'Error Occured',
          res.message!,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } on SocketException {
      Get.snackbar(
        'Broken Internet',
        'Check Your Internet Connection And Try Again!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
      return null;
    } on TimeoutException {
      debugPrint('Time out exception' + url);
      Get.snackbar(
        'Something went wrong',
        'Try again later!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint('client exception hitted');
      debugPrint(err.toString());
      debugPrint(stackrace.toString());
      return null;
    } catch (e) {
      debugPrint('unlisted error received');
      debugPrint(e.toString());
      return null;
    }
  }

  //delete

  Future<Map<String, dynamic>?> delete(String url, {int code = 202}) async {
    debugPrint('++----------------- delete method hitted-----------------++');
    debugPrint(url);
    debugPrint('++----------------- delete method details end hitted-----++');
    try {
      print(isBasic ? basicHeaderInfo() : await bearerHeaderInfo());
      final response = await http
          .delete(
            Uri.parse(url),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(const Duration(seconds: 30));
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == code) {
        //
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        debugPrint('Hitted Here!**|token-expire|*******' + url);

        // NavigationService.instance.navigateTo("login");
        Get.snackbar(
          'Unvalid Token',
          'Your token are no longer valid',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );

        return null;
      } else {
        debugPrint(
            'unknown error hitted in status code' + jsonDecode(response.body));
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        Get.snackbar(
          'Error Occured',
          res.message!,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } on SocketException {
      Get.snackbar(
        'Broken Internet',
        'Check Your Internet Connection And Try Again!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
      return null;
    } on TimeoutException {
      debugPrint('Time out exception' + url);
      Get.snackbar(
        'Something went wrong',
        'Try again later!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint('client exception hitted');
      debugPrint(err.toString());
      debugPrint(stackrace.toString());
      return null;
    } catch (e) {
      debugPrint('unlisted error received');
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> put(String url, Map<String, String> body,
      {int code = 202}) async {
    try {
      debugPrint('++------------- put method hitted-----------------++');
      debugPrint(url);
      debugPrint(body.toString());
      debugPrint('++------------- put methid details end ------------++');

      final response = await http
          .put(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(const Duration(seconds: 30));
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == code) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        debugPrint('Hitted Here!**|token-expire|*' + url);

        // NavigationService.instance.navigateTo("login");
        Get.snackbar(
          'Unvalid Token',
          'Your token are no longer valid',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );

        return null;
      } else {
        debugPrint(
            'unknown error hitted in status code' + jsonDecode(response.body));
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        Get.snackbar(
          'Error Occured',
          res.message!,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } on SocketException {
      Get.snackbar(
        'Broken Internet',
        'Check Your Internet Connection And Try Again!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
      return null;
    } on TimeoutException {
      debugPrint('Time out exception' + url);
      Get.snackbar(
        'Something went wrong',
        'Try again later!',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint('client exception hitted');
      debugPrint(err.toString());
      debugPrint(stackrace.toString());
      return null;
    } catch (e) {
      debugPrint('unlisted error received');
      debugPrint(e.toString());
      return null;
    }
  }
}
