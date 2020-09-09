package com.ecom.dao;

import com.ecom.entities.User;
import java.sql.*;
public class UserDao {
   private Connection con;
    public UserDao(Connection con){
        this.con=con;
    }
    public boolean saveUser(User user){
        boolean flag=false;
        try{
            String query="insert into users(userName,userEmail,userPassword,userPhone,userPic,userAddress,userType) values(?,?,?,?,?,?,?)";
            PreparedStatement ps= this.con.prepareStatement(query);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getUserEmail());
            ps.setString(3, user.getUserPassword());
            ps.setString(4, user.getUserPhone());
            ps.setString(5, user.getUserPic());
            ps.setString(6, user.getUserAddress());
            ps.setString(7, user.getUserType());
            ps.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public User getUserByEmailandPassword(String email,String pass)
    {
        User user=null;
        try{
           String query="select * from users where userEmail=? and userPassword=? ";
           PreparedStatement ps=this.con.prepareStatement(query);
           ps.setString(1, email);
           ps.setString(2, pass);
           ResultSet rst=ps.executeQuery();
           if(rst.next())
           {
               user=new User();
               user.setUserId(rst.getInt(1));
               user.setUserName(rst.getString(2));
               user.setUserEmail(rst.getString(3));
               user.setUserPassword(rst.getString(4));
               user.setUserPhone(rst.getString(5));
               user.setUserPic(rst.getString(6));
               user.setUserAddress(rst.getString(7));
               user.setUserType(rst.getString(8));
               
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}

