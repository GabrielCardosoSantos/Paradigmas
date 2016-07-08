/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import javax.swing.SwingUtilities;

/**
 *
 * @author gcsantos
 */
public abstract class FBSearchMain implements Runnable{
    
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new FormFBSearch().setVisible(true);
        });
    }
}
