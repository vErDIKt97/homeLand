package com.example.homeland.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "list")
public class ListProd {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<ListItem> listProdItems;

    private String listName;

    @ManyToOne(fetch = FetchType.EAGER)
    private User author;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public List<ListItem> getListItems() {
        return listProdItems;
    }

    public void setListItems(List<ListItem> listProdItems) {
        this.listProdItems = listProdItems;
    }

}
