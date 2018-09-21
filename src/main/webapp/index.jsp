<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.company.HelloAppEngine" %>
<%@ page import="java.util.Calendar" %>
<html>
<head>
    <style>
        div.fout {
            color: red;
            font-size: 0.8em;
            display: inline;
        }

        table#schaakbord, .schaakbord {
            border: 1px solid black;
            border-collapse: collapse;
        }

        #schaakbord td, .schaakbord td {
            width: 30px;
            height: 30px;
            border: 1px solid black;
        }

        #schaakbord td.zwart, .schaakbord td.zwart {
            background-color: black;

        }

        #schaakbord td.wit, .schaakbord td.wit {
            background-color: white;
        }
    </style>
    <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
    <title>Hello App Engine Standard Java 8</title>
</head>
<body>
<h1>Hello App Engine -- Java 8!</h1>

<p>This is <%= HelloAppEngine.getInfo() %>.</p>
<table>
    <tr>
        <td colspan="2" style="font-weight:bold;">Available Servlets:</td>
    </tr>
    <tr>
        <td><a href='/hello'>Hello App Engine</a></td>
    </tr>
</table>
<!-- jsp code -->
<% double bedrag = 113.0; %>

<!-- html code  -->
<table border="1">
    <thead>
    <tr>
        <th>Naam</th>
        <th>Totaal &euro; <%= bedrag %>
        </th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Jan</td>
        <td>&euro; <%= bedrag / 4 %>
        </td>
    </tr>
    <tr>
        <td>Ali</td>
        <td>&euro; <%= bedrag / 4 %>
        </td>
    </tr>
    <tr>
        <td>Jeannette</td>
        <td>&euro; <%= bedrag / 4 %>
        </td>
    </tr>
    <tr>
        <td>Piet</td>
        <td>&euro; <%= bedrag / 4 %>
        </td>
    </tr>
    </tbody>
</table>

<%
    //    boolean digitaalklok = false; // toggle voor normaal en analog
    Calendar nu = Calendar.getInstance();
    int huidigUur = nu.get(Calendar.HOUR_OF_DAY);
// if (digitaalklok = false && huidigUur > 12) { huidigUur = huidigUur-12;} // een 12 uur klok.

//hier komt de overige java code

%>
<p>huidigUur is <%= huidigUur %>
</p>

<div>
    <%
        long arg0 = 0L;
        long arg1 = 1L;
        long som = arg0 + arg1;
        long maxWaarde = 900000000000000000L;
    %>
    <% while (som < maxWaarde) {
        som = arg0 + arg1;
        arg0 = arg1;
        arg1 = som; %>
    <%= som %>,
    <% } %>
</div>
<br>
<div>
<%--<tr>--%>
<%--<td class="zwart"></td>--%>
<%--<td class="wit">--%>
<%--</td><td class="zwart"></td>--%>
<%--<td class="wit">--%>
<%--</td><td class="zwart"></td>--%>
<%--<td class="wit">--%>
<%--</td><td class="zwart"></td>--%>
<%--<td class="wit">--%>
<%--</td></tr>--%>
<table id="schaakbord">
<tbody>
<%
int loops = 0;
int f = 1;
Boolean alt = false;
boolean chesscomplete = false;
while (!chesscomplete) {

%>

<%
if (alt = false) { %>
<tr><%
while (f <= 4) {
%>

<td class="zwart"></td>
<td class="wit"></td>

<%
f++;
}loops++;
alt = true; %></tr><br>
<%
} else %>
<tr><% while (f <= 4) {
%>
<td class="wit"></td>
<td class="zwart"></td>

<% f++;
}
alt = false; %></tr><br>
<%
loops++;
if (loops >= 6) {
chesscomplete = true;
}
System.out.println(alt);}%>
</tbody>
</table>


</div>
<br>

<div>
    <%

        //        String getal1 = "";
//        int i = 1;
        int tafel = 5;
        int resultaat;
//        tafel = Integer.parseInt(getal1);
    %>
    <%
        int getal = 0;
        boolean geklikt = false;
        String strGetal;
        String foutboodschap = "";

        if (request.getParameter("knop") != null ||
                request.getParameter("min") != null ||
                request.getParameter("plus") != null) {
            strGetal = request.getParameter("getal");
            try {
                getal = Integer.parseInt(strGetal);
                geklikt = true;
            } catch (NumberFormatException exc) {

                foutboodschap = "U moet een geheel getal invoeren!";
            } finally {

            }
            if (request.getParameter("min") != null) {
                getal = getal - 1;
            } else if (request.getParameter("plus") != null) {
                getal = getal + 1;
            }

        }
    %>
    <form action="index.jsp" method="get">
        <input type="text" name="getal">

        <div class="fout">
            <%= foutboodschap %>
        </div>
        <div class="knop">
            <input type="submit" name="knop" value="Ok">
        </div>
    </form>
    <% if (geklikt) {
        for (int i = 1; i <= 10; i++) { %>
    <%= i %> x <%= getal %> = <%= i * getal %> <br>
    <% }
    } %>
    <form action="index.jsp" method="get">
        <input type="hidden" name="getal" value="<%= getal %>">
        <input type="submit" name="min" value=" <  <% getal++;%> ">
        <input type="submit" name="plus" value=" > <%getal++;%>  ">
    </form>

    <%--<% while (i <= 10) {--%>
    <%--resultaat = tafel * i;--%>
    <%--%>--%>
    <%--&lt;%&ndash;<tr><td> <%= i%></td><td><%= tafel%></td><td><%= resultaat%></td></tr>&ndash;%&gt;--%>
    <%--<br>--%>
    <%--<%=  i + " * " + tafel + " = " + resultaat %>,--%>
    <%--<%--%>
    <%--i++;--%>
    <%--}--%>

</div>

</body>
</html>
