<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $('#btn').on("click", function(){
            var form = {
                    page : 12
            }
            $.ajax({
                url: "getData",
                type: "POST",
                data: JSON.stringify(form),
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(data){
                    console.log(data.results);    
                    $('#tbody').append("<tr>");
                    appendingText(data.results[0].blocks_url);
                    appendingText(data.results[0].course_id);
                    appendingText(data.results[0].enrollment_start);
                    appendingText(data.results[0].enrollment_end);
                    $('#tbody').append("</tr>");
                },
                error: function(){
                    alert("err");
                }
            });
            
            var form2 = {
                    page : 13
            }
            $.ajax({
                url: "getData",
                type: "POST",
                data: JSON.stringify(form2),
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(data){
                    console.log(data.results);    
                    $('#tbody').append("<tr>");
                    appendingText(data.results[0].blocks_url);
                    appendingText(data.results[0].course_id);
                    appendingText(data.results[0].enrollment_start);
                    appendingText(data.results[0].enrollment_end);
                    $('#tbody').append("</tr>");
                },
                error: function(){
                    alert("err");
                }
            });
            
        });
    });
    
    function appendingText(txt){
	    var tag = "<td>" + txt + "</td>";
        $('#tbody').append(tag);
    }
</script>
<body>
    <button id="btn">btn</button>
    <table border="1">
        <thead>
            <tr>
                <td>3일후 오전</td>
                <td>3일후 오후</td>
                <td>4일후 오전</td>
                <td>4일후 오후</td>
                <td>5일후 오전</td>
                <td>5일후 오후</td>
                <td>6일후 오전</td>
                <td>6일후 오후</td>
                <td>7일후 오전</td>
                <td>7일후 오후</td>
                <td>8일후</td>
                <td>9일후</td>
                <td>10일후</td>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
</html>