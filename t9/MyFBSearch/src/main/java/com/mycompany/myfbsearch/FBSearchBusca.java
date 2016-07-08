/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.types.User;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;

/**
 *
 * @author gabri
 */
public class FBSearchBusca implements Runnable{
    private FBSearchTable table;
    private String token;
    private String name;
    private boolean start;
    private ArrayList<FBSearchUser> users;
    
    public FBSearchBusca (FBSearchTable t, String tk, String name){
        this.table = t;
        this.token = tk;
        this.name = name;
        this.users = new ArrayList<>();
    }
    
    @Override
    public void run() {
        
        FacebookClient client = new DefaultFacebookClient(token, Version.LATEST);

        Connection<User> nomes = client.fetchConnection("search", User.class, Parameter.with("q", name),
                Parameter.with("type", "user"), Parameter.with("limit", 5000));

        List<User> aux= nomes.getData();
        for(User u : aux){
            if (start){
                if (u.getName().contains(name)){
                    FBSearchUser novo = new FBSearchUser(u.getName(), u.getId(),
                                new ImageIcon(new URL("http://graph.facebook.com/" + u.getId() + "/picture?type=large")));
                    users.add(novo);
                    table.add(novo);
                }
            }else {
                break;
            }
        }
        
    }
    
    public void salva() throws IOException{
        if(users != null){
            for(FBSearchUser u : users){
                ImageIO.write((RenderedImage) u.getImage(), "png", new File(u.getName() + ".png"));
            }
        }
    }
    
    public void setToken(String s){
        this.token = s;
    }
    
    public void setName(String s){
        this.name = s;
    }
    
    public void setStart(boolean b){
        this.start = b;
    }
    
    public FBSearchUser getUser(){
        return this.users.get(0);
    }
}

