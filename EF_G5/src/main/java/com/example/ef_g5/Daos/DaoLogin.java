package com.example.ef_g5.Daos;

import com.example.ef_g5.Beans.Tipo;
import com.example.ef_g5.Beans.Usuario;

import java.sql.*;
public class DaoLogin extends DaoBase{
    public Usuario buscarUsuario(String correo, String password) {

        Usuario credencialUsuario = null;


        try(Connection conn = getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM finaliweb_g5.usuarios WHERE correo= ? and password= sha2(?,512);")){

            pstm.setString(1, correo);
            pstm.setString(2,password);
            try (ResultSet rs = pstm.executeQuery();){
                if(rs.next()){
                    credencialUsuario = new Usuario();
                    credencialUsuario.setIdUsuario(rs.getInt(1));
                    credencialUsuario.setNombre(rs.getString(2));

                    Tipo tipo = new Tipo();
                    tipo.setIdTipo(rs.getInt("idTipo"));
                    credencialUsuario.setTipo(tipo);
                }
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return credencialUsuario;
    }
    public void createCredentialCliente(Usuario usuario, String password) {

        String sql = "insert into finaliweb_g5.usuarios (nombre, correo, password,idTipo)" +
                "values (?, ?, sha2(?,512),?);";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuario.getIdUsuario());
            pstmt.setString(2, usuario.getCorreo());
            pstmt.setString(3,password);

            Tipo tipo = new Tipo();
            pstmt.setInt(4, tipo.getIdTipo());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
