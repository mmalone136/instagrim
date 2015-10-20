/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.IOException;
import static java.lang.System.out;
import java.util.Arrays;
import java.util.Set;
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
@WebServlet(name="Search", urlPatterns = {"/search","/search/*"})
public class Search extends HttpServlet{
    Cluster cluster;
    
    

    @Override
        public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
        
        
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
         
        String target;
        target = (String) request.getParameter("target");
        out.println("-------------" + target);
        
        
        //target = "adminstuff";
//Set<String> email = null; 
        
        
        String first_name = ""; 
        String last_name ="";
        out.println(target);
        out.println("----------------Started to get things--------------");
            
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login,first_name,last_name FROM userprofiles WHERE login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        target));
        
        if (rs.isExhausted()) {
            out.println("this has been failed - search get | " + target);
            request.setAttribute("found","NO");
        }else{
                for (Row row : rs){
                    first_name = row.getString("first_name");
                    last_name = row.getString("last_name");  
                   } 
                
                request.setAttribute("found","YES"); 
                request.setAttribute("first_name",first_name);
                request.setAttribute("last_name",last_name);
                //request.setAttribute("email",x);
               }
        request.setAttribute("username",target);
    RequestDispatcher rd = request.getRequestDispatcher("/SearchResults.jsp");   
    rd.forward(request, response);

    }  
        
        
        
        
}






