/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecom.dao;

import com.ecom.entities.category;
import java.sql.*;
import java.util.ArrayList;
public class CategoryDao {
    private Connection con;
    public CategoryDao(Connection con)
    {
        this.con=con;
    }
    public boolean saveCategory(category cat){
        boolean flag=false;
        try{
            String query="insert into category(categoryTitle,categoryDesc) values(?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, cat.getCategoryTitle());
            ps.setString(2,cat.getCategoryDesc());
            ps.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
       return flag;
    }
    
    public ArrayList<category> getCategory(){
        ArrayList<category>list=new ArrayList<>();
        try{
            String query="select * from category";
            Statement st=this.con.createStatement();
           ResultSet rs = st.executeQuery(query);
           while(rs.next())
           {
               int id=rs.getInt(1);
               String catname=rs.getString(2);
               String catdesc=rs.getString(3);
               category cat=new category(id,catname,catdesc);
               list.add(cat);
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public category getCategoryById(int cid)
    {
        category cat=null;
        try{
            String query="select * from category where categoryId="+cid;
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
                int id=rs.getInt(1);
                String catname=rs.getString(2);
                String catdesc=rs.getString(3);
               cat =new category();
               cat.setCategoryId(id);
               cat.setCategoryTitle(catname);
               cat.setCategoryDesc(catdesc);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return cat;
    }
}
