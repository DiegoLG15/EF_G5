package com.example.ef_g5.Controllers;

import com.example.ef_g5.Beans.Usuario;
import com.example.ef_g5.Daos.DaoLogin;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SessionServlet", value = "/SessionServlet")
public class SessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ?
                "loginform" : request.getParameter("action");

        RequestDispatcher view;

        switch(action){
            case "loginform":
                view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.removeAttribute("usuarioLogueado");
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String correo = request.getParameter("username");
        String password = request.getParameter("password");
        DaoLogin loginDao = new DaoLogin();

        Usuario crendencial = loginDao.buscarUsuario(correo,password);
        HttpSession session = request.getSession();


        if(crendencial != null){
            if(crendencial.getTipo().getIdTipo()==null){
                response.sendRedirect(request.getContextPath() + "/ServletAdmin");
            } else {
                response.sendRedirect(request.getContextPath() + "/ClienteServlet");
            }

        } else {
            session.setAttribute("msg","Datos erroneos");
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request,response);
        }
    }
}
