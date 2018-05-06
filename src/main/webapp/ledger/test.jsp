<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<style type="text/css">
body {
    font-size: 12pt;
    font-family: Calibri;
    padding : 10px;
}
table {
    border: 1px solid black;
}
th {
    border: 1px solid black;
    padding: 5px;
    background-color:grey;
    color: white;
}
td {
    border: 1px solid black;
    padding: 5px;
}
input {
    font-size: 12pt;
    font-family: Calibri;
}
</style>
<title>Insert title here</title>
</head>
<body>
<input type="button" id="btnExport" value=" Export Table data into Excel " />
<br/>
<br/>
<div id="dvData">
    <table>
        <tr>
            <th>Column One</th>
            <th>Column Two</th>
            <th>Column Three</th>
        </tr>
        <tr>
            <td>row1 Col1</td>
            <td>row1 Col2</td>
            <td>row1 Col3</td>
        </tr>
        <tr>
            <td>row2 Col1</td>
            <td>row2 Col2</td>
            <td>row2 Col3</td>
        </tr>
        <tr>
            <td>row3 Col1</td>
            <td>row3 Col2</td>
            <td><a href="http://www.jquery2dotnet.com/">http://www.jquery2dotnet.com/</a>
            </td>
        </tr>
    </table>
</div>
<script>
$("#btnExport").click(function (e) {
	alert("$('#dvData').html() : "+$('#dvData').html());
    window.open('data:application/vnd.ms-excel,' + $('#dvData').html());
    e.preventDefault();
});
</script>


</body>
</html>