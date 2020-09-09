/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecom.dao;

import com.ecom.entities.category;
import com.ecom.entities.product;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Vijay Jha
 */
public class ProductDao {
      private Connection con;
    public ProductDao(Connection con){
        this.con=con;
    }
    
    public boolean saveProducts(product prd)
    {
        boolean flag=false;
        try{
            String query="insert into product (ptitle,pdesc,pPhoto,pPrice,pDiscount,pQuantity,cid) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1,prd.getPtitle());
            ps.setString(2, prd.getPdesc());
            ps.setString(3,prd.getpPhoto());
            ps.setInt(4, prd.getpPrice());
            ps.setInt(5, prd.getpDiscount());
            ps.setInt(6,prd.getpQuantity());
            category cat=prd.getCategory();
            ps.setInt(7, cat.getCategoryId());
            ps.executeUpdate();
            flag=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    
    public ArrayList<product> getProducts()
    {
        ArrayList<product>list=new ArrayList<product>();
        try{
            String query="select * from product";
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                int id=rs.getInt(1);
                String title=rs.getString(2);
                String desc=rs.getString(3);
                String pPhoto=rs.getString(4);
                int price=rs.getInt(5);
                int discount=rs.getInt(6);
                int quantity=rs.getInt(7);
                int cid=rs.getInt(8);
                product prod=new product();
                prod.setPid(id);
                prod.setPtitle(title);
                prod.setPdesc(desc);
                prod.setpPhoto(pPhoto);
                prod.setpPrice(price);
                prod.setpDiscount(discount);
                prod.setpQuantity(quantity);
                CategoryDao dao=new CategoryDao(this.con);
                category cat=dao.getCategoryById(cid);
                prod.setCategory(cat);
                list.add(prod);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<product> getAllProductById(int cid)
    {
        ArrayList<product>list=new ArrayList<product>();
        try{
            String query="select * from product where cid="+cid;
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                 int id=rs.getInt(1);
                String title=rs.getString(2);
                String desc=rs.getString(3);
                String pPhoto=rs.getString(4);
                int price=rs.getInt(5);
                int discount=rs.getInt(6);
                int quantity=rs.getInt(7);
                int c_id=rs.getInt(8); 
                product prod=new product();
                prod.setPid(id);
                prod.setPtitle(title);
                prod.setPdesc(desc);
                prod.setpPhoto(pPhoto);
                prod.setpPrice(price);
                prod.setpDiscount(discount);
                prod.setpQuantity(quantity);
                CategoryDao dao=new CategoryDao(this.con);
                category cat=dao.getCategoryById(c_id);
                prod.setCategory(cat);
                list.add(prod);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
