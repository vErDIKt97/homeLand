package com.example.homeland.domain;

import javax.persistence.*;

import static javax.persistence.CascadeType.*;

@Entity
public class ListItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int number;

    private String itemName;
    private int countRec;
    private int countCur;

    @ManyToOne (fetch = FetchType.EAGER,cascade = {DETACH,MERGE,PERSIST,REFRESH})
    private ListProd listProdName;

    public ListItem (String itemName, int countRec, ListProd listProdName) {
        this.itemName = itemName;
        this.countRec = countRec;
        this.countCur = 0;
        this.listProdName = listProdName;
    }

    public ListItem() {

    }

    public long getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getCountRec() {
        return countRec;
    }

    public void setCountRec(int countRec) {
        this.countRec = countRec;
    }

    public int getCountCur() {
        return countCur;
    }

    public void setCountCur(int countCur) {
        this.countCur = countCur;
    }

    public ListProd getListName() {
        return listProdName;
    }

    public void setListName(ListProd listProdName) {
        this.listProdName = listProdName;
    }
}
