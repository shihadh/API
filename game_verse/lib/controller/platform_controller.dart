import 'package:flutter/material.dart';

class PlatformController extends ChangeNotifier{
  
  final List<Map<String, dynamic>> platforms = [
    {
      "title": "PC",
      "image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/e9047d8ec47ae3d94bb8b464fb0fc9e9972b4ac7/header.jpg?t=1749198613",
      "key": "pc"
    },
    {
      "title": "PlayStation 5",
      "image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2358720/header.jpg?t=1749182199",
      "key": "ps5"
    },
    {
      "title": "PlayStation 4",
      "image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/capsule_616x353.jpg?t=1746471508",
      "key": "ps4"
    },
    {
      "title": "Xbox",
      "image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3241660/2cff5912c1add2e009eb1c1c630a47ac06cb81a1/capsule_616x353.jpg?t=1750949552",
      "key": "xbox"
    },
    {
      "title": "Android",
      "image": "https://cdn-www.bluestacks.com/bs-images/featured_com.dts_.freefiremax18.jpg",
      "key": "android"
    },
    {
      "title": "iOS",
      "image": "https://wstatic-prod-boc.krafton.com/common/content/news/20250604/wVBtMRAm_thumb.jpg",
      "key": "ios"
    },
  ];


}
