import 'dart:async';

import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/db/database_helper.dart';
import 'package:dicoding_fundamtental_submission/data/models/detail_restaurant.dart';
import 'package:dicoding_fundamtental_submission/data/models/favorite_restaurant.dart';
import 'package:dicoding_fundamtental_submission/data/preferences/restaurant_preference_helper.dart';
import 'package:dicoding_fundamtental_submission/provider/enum_result.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_database_provider.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_detail_provider.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_list_provider.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_schedule_provider.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_search_provider.dart';
import 'package:dicoding_fundamtental_submission/ui/widget/widget.dart';
import 'package:dicoding_fundamtental_submission/shared/shared.dart';
import 'package:dicoding_fundamtental_submission/utils/background_services.dart';
import 'package:dicoding_fundamtental_submission/utils/notification_helper.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'restaurant_list_page.dart';
part 'restaurant_detail_page.dart';
part 'restaurant_splashscreen_page.dart';
part 'search_restaurant_page.dart';
part 'restaurant_addreview_page.dart';
part 'restaurant_favorite_page.dart';
part 'restaurant_settings_page.dart';
