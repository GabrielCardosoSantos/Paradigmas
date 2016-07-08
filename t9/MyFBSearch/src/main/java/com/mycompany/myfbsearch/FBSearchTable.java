/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.myfbsearch;

import java.awt.Component;
import java.util.ArrayList;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableModel;
import sun.swing.table.DefaultTableCellHeaderRenderer;

/**
 *
 * @author gcsantos
 */
public class FBSearchTable extends AbstractTableModel {
    
    public static final String[] columnNames = {"#", "Picture", "ID", "Name"};
    private ArrayList<FBSearchUser> users;
    
    public FBSearchTable(){
        users = new ArrayList<FBSearchUser>();
    }
    
    public void add(FBSearchUser u){
        users.add(u);
        fireTableRowsInserted(users.size()-1, users.size()-1);
    }
    
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public String getColumnName(int columnIndex) {
        return columnNames[columnIndex];
    }

    @Override
    public int getRowCount() {
        return users.size();
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch(columnIndex) {
            case 0: return rowIndex+1;
            case 1: return users.get(rowIndex).getImage();
            case 2: return users.get(rowIndex).getID();
            case 3: return users.get(rowIndex).getName();
        }
        return null;
    }
    
}
