class ApiKey{
  static const String baseUrl = "https://ejabi-api.transitiondemo.com/api/";
  static const String getToken = "Accounts/GenerateToken";
  static const String refreshToken = "Accounts/RefreshToken";
  static const String verifyPhone = "Accounts/VerifyPhone";
  static const String getTeacherInfo = "Teacher/GetTeacherInfo";
  static const String getFatherInfo = "Parent/ParentInfo";
  static const String getChildrenByParent = "Parent/GetChildrenByParent";
  static const String getTeacherHome = "Teacher/GetTeacherHomePage";
  static const String getClassHouses = "Teacher/GetClassHouses";
  static const String getStudentsHouse = "Teacher/TeacherStudentsSection";
  static const String getTeacherPrinciplesByClassroomId = "Teacher/GetPrinciplesByClassroomId";
  static const String getTeacherStudentProfileInSchoolHouse = "Teacher/StudentProfileInSchoolHouse";
  static const String postTeacherCreatePoint = "Teacher/CreatePoint";
  static const String postFatherCreatePoint = "Parent/CreatePoint";
  static const String teacherChangePhoto = "Teacher/ChangeTeacherPhoto";
  static const String getSchoolHouses = "Teacher/GetSchoolHouses";
  static const String getSearchValues = "Teacher/GetSearchByDateEnum";
  static const String updateUserDeviceToken = "Accounts/UpdateUserDeviceToken";
  static const String getNotification = "Notifications/GetNotifications";
  static const String getInboxNotification = "Notifications/GetInboxNotifications";
  static const String updateNotification = "Notifications/UpdateNotification";
  static const String changeClassRoomSectionPhoto = "Teacher/ChangeClassroomToSectionPhoto";
  static const String getEjabiChannels = "Accounts/GetEjabiChannels";
  static const String getTeacherEjabiChannels = "Teacher/GetEjabiChannels";
}