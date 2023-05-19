package com.bitc.jsp_0504;

public class MyELClass {
  public String getGender(String jumin) {
    String returnStr = "";

    int beginIdx = jumin.indexOf("-") + 1; // 주민번호 뒷자리 선택
    String genderStr = jumin.substring(beginIdx, beginIdx + 1); // (시작 인덱스, 끝 인덱스) 끝 인덱스는 포함하지 않고 시작 인덱스부터 가져오기(뒷자리 첫번째 번호 선택: 3 또는 4)
    int genderInt = Integer.parseInt(genderStr);
    if (genderInt == 1 || genderInt == 3) {
      returnStr ="남자";
    } else if (genderInt == 2 || genderInt == 4) {
      returnStr = "여자";
    } else {
      returnStr = "주민번호 오류입니다.";
    }
    return returnStr;
  }

  public static boolean isNumber(String value) {
    char[] chArr = value.toCharArray();
    for (int i = 0; i < chArr.length; i++){
      if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
        return false;
      }
    }
    return true;
  }

  public static String showGugudan(int limitDan) {
    StringBuffer sb = new StringBuffer();
    try {
      sb.append("<table border='1'>");
      for (int i=2; i <= limitDan; i++){
        sb.append("<tr>");
        for (int j = 1; j <=9; j++) {
          sb.append("<td>" + i  + "*" + j + "=" + (i*j) + "</td>");
        }
        sb.append("</tr>");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return sb.toString();
  }
}
