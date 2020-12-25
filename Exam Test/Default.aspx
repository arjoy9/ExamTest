<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         .rightCustomDiv .Pager b{
            width:270px!important;
            padding-top: 10px;
            float:left!important;
            }
            .rightCustomDiv .Pager2{
                display:flex;

            }


            .Pager2 span
    {
        text-align: center;
        color: #999;
        display: inline-block;
        width: auto;
        margin-right: 3px;
        line-height: 150%;
        border: 1px solid #3AC0F2;
        background-color: #99B3FF;
         -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        float:left;
        margin-left:5px;
        padding-left: 5px!important;
        padding-right: 5px!important;
        padding-top: 5px!important;
    }
    .Pager2 a
    {
        text-align: center;
        display: inline-block;
        width: auto;
        background-color: #ddd;
        color: #333 !important;
        border: 1px solid #aaa;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        color: #fff;
        border: 1px solid #3AC0F2;
        margin-right: 3px;
        line-height: 150%;
        text-decoration: none;
        float:left;
    }
    .Pager2{
        padding-left:0px!important
    }
    .page{
        padding-left: 5px!important;
        padding-right: 5px!important;
        padding-top: 5px!important;
    }
    .Pager2 b{
        width:250px!important;
        padding-top: 10px;
        float:left!important;
    }
    th{
        color:cornflowerblue;
    }
    a{
        padding-right:20px;
    }
     .ASC {
                       padding-left: 15px;
                        background: url('../images/sort_asc.png') no-repeat center right;
                       display: inline-block;
                       height: 17px;
                       width: 5px;
                       cursor: pointer;
                      
                   }
                   .DESC {
                       padding-left: 15px;
                        background: url('../images/sort_desc.png') no-repeat center right;
                       display: inline-block;
                       height: 17px;
                       width: 5px;
                       cursor: pointer;
                       
                   }
    </style>
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/Pager.min.js"></script>
    <script type="text/javascript">
        var post = [];
        var comments = [];
        $(document).ready(function() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/GetAllPost",
                datatype: "json",
                success: function (response) {
                    var html = "";
                   
                    var rv = response.d;
                    for (var i = 0; i < rv.length; i++) {
                        html += "<tr>";
                        html += "<th style='text-align:center' >" + rv[i]["PostName"] + "</th>";
                        html += "<th style='text-align:center' >" + rv[i]["PostUser"] + "</th>";
                        html += "<th style='text-align:center'>" + rv[i]["PDate"] + "</th>";
                        html += "<th style='text-align:center'>" + rv[i]["TotalComments"] + " Comments </th>";
                        html += "</tr>";
                        for (var j = 0; j < rv[i].cvm.length; j++) {
                            html += "<tr>";
                            html += "<td style='text-align:left'>" + rv[i].cvm[j]["CommentsText"] + "</td>";
                            html += "<td style='text-align:center' >" + rv[i].cvm[j]["CommentsUser"] + "</td>";
                            html += "<td style='text-align:center'>" + rv[i].cvm[j]["CommentsDate"] + "</td>";
                            html += "<td style='text-align:center'><a href='#' onclick=\"MyFunction('" + rv[i].cvm[j]["CommentsID"] + "','Like');return false;\"'><span class='ASC' >" + rv[i].cvm[j]["CommentsLike"] + "</span></a> <a href='#' onclick=\"MyFunction('" + rv[i].cvm[j]["CommentsID"] + "','DisLike');return false;\"'><span class='DESC' >" + rv[i].cvm[j]["CommentsDisLike"] + "</span></a></td>";
                            html += "</tr>";
                        }

                    }

                   
                    $("[id$=netest]").html(html);
                },
                error: function (err) {


                }
            });
        });
        function MyFunction(CommentsID,LikeDisLike) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/LikeDisLike",
                data: JSON.stringify({ "CommentsID": CommentsID, "LikeDisLike": LikeDisLike }),
                datatype: "json",
                success: function (response) {
                    var html = "";

                    var rv = response.d;
                    for (var i = 0; i < rv.length; i++) {
                        html += "<tr>";
                        html += "<th style='text-align:center' >" + rv[i]["PostName"] + "</th>";
                        html += "<th style='text-align:center' >" + rv[i]["PostUser"] + "</th>";
                        html += "<th style='text-align:center'>" + rv[i]["PDate"] + "</th>";
                        html += "<th style='text-align:center'>" + rv[i]["TotalComments"] + " Comments </th>";
                        html += "</tr>";
                        for (var j = 0; j < rv[i].cvm.length; j++) {
                            html += "<tr>";
                            html += "<td style='text-align:left'>" + rv[i].cvm[j]["CommentsText"] + "</td>";
                            html += "<td style='text-align:center' >" + rv[i].cvm[j]["CommentsUser"] + "</td>";
                            html += "<td style='text-align:center'>" + rv[i].cvm[j]["CommentsDate"] + "</td>";
                            html += "<td style='text-align:center'><a href='#' onclick=\"MyFunction('" + rv[i].cvm[j]["CommentsID"] + "','Like');return false;\"'><span class='ASC' >" + rv[i].cvm[j]["CommentsLike"] + "</span></a> <a href='#' onclick=\"MyFunction('" + rv[i].cvm[j]["CommentsID"] + "','DisLike');return false;\"'><span class='DESC' >" + rv[i].cvm[j]["CommentsDisLike"] + "</span></a></td>";
                            html += "</tr>";
                        }

                    }


                    $("[id$=netest]").html(html);
                },
                error: function (err) {


                }
            });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:100px;">
        <table id="netest" runat="server" border='1' style="border-collapse:collapse;width:100%;border-color:#cccccc 1px solid;">
        </table>
        <div class="Pager2"></div>
    </div>
    </form>
</body>
</html>
