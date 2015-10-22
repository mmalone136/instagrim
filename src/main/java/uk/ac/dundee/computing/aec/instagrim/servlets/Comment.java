/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.Session;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Date;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;

/**
 *
 * @author Matt
 */
@WebServlet(name = "Comment", urlPatterns = {"/comment/", "/comment/*"})
//@WebServlet(name = "Comment")
public class Comment extends HttpServlet {

    private Cluster cluster;

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Comment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Comment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);

        String comment = (String) request.getParameter("comment");

        out.println("COMMENT | " + comment);
        String userleft = (String) request.getParameter("user");
        out.println("USERLEFT | " + userleft);
        String picid = (String) request.getParameter("picid");
        out.println("PICID | " + picid);
        UUID pic = UUID.fromString(picid);
        out.println("PID-UUID | " + pic);

        if (comment != "") {
            Session session = cluster.connect("instagrim");

            out.println("STARTING TO DO THE THINGS ABOUT STUFF");

            PreparedStatement ps = session.prepare("insert into comments (timeleft,picid,comment,userleft) values(?,?,?,?)");
            BoundStatement bs = new BoundStatement(ps);

            Date DateAdded = new Date();
            out.println("DATE | " + DateAdded);

            //UUID timeadded = UUID.fromString(DateAdded); 
            out.println("ABOUT TO DO THE THINGS OF POSTING AND SUCH");
            session.execute(bs.bind(DateAdded, pic, comment, userleft));

            out.println("DONE THE THINGS OF POSTING AND SUCH");

            session.close();
        }
        request.setAttribute("pic", picid);
        out.println("PICID | " + picid);
        //RequestDispatcher rd = request.getRequestDispatcher("../picture/" + picid);
        //RequestDispatcher rd = request.getRequestDispatcher("/SinglePic.jsp");

        RequestDispatcher rd = request.getRequestDispatcher("picture");
        rd.forward(request, response);

        //RequestDispatcher dispatcher = request.getRequestDispatcher("/picture");
        //dispatcher.forward(request, response);
        //RequestDispatcher rd;
        // rd = response.sendRedirect("../picture/" + picid);
        //rd.forward(request, response);
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
