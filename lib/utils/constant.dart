class Constant {
  static final String env = "DEV"; // DEV - PROD

  static final String baseUrlProd = "api.bookmedial.com";
  static final String baseWebUrlProd = "bookmedial.com";

  static final String baseUrlPreProd = "api-bookmedial.rikudo.ci";
  static final String baseWebUrlPreProd = "book-medial.rikudo.ci";

  static final String defaultImage = "https://${(env == 'PROD') ? baseWebUrlProd : baseWebUrlPreProd}/assets/images/climate.jpg";
  static final String kGoogleApiKey = "AIzaSyAMbjx_FKQ9eKb1KKwXIDA1g_UefF0fArI";

  static final int limitRayon = 10; // en km

  static final String buySuccessUrl = "${(env == 'PROD') ? baseWebUrlProd : baseWebUrlPreProd}/thank-you";
  static final String buyEchecUrl = "${(env == 'PROD') ? baseWebUrlProd : baseWebUrlPreProd}/errorPurchase";
  static final String registerHeberge = "https://${(env == 'PROD') ? baseWebUrlProd : baseWebUrlPreProd}/join";
}