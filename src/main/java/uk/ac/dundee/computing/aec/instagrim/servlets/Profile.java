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
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;
import uk.ac.dundee.computing.aec.instagrim.models.User;



import com.datastax.driver.core.Cluster;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Arrays;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Matt
 */

//
@WebServlet(name="Profile", urlPatterns = {"/profile","/profile/*"})

//@WebServlet(name = "Register", urlPatterns = {"/Register"})

public class Profile extends HttpServlet{
    Cluster cluster;
    
   
    @Override
        public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    
    
    }
    
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String Username = "adminstuff";
        Set<String> email = null; 
        String first_name = ""; 
        String last_name ="";
            
            
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select first_name,last_name,email FROM userprofiles WHERE login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        Username));
        
        if (rs.isExhausted()) {
            out.println("this has been failed");
        }else{
                for (Row row : rs){
                    first_name = row.getString("first_name");
                    last_name = row.getString("last_name");
                    email = row.getSet("email", String.class);
                   } 
                
                String [] newEmail = email.toArray(new String[email.size()]);
                String x = Arrays.toString(newEmail);
                
                int len = (x.length()-1);
                x=x.substring(1,len);
                
                request.setAttribute("first_name",first_name);
                request.setAttribute("last_name",last_name);
                request.setAttribute("email",x);
               }
        
    RequestDispatcher rd = request.getRequestDispatcher("/UserProfile.jsp");   
    rd.forward(request, response);

    }
    
    
        private void displayUserData(String Username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Username = "adminstuff";
        String email = ""; 
        String first_name = ""; 
        String last_name ="";
            
            
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select first_name,last_name,email FROM userprofiles WHERE login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        Username));
        
        if (rs.isExhausted()) {
            out.println("this has been failed you shite");
        }else{
                for (Row row : rs){
                    first_name = row.getString("first_name");
                    last_name = row.getString("last_name");
                   } 
                
                request.setAttribute("first_name",first_name);
                request.setAttribute("last_name",last_name);
               }
        
    }      

} 

