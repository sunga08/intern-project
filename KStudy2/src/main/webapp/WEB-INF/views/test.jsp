<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<body>

<div class="container">
    <table class="table table-hover table table-striped">
        <tr>
            <th>번호</th>
            <th>작성자</th>
        </tr>

        <c:forEach items="${list}" var="post">
            <tr>
                <th>${post.getUserId()}</th>
                <th>${post.getUserPw()}</th>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>