<%@page import="accesodato.Coneccion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">
        <title>Starter Template for Bootstrap</title>
        <link href="../template/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Project JAVAEE</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="../index.jsp">Inicio</a></li>
                        <li><a href="../usuarios/index.jsp">Usuarios</a></li>
                        <li><a href="../ciudades/index.jsp">Ciudades</a></li>
                        <li><a href="../reportes/index.jsp">Reportes</a></li>
                        
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <br><br><br>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Listar Ciudades</h3>
                    </div>
                    <div class="panel-body">
                        <a href="crear.jsp" class="btn btn-primary">NUEVA CIUDAD</a>
                        <br><br>
                        <table class="table table-condensed table-hover table-bordered">
                            <thead>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>Acciones</th>
                            </thead>
                            <tbody>
                                <%      
                                      Coneccion con=new Coneccion();
                                   con.setConsulta("select * from Ciudades where estado='activo'");
                                   while(con.getResultado().next()){
                                    out.println("<tr>");
                                       out.println("<td>"+con.getResultado().getString("ciudad_id")+"</td>");
                                       out.println("<td>"+con.getResultado().getString("nombre")+"</td>");
                                       out.println("<td>"+"<a href='../ServletCiudad?eliminar="+con.getResultado().getString("ciudad_id")+"' class='btn btn-danger'>Eliminar</a>"+"</td>");
                                       out.println("<td>"+"<a href='../editar.jsp?editar="+con.getResultado().getString("ciudad_id")+"' class='btn btn-danger'>Eliminar</a>"+"</td>");
                                       
                                    out.println("</tr>");
                                   }
                                  
                                %>
                            </tbody>
                            
                        </table>
                        <a href="../index.jsp"class="btn btn-danger">Volver</a>
                        
                        
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../template/js/bootstrap.min.js"></script>

    </body>
</html>
