<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Import Model dan List --%>
<%@ page import="java.util.List" %>
<%@ page import="model.RevenueItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Psycho Clinic</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav>
        <div class="brand">PsychoSystem</div>
        <ul>
            <li><a href="dashboard" class="active">Dashboard</a></li>
            <li><a href="patients">Pasien</a></li>
            <li><a href="sessions">Session</a></li>
        </ul>
    </nav>

    <div class="container">
        <h2>Ringkasan Klinik</h2>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="label">Total Pasien</div>
                <div class="number"><%= request.getAttribute("stats_patients") %></div>
            </div>
            <div class="stat-card">
                <div class="label">Sesi Booking</div>
                <div class="number"><%= request.getAttribute("stats_bookings") %></div>
            </div>
            <div class="stat-card highlight">
                <div class="label">Total Pendapatan</div>
                <div class="number">Rp <%= request.getAttribute("stats_revenue") %></div>
            </div>
        </div>

        <div class="card-table">
            <h3>Laporan Bulanan</h3>
            <table>
                <thead>
                    <tr>
                        <th>Bulan</th>
                        <th>Pendapatan</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Ambil list yang dikirim dari Servlet
                    List<RevenueItem> list = (List<RevenueItem>) request.getAttribute("list_revenue");
                    
                    if (list != null) {
                        for (RevenueItem item : list) {
                    %>
                    <tr>
                        <td><%= item.getMonth() %></td>
                        <td>Rp <%= String.format("%,.0f", item.getAmount()) %></td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr><td colspan="2">Tidak ada data.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
