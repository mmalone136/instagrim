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
import java.util.ArrayList;
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
@WebServlet(name = "Search", urlPatterns = {"/search", "/search/*"})
public class Search extends HttpServlet {

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

        ArrayList<String[]> list = new ArrayList<String[]>();

        //target = "adminstuff";
        //Set<String> email = null; 
        String first_name = "";
        String last_name = "";
        out.println(target);
        out.println("----------------Started to get things--------------");

        if (target != "") {

            Session session = cluster.connect("instagrim");
            PreparedStatement ps = session.prepare("select * FROM userprofiles");
            ResultSet rs = null;
            BoundStatement boundStatement = new BoundStatement(ps);
            rs = session.execute(boundStatement);

            if (rs.isExhausted()) {
                out.println("this has been failed - search get | " + target);
                request.setAttribute("found", "NO");
            } else {

                for (Row row : rs) {

                    String check = row.getString("login");
                    out.println("CHECK | " + check);

                    if (check.contains(target)) {
                        String[] dataToPass = new String[3];
                        for (int i = 0; i < 3; i++) {
                            dataToPass[i] = "";
                        }

                        dataToPass[0] = check;
                        //out.println("0"); 
                        out.println(dataToPass[0]);
                        dataToPass[1] = row.getString("first_name");
                        dataToPass[2] = row.getString("last_name");
                        out.println(dataToPass[0] + " | " + dataToPass[1] + " | " + dataToPass[2]);
                        list.add(dataToPass);
                        String[] str = dataToPass;
                    }
                }

                request.setAttribute("found", "YES");
                request.setAttribute("list", list);
                //request.setAttribute("first_name", first_name);//request.setAttribute("last_name", last_name);//request.setAttribute("email",x);

                /*
                 for (int i = 0; i < list.size(); i++) {
                 String[] str = list.get(i);
                 for (int j = 0; j < 3; j++) {
                 out.println("More things::::::: " + str[j]);
                 }
                 }*/
            }
        } else {
            out.println("-----EMPTAH THINGS-------");
            request.setAttribute("found", "NO");
        }

        request.setAttribute("username", target);
        RequestDispatcher rd = request.getRequestDispatcher("/SearchResults.jsp");
        rd.forward(request, response);

    }

}
