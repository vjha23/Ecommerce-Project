/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecom.helper;

/**
 *
 * @author Vijay Jha
 */
public class Helper {
    public static String get10Words(String desc)
    {
       String[] str=desc.split(" ");
       if(str.length>10)
       {
           String res="";
           for(int i=0;i<10;i++){
               res=res+str[i] + " ";
               
           }
           return (res + "..." );
       }else{
           return (desc+ "...");
       }
    }
}
