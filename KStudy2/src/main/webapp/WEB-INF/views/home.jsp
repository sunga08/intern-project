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
                    page : 1
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
                    page : 2
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
                <td>blocks_url</td>
                <td>course_id</td>
                <td>enrollment_start</td>
                <td>enrollment_end</td>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
</html>