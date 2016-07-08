/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import com.restfb.FacebookClient;
import java.io.IOException;

/**
 *
 * @author gcsantos
 */
public class FBSearchController {
    private FormFBSearch form;
    private FBSearchTable table;
    private FBSearchBusca busca;
    private Thread t;

    public FBSearchController(FormFBSearch f, FBSearchTable t) {
        this.form = f;
        this.table = t;
        this.busca = new FBSearchBusca(table, form.getToken().getText(), form.getUser().getText());
    }
    
    public void start() throws InterruptedException {
        this.busca.setToken(form.getToken().getText());
        this.busca.setName(form.getUser().getText());
        this.busca.setStart(true);
        
        this.t = new Thread(busca);
        t.start();
    }
    
    public void cancel(){
        this.busca.setStart(false);
    }
    
    public void salvar() throws IOException{
        //form.getLabel().setIcon(busca.getUser().getImage());
        this.busca.salva();
    }
}
