enum UserCategory{
  ADMIN,USER,AUTHOR, STUDENT
}

int TRIAL_PERIOD = 2;
int MONTHLY_SUB_DURATION=30;
enum EducationLevel{
  OLEVEL_TO_JAMB, UNIVERSITY, MASTERS,NONE
}

enum SubscriptionStatus{
  ACTIVE, TRIAL, FAILED, PAUSED,UNSUBSCRIBED,AUTO_RENEWAL,EXPIRED,NONE
}

enum MessageState{
  SEEN, DELIVERED, SENT
}

enum MessageType{
  IMAGE, TEXT
}

enum ChannelType{
  DM, GROUP
}