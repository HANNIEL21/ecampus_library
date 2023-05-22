export 'dart:convert';
export 'dart:io';
export 'package:flutter/services.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';

// Packages
export 'package:animations/animations.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:http/http.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:ecampus_library/firebase_options.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:provider/provider.dart';
export 'package:image_picker/image_picker.dart';


// Screens
export 'firebase_options.dart';
export 'package:ecampus_library/dummydata.dart';
export 'package:ecampus_library/screens/auth/auth.dart';
export 'package:ecampus_library/screens/auth/login.dart';
export 'package:ecampus_library/screens/auth/signup.dart';
export 'package:ecampus_library/screens/auth/otp.dart';
export 'package:ecampus_library/screens/auth/new_password.dart';
export 'package:ecampus_library/screens/auth/recover_password.dart';
export 'package:ecampus_library/screens/auth/edit_profile.dart';
export 'package:ecampus_library/screens/public/Root.dart';
export 'package:ecampus_library/screens/public/Account.dart';
export 'package:ecampus_library/screens/public/Books.dart';
export 'package:ecampus_library/screens/public/BookScreens/BookScreen.dart';
export 'package:ecampus_library/screens/public/BookScreens/AudioBookScreen.dart';
export 'package:ecampus_library/screens/public/BookScreens/OverViewScreen.dart';
export 'package:ecampus_library/screens/public/Library.dart';
export 'package:ecampus_library/screens/public/Class.dart';
export 'package:ecampus_library/screens/public/ClassScreens/Exams.dart';
export 'package:ecampus_library/screens/public/ExamScreens/MainExamScreen.dart';
export 'package:ecampus_library/screens/public/ExamScreens/Jamb.dart';
export 'package:ecampus_library/screens/public/ExamScreens/PostUtme.dart';
export 'package:ecampus_library/screens/public/ExamScreens/Subjects.dart';
export 'package:ecampus_library/screens/public/ExamScreens/Faculty.dart';
export 'package:ecampus_library/screens/public/ExamScreens/ExamScreen1.dart';
export 'package:ecampus_library/screens/public/ClassScreens/Video.dart';
export 'package:ecampus_library/screens/public/ClassScreens/Curriculum.dart';
export 'package:ecampus_library/screens/public/ClassScreens/Games.dart';
export 'package:ecampus_library/screens/public/ClassScreens/DailyTask.dart';
export 'package:ecampus_library/screens/public/Subscription/Subscription.dart';

// Constants
export 'package:ecampus_library/utils/constants/constants.dart';
export 'package:ecampus_library/utils/constants/strings.dart';

// Helpers
export 'package:ecampus_library/utils/helpers/routeHelper.dart';

// Extensions
export 'package:ecampus_library/utils/extensions/routeExtension.dart';
export 'package:ecampus_library/utils/extensions/snackbarExtension.dart';

// Widgets
export 'package:ecampus_library/widgets/CustomTextField.dart';
export 'package:ecampus_library/widgets/AuthorListTile.dart';
export 'package:ecampus_library/widgets/AuthorsTile.dart';
export 'package:ecampus_library/widgets/Carousel.dart';
export 'package:ecampus_library/widgets/CarouseTile.dart';
export 'package:ecampus_library/widgets/CategoriesTile.dart';
export 'package:ecampus_library/widgets/CategoryTitle.dart';
export 'package:ecampus_library/widgets/AudioBooksTile.dart';
export 'package:ecampus_library/widgets/BookTile.dart';
export 'package:ecampus_library/widgets/ClassTiles.dart';
export 'package:ecampus_library/widgets/CustomStatsTile.dart';
export 'package:ecampus_library/widgets/ExamCard.dart';
export 'package:ecampus_library/widgets/CardWidget.dart';
export 'package:ecampus_library/widgets/Dropdown.dart';

// Provider
export 'package:ecampus_library/data/provider/app_provider.dart';
export 'package:ecampus_library/data/provider/auth_provider.dart';
export 'package:ecampus_library/data/provider/user_provider.dart';
export 'package:ecampus_library/data/provider/base_provider.dart';
export 'package:ecampus_library/data/provider/helper/base_helper.dart';
export 'package:ecampus_library/data/provider/helper/provider_response.dart';

// Services
export 'package:ecampus_library/data/service/dao/user_dao.dart';
export 'package:ecampus_library/data/service/dao/auth_dao.dart';
export 'package:ecampus_library/data/service/dao/admin_dao.dart';
export 'package:ecampus_library/data/service/repositories/user_repository.dart';
export 'package:ecampus_library/data/service/repositories/admin_repository.dart';
export 'package:ecampus_library/data/service/repositories/auth_repository.dart';

// Preferences
export 'package:ecampus_library/data/preference/shared_preference.dart';

// Models
export 'package:ecampus_library/data/models/user.dart';
export 'package:ecampus_library/data/models/user_model.dart';
export 'package:ecampus_library/data/models/subscription_model.dart';
export 'package:ecampus_library/data/models/message_model.dart';
export 'package:ecampus_library/data/models/group_model.dart';
export 'package:ecampus_library/data/models/file_model.dart';
export 'package:ecampus_library/data/models/channel_model.dart';
export 'package:ecampus_library/data/models/login_model.dart';

// Library
export 'package:ecampus_library/data/library/brainfield/model/e_material.dart';
export 'package:ecampus_library/data/library/brainfield/model/exam.dart';
export 'package:ecampus_library/data/library/brainfield/model/subject.dart';
export 'package:ecampus_library/data/library/brainfield/model/topic.dart';
export 'package:ecampus_library/data/library/brainfield/api/api_calls.dart';
export 'package:ecampus_library/data/library/brainfield/controller/brainfield_controller.dart';

// Exceptions
export 'package:ecampus_library/data/exceptions/app_exceptions.dart';

// Enums
export 'package:ecampus_library/data/enums.dart';


