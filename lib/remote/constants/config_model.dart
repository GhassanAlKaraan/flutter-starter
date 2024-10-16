class BaseUrls { // TODO use .env to store URLs, let this file change based on values provided in .env
  static const String baseAPi = ""; // TODO import API URL from .env
  static const String localAPi = "";  // TODO import Local API URL from .env

  static const String baseURL = "";

  static const String productionAPi = baseAPi; // TODO Switch API URL here

  //endpoints
  static const String filesUrl = "$baseURL/storage";
  static const String list = 'list';
  static const String show = 'show/';
  static const String register = 'register';
  static const String login = 'login';
}
