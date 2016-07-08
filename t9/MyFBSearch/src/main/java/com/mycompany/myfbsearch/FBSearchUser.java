/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import com.restfb.types.User;
import java.net.MalformedURLException;
import java.net.URL;
import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 *
 * @author gcsantos
 */
public class FBSearchUser{
    
    private ImageIcon picture;
    private String name;
    private String id;
    
    
    public FBSearchUser(String s, String id, ImageIcon i){
        this.name = s;
        this.id = id;
        this.picture = i;
    }
    
    public ImageIcon getImage(){
        return this.picture;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getID(){
        return this.id;
    }
    
}