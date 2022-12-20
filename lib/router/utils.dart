import 'package:go_router/go_router.dart';
import 'package:i_dance/screens/classroom_screen.dart';
import 'package:i_dance/screens/create_lesson_screen.dart';
import 'package:i_dance/screens/home_screen.dart';
import 'package:i_dance/screens/login_screen.dart';
import 'package:i_dance/screens/profile_screen.dart';
import 'package:i_dance/screens/register_screen.dart';
import 'package:i_dance/screens/splash_screen.dart';

enum AppPage {
  activity,
  challenge,
  classroom,
  createActivity,
  createChallenge,
  createClassroom,
  createLesson,
  error,
  home,
  lesson,
  login,
  onBoarding,
  profile,
  register,
  splash,
}

const _pageInfo = {
  AppPage.home: {'path': '/', 'name': 'HOME', 'title': 'iDance'},
  AppPage.login: {'path': '/login', 'name': 'LOGIN', 'title': 'Log In'},
  AppPage.splash: {'path': '/splash', 'name': 'SPLASH', 'title': 'Splash'},
  AppPage.error: {'path': '/error', 'name': 'ERROR', 'title': 'Error'},

  AppPage.onBoarding: {
    'path': '/onBoarding',
    'name': 'ONBOARDING',
    'title': 'OnBoarding'
  },
  AppPage.register: {
    'path': '/register',
    'name': 'REGISTER',
    'title': 'Register'
  },
  AppPage.classroom: {
    'path': '/classroom/:id',
    'name': 'CLASSROOM',
    'title': 'Classroom'
  },
  AppPage.createLesson: {
    'path': '/createLesson/:id',
    'name': 'CREATELESSON',
    'title': 'Create Lesson'
  },
  AppPage.createActivity: {
    'path': '/createActivity/:id',
    'name': 'CREATEACTIVITY',
    'title': 'Create Activity'
  },
  AppPage.createChallenge: {
    'path': '/createChallenge/:id',
    'name': 'CREATECHALLENGE',
    'title': 'Create Challenge'
  },
  AppPage.lesson: {'path': '/lesson/:id', 'name': 'LESSON', 'title': 'Lesson'},
  AppPage.activity: {
    'path': '/activity/:id',
    'name': 'ACTIVITY',
    'title': 'Activity'
  },
  AppPage.challenge: {
    'path': '/challenge/:id',
    'name': 'CHALLENGE',
    'title': 'Challenge'
  },

  AppPage.profile: {'path': '/profile', 'name': 'PROFILE', 'title': 'Profile'}

  // etc.
};

final routes = [
  GoRoute(
    path: AppPage.splash.toPath, // '/splash',
    name: AppPage.splash.toName,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppPage.login.toPath,
    name: AppPage.login.toName,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppPage.home.toPath,
    name: AppPage.home.toName,
    builder: (context, state) => const HomeScreen(),
  ),
  // for register screen
  GoRoute(
    path: AppPage.register.toPath,
    name: AppPage.register.toName,
    builder: (context, state) => const RegisterScreen(),
  ),
  // for classroom screen
  GoRoute(
    path: AppPage.classroom.toPath,
    name: AppPage.classroom.toName,
    builder: (context, state) {
      final id = state.params['id'];
      return ClassroomScreen(id: id ?? 'Empty');
    },
  ),
  // for create lesson screen
  GoRoute(
    path: AppPage.createLesson.toPath,
    name: AppPage.createLesson.toName,
    builder: (context, state) {
      final id = state.params['id'];
      return CreateLessonScreen(id: id ?? 'Empty');
    },
  ),

  GoRoute(
      path: AppPage.profile.toPath,
      name: AppPage.profile.toName,
      builder: ((context, state) {
        return const ProfileScreen();
      }))
];

extension AppPageExtension on AppPage {
  String get toPath => _pageInfo[this]?['path'] ?? '/error';
  String get toName => _pageInfo[this]?['name'] ?? 'NOT FOUND';
  String get toTitle => _pageInfo[this]?['title'] ?? 'Not found';
}
