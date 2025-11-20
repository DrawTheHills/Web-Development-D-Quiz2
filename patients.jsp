<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Patient" %> 
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Pasien - Psycho Clinic</title>
    <link rel="stylesheet" href="css/style.css"> 
    <style>
        .add-form {
            background: #121212;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(44, 44, 44, 0.1);
            margin-bottom: 30px;
        }
        .add-form input {
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .action-link {
            text-decoration: none;
            margin-right: 10px;
            padding: 2px 5px;
            border-radius: 3px;
        }
        .edit-btn {
            color: rgb(0, 119, 255);
        }
        .delete-btn {
            color: red;
        }
    </style>
</head>
<body>
    <nav>
        <div class="brand">PsychoSystem</div>
        <ul>
            <li><a href="dashboard">Dashboard</a></li>
            <li><a href="patients" class="active">Pasien</a></li>
            <li><a href="sessions">Layanan Sesi</a></li>
        </ul>
    </nav>

    <div class="container">
        <h2>Daftar Pasien</h2>

        <div class="add-form">
            <h3>Tambah Pasien Baru</h3>
            <form action="patients" method="POST">
                <input type="hidden" name="id" value="0">
                <input type="text" name="name" placeholder="Nama Lengkap" required>
                <input type="text" name="address" placeholder="Alamat" required>
                <input type="text" name="phone" placeholder="No. Telepon" required>
                <button type="submit">Tambah Pasien</button>
            </form>
        </div>

        <div class="card-table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>No. Telp</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Patient> patientsList = (List<Patient>) request.getAttribute("patientsList");
                    
                    if (patientsList != null) {
                        for (Patient p : patientsList) {
                    %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getAddress() %></td>
                        <td><%= p.getPhone() %></td>
                        <td>
                            <a href="patients?editId=<%= p.getId() %>" 
                               class="action-link edit-btn">
                                Edit
                            </a>
                            
                            <a href="patients?deleteId=<%= p.getId() %>" 
                               onclick="return confirm('Yakin ingin menghapus <%= p.getName() %>?');" 
                               class="action-link delete-btn">
                                Hapus
                            </a>
                        </td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr><td colspan="5">Tidak ada data pasien.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
