class Advisor {
  String? id;
  int? typesOfGuideForm;
  String? groupName;
  int? studentInterviewsAndConsultationsCount;
  int? indivCountualParentInterviewsCount;
  int? interviewsForAdministrativeCount;
  int? caseStudyCount;
  int? transferringStudentsToEducationalConsultantCount;
  int? eduCareerGuCountanceCount;
  int? groupCounselingCount;
  int? orientationInterviewCount;
  int? giftedCount;
  int? specialCategorieCount;
  int? healthConditionsAndSpecialCollectionCount;
  int? annualProgramPlanningCount;
  int? educationalAdvisorMeetingCount;
  int? educationalPublicationsCount;
  int? steeringCommitteeCount;
  int? criteriaAndRatingCount;
  int? studiesAndResearchCount;
  int? fieldAndProfessionalVsitsCount;
  int? studentBehaviorAndAcademicsCount;
  int? lecturesCoursesConferenceCount;

  Advisor(
      {this.id,
        this.typesOfGuideForm,
        this.groupName,
        this.studentInterviewsAndConsultationsCount,
        this.indivCountualParentInterviewsCount,
        this.interviewsForAdministrativeCount,
        this.caseStudyCount,
        this.transferringStudentsToEducationalConsultantCount,
        this.eduCareerGuCountanceCount,
        this.groupCounselingCount,
        this.orientationInterviewCount,
        this.giftedCount,
        this.specialCategorieCount,
        this.healthConditionsAndSpecialCollectionCount,
        this.annualProgramPlanningCount,
        this.educationalAdvisorMeetingCount,
        this.educationalPublicationsCount,
        this.steeringCommitteeCount,
        this.criteriaAndRatingCount,
        this.studiesAndResearchCount,
        this.fieldAndProfessionalVsitsCount,
        this.studentBehaviorAndAcademicsCount,
        this.lecturesCoursesConferenceCount});

  Advisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typesOfGuideForm = json['typesOfGuideForm'];
    groupName = json['groupName'];
    studentInterviewsAndConsultationsCount =
    json['studentInterviewsAndConsultationsCount'];
    indivCountualParentInterviewsCount =
    json['indivCountualParentInterviewsCount'];
    interviewsForAdministrativeCount = json['interviewsForAdministrativeCount'];
    caseStudyCount = json['caseStudyCount'];
    transferringStudentsToEducationalConsultantCount =
    json['transferringStudentsToEducationalConsultantCount'];
    eduCareerGuCountanceCount = json['eduCareerGuCountanceCount'];
    groupCounselingCount = json['groupCounselingCount'];
    orientationInterviewCount = json['orientationInterviewCount'];
    giftedCount = json['giftedCount'];
    specialCategorieCount = json['specialCategorieCount'];
    healthConditionsAndSpecialCollectionCount =
    json['healthConditionsAndSpecialCollectionCount'];
    annualProgramPlanningCount = json['annualProgramPlanningCount'];
    educationalAdvisorMeetingCount = json['educationalAdvisorMeetingCount'];
    educationalPublicationsCount = json['educationalPublicationsCount'];
    steeringCommitteeCount = json['steeringCommitteeCount'];
    criteriaAndRatingCount = json['criteriaAndRatingCount'];
    studiesAndResearchCount = json['studiesAndResearchCount'];
    fieldAndProfessionalVsitsCount = json['fieldAndProfessionalVsitsCount'];
    studentBehaviorAndAcademicsCount = json['studentBehaviorAndAcademicsCount'];
    lecturesCoursesConferenceCount = json['lecturesCoursesConferenceCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typesOfGuideForm'] = this.typesOfGuideForm;
    data['groupName'] = this.groupName;
    data['studentInterviewsAndConsultationsCount'] =
        this.studentInterviewsAndConsultationsCount;
    data['indivCountualParentInterviewsCount'] =
        this.indivCountualParentInterviewsCount;
    data['interviewsForAdministrativeCount'] =
        this.interviewsForAdministrativeCount;
    data['caseStudyCount'] = this.caseStudyCount;
    data['transferringStudentsToEducationalConsultantCount'] =
        this.transferringStudentsToEducationalConsultantCount;
    data['eduCareerGuCountanceCount'] = this.eduCareerGuCountanceCount;
    data['groupCounselingCount'] = this.groupCounselingCount;
    data['orientationInterviewCount'] = this.orientationInterviewCount;
    data['giftedCount'] = this.giftedCount;
    data['specialCategorieCount'] = this.specialCategorieCount;
    data['healthConditionsAndSpecialCollectionCount'] =
        this.healthConditionsAndSpecialCollectionCount;
    data['annualProgramPlanningCount'] = this.annualProgramPlanningCount;
    data['educationalAdvisorMeetingCount'] =
        this.educationalAdvisorMeetingCount;
    data['educationalPublicationsCount'] = this.educationalPublicationsCount;
    data['steeringCommitteeCount'] = this.steeringCommitteeCount;
    data['criteriaAndRatingCount'] = this.criteriaAndRatingCount;
    data['studiesAndResearchCount'] = this.studiesAndResearchCount;
    data['fieldAndProfessionalVsitsCount'] =
        this.fieldAndProfessionalVsitsCount;
    data['studentBehaviorAndAcademicsCount'] =
        this.studentBehaviorAndAcademicsCount;
    data['lecturesCoursesConferenceCount'] =
        this.lecturesCoursesConferenceCount;
    return data;
  }
}
