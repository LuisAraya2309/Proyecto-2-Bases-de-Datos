
package validaciones;

import connection.conexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class validacionesSQL {
    
     public static boolean validLogin(String user,String password){
            try{ 
                conexionBD conection = new conexionBD();
                Connection conexion = conection.getConexion();
                String callSP = "EXECUTE sp_ListarUsuarios";
                PreparedStatement ps = conexion.prepareStatement(callSP);
                ResultSet dataset = ps.executeQuery();
                HashMap<String, String> usuarios = new HashMap<>();
                while(dataset.next()){
                   usuarios.put(dataset.getString("username"),dataset.getString("password"));
                }
                if(usuarios.containsKey(user)){
                    return usuarios.get(user).equals(password);
                }
                else{
                    return false;
                }

            }catch(SQLException ex){
               return false;
            } 
    }
}
