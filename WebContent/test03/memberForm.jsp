<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>

<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정창</title>
    <style>
        .cls1 {
            font-size: 40px;
            text-align: center;
        }
    </style>
</head>

<body>
    <h1 class="cls1">회원 정보 수정창</h1>

    <form method="post" action="${contextPath}/member/modMember.do?email=${memInfo.email}">
        <table align="center">
            <tr>
                <td width="200"><p align="right">이메일</p></td>
                <td width="400"><input type="text" name="email" value="${memInfo.email}" disabled></td>
                <!-- 이메일을 출력하는 텍스트 필드를 생성함. 수정 불가능(disabled) 상태로 설정. -->
            </tr>

            <tr>
                <td width="200"><p align="right">비밀번호</p></td>
                <td width="400"><input type="password" name="password" value="${memInfo.password}"></td>
                <!-- 비밀번호를 입력하는 필드를 생성하여 기존 비밀번호를 출력함. -->
            </tr>

            <tr>
                <td width="200"><p align="right">이름</p></td>
                <td width="400"><input type="text" name="name" value="${memInfo.name}"></td>
                <!-- 이름을 입력하는 텍스트 필드를 생성하여 기존 이름을 출력함. -->
            </tr>

            <tr>
                <td width="200"><p align="right">연락처</p></td>
                <td width="400"><input type="text" name="phone" value="${memInfo.phone}"></td>
                <!-- 연락처를 입력하는 텍스트 필드를 생성하여 기존 연락처를 출력함. -->
            </tr>

            <tr>
                <td width="200"><p align="right">성별</p></td>
                <td width="400">
                    <select name="gender">
                        <option value="M" ${memInfo.gender == 'M' ? 'selected' : ''}>남성</option>
                        <option value="F" ${memInfo.gender == 'F' ? 'selected' : ''}>여성</option>
                    </select>
                </td>
                <!-- 성별 선택을 위한 드롭다운을 생성함. 기존 값에 따라 선택 상태를 설정. -->
            </tr>

            <tr align="center">
                <td colspan="2" width="400">
                    <input type="submit" value="수정하기">
                    <input type="reset" value="다시입력">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
