<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Edit</title>

        <c:url value="/static/admin/css/admin.css" var="bootstraps"></c:url>
        <link href="${bootstraps}" rel="stylesheet" type="text/css" media="all">


        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="add-content">
                <br>
                <h2 align="center">Edit User</h2>
                <div class="add-table">
                    <form method="POST" action="EditPasswordAction">

                        <table>
                            <tr>
                                <td>ID </td>
                                <td><input type="text" name="id" value = "${userUpdate.id}" readonly="true"></td>
                            </tr>
                            <tr>
                                <td>Name </td>
                                <td><input type="text" name="name" readonly="true" value = "${userUpdate.name}"></td>
                            </tr>
                            <tr>
                                <td>Email </td>
                                <td><input type="text" name="email" readonly="true" value = "${userUpdate.email}"></td>
                            </tr>
                            <tr>
                                <td>Address </td>
                                <td><input type="text" name="address" readonly="true" value = "${userUpdate.address}"></td>
                            </tr>
                            <tr>
                                <td>Position </td>
                                <td><input type="text" name="position" readonly="true" value = "${userUpdate.position}"</td>
                            </tr>
                            <tr>
                                <td>Password </td>
                                <td><input type="password" name="username" placeholder="Input password"></td>
                            </tr>
                            <tr>
                                <td>Repeat Password </td>
                                <td><input type="password" name="password" placeholder="Repeat password"></td>
                            </tr>
                        </table>
                        <input type="submit" value="Ok">
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>
