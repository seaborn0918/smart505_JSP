package com.bitc.jsp_0517.database;

public class MemberDTO {
  private String userId;
  private String userPw;
  private String userName;
  private int userGrade;

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPw() {
    return userPw;
  }

  public void setUserPw(String userPw) {
    this.userPw = userPw;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public int getUserGrade() {
    return userGrade;
  }

  public void setUserGrade(int userGrade) {
    this.userGrade = userGrade;
  }
}
