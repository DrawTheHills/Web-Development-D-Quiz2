<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Pasien</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .edit-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #323232;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .edit-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .edit-form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: rgb(255, 255, 255);
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            Patient patient = (Patient) request.getAttribute("patient");
        %>
        
        <% if (patient != null) { %>
        <div class="edit-form">
            <h2>Edit Data Pasien: <%= patient.getName() %></h2>
            
            <form action="patients" method="POST">
                
                <input type="hidden" name="id" value="<%= patient.getId() %>">
                
                <label for="name">Nama Lengkap</label>
                <input type="text" id="name" name="name" value="<%= patient.getName() %>" required>

                <label for="address">Alamat</label>
                <input type="text" id="address" name="address" value="<%= patient.getAddress() %>" required>

                <label for="phone">No. Telepon</label>
                <input type="text" id="phone" name="phone" value="<%= patient.getPhone() %>" required>

                <button type="submit">Simpan Perubahan</button>
                <a href="patients" style="margin-left: 10px;">Batal</a>
            </form>
        </div>
        <% } else { %>
            <p>Data pasien tidak ditemukan.</p>
        <% } %>
    </div>
</body>
</html>
