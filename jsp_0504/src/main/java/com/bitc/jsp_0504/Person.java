package com.bitc.jsp_0504;
// 자바빈즈로 사용되는 클래스
public class Person {
  // 필드는 반드시 접근 제한자를 private로 설정
  private String name;
  private int age;

  // 반드시 기본생성자 존재해야 함
  public Person() {}

  public Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  // 필드에 대한 getter, setter를 생성
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}
