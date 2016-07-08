/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import javax.swing.ImageIcon;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author gabri
 */
public class JTableRender extends DefaultTableCellRenderer{
    @Override
    protected void setValue(Object value){
        if(value instanceof ImageIcon){
            if(value != null){
                ImageIcon image = (ImageIcon) value;
                setIcon(image);
            }else{
                setText("");
                setIcon(null);
            }
        }else{
            super.setValue(value);
        }
    }
    
}
