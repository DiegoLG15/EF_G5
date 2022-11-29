package com.example.ef_g5.Daos;

import com.example.ef_g5.Beans.Servicios;
import com.example.ef_g5.Beans.TipoServicios;

import java.sql.*;
import java.util.ArrayList;

public class DaoServicios extends DaoBase{

    public ArrayList<Servicios> listarServiciosPorUsuario(int idUsuario) {
        ArrayList<Servicios> listaServicios = new ArrayList<>();

        String sql = "SELECT * FROM servicios s\n" +
                "left join usuarios u on (u.idUsuario = s.idUsuario) \n" +
                "left join tipo t on (t.idTipo = u.idTipo)\n" +
                "left join tiposervicios ts on (ts.idTipoServicios = s.idTipoServicios)\n" +
                "where u.idUsuario = ? and s.borradologico = 1;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Servicios servicio = new Servicios();
                    servicio.setIdServicios(rs.getInt(1));



                    TipoServicios tipoServicios = new TipoServicios();
                    tipoServicios.setIdTipoServicios(rs.getInt(2));
                    tipoServicios.setNombreServicio(rs.getString("ts.nombreServicio"));
                    servicio.setTipoServicios(tipoServicios);


                    listaServicios.add(servicio);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }


        return listaServicios;
    }


}
