import accesodato.Coneccion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Usuario;

@WebServlet(urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

          protected void processRequest(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out = response.getWriter()) {
             //ESTA PARTE VA NUESTRO CODIGO
             Usuario usuario = new Usuario();
             String eliminar=request.getParameter("eliminar");
             if(eliminar!=null){
                 int eliminar_id=Integer.parseInt(eliminar);
                 usuario.setUsuario_id(eliminar_id);
                 response.sendRedirect("usuarios/index.jsp");
                 usuario.eliminarUsuario();
                 
             }else{
                 String nombre=request.getParameter("nombre");
                 String apepat=request.getParameter("apepat");
                 String apemat=request.getParameter("apemat");
                 int ciudad_id=Integer.parseInt(request.getParameter("ciudad_id"));
                 
                 
                 usuario.setNombre(nombre);
                 usuario.setApepat(apepat);
                 usuario.setApemat(apemat);
                 usuario.setCiudad_id(ciudad_id);
                 usuario.crearUsuario();
                 
                 
                 response.sendRedirect("usuarios/index.jsp");
                 
             }
                 
         }
     
           
        }
          // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    }