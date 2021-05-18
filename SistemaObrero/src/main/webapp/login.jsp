

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.conexionBD"%>
<%@page import="validaciones.validacionesSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprobando</title>
    </head>
    <body>
        <%
            try{ 
                conexionBD conection = new conexionBD();
                Connection conexion = conection.getConexion();
                String callSP = "EXECUTE sp_ListarUsuarios";
                PreparedStatement ps = conexion.prepareStatement(callSP);
                ResultSet dataset = ps.executeQuery();
                HashMap<String, String> comprobar = new HashMap<>();
                while(dataset.next()){
                   comprobar.put(dataset.getString("username"),dataset.getString("password"));
                }
                if(comprobar.size()==0){
                    System.out.println("Cargando Datos");
                    String cargarXML = "EXECUTE sp_CargarXML";
                    PreparedStatement cargar = conexion.prepareStatement(cargarXML);
                    cargar.executeQuery();
                }
                System.out.println("Ya hay datos");
                String user = request.getParameter("user");
                String password = request.getParameter("password");
                if(validacionesSQL.validLogin(user, password)){
                    response.sendRedirect("central.html");
                }
                else{
                    out.println("Usuario no registrado <a href='index.html'>Intente de nuevo</a>");
                }
                }catch(SQLException ex){
                    response.sendRedirect("central.html");
                }  
        %>
        
        
    </body>
</html>
