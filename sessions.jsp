<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Session" %>
<%@ page import="java.text.NumberFormat" %> 
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
    <title>Layanan Sesi - Psycho Clinic</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav>
        <div class="brand">PsychoSystem</div>
        <ul>
            <li><a href="dashboard">Dashboard</a></li>
            <li><a href="patients">Pasien</a></li>
            <li><a href="sessions" class="active">Layanan Sesi</a></li>
        </ul>
    </nav>

    <div class="container">
        <h2>Daftar Layanan Sesi</h2>
        <div class="card-table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama Sesi</th>
                        <th>Durasi (Menit)</th>
                        <th>Harga</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Session> sessionsList = (List<Session>) request.getAttribute("sessionsList");
                    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
                    
                    if (sessionsList != null) {
                        for (Session s : sessionsList) {
                            String priceRupiah = currencyFormat.format(s.getPrice());
                    %>
                    <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getName() %></td>
                        <td><%= s.getDurationMinutes() %></td>
                        <td><%= priceRupiah %></td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr><td colspan="4">Tidak ada data sesi.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
