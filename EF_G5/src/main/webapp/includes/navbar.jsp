<%@ page import="com.example.lab10_iweb.Beans.Credentianls" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="#">Cliente</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item" >
        <a class="nav-link" href="<%=request.getContextPath()%>/ClienteServlet?action=datos">Mis datos</a>
      </li>
      <li class="nav-item" >
        <a class="nav-link" href="<%=request.getContextPath()%>/ClienteServlet?action=contratos">Mis contratos</a>
      </li>
      <li class="nav-item" >
        <a class="nav-link" href="<%=request.getContextPath()%>/ClienteServlet?action=estado">Contratos por estado</a>
      </li>
      <li class="nav-item" >
        <a class="nav-link" href="<%=request.getContextPath()%>/ClienteServlet?action=loss">Expected Loss</a>
      </li>
      <% if (session.getAttribute("usuarioLogueado") == null){%>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/ServletLogin">(Iniciar sesión)</a>
      </li>
      <% } else { %>
      <%Credentianls credentianls = (Credentianls) session.getAttribute("usuarioLogueado");%>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/ServletLogin?action=logout"><%=credentianls.getNumeroDocumento()%>(Cerrar sesión)</a>
      </li>
      <% }%>
    </ul>
  </div>
</nav>
