package com.example.homeland.controller;


import com.example.homeland.domain.ListItem;
import com.example.homeland.domain.ListProd;
import com.example.homeland.repos.ListProdRepo;
import com.example.homeland.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Map;

@Controller
public class ListController {
    private final UserRepo userRepo;
    private final ListProdRepo listProdRepo;

    public ListController(ListProdRepo listProdRepo, UserRepo userRepo) {
        this.listProdRepo = listProdRepo;
        this.userRepo = userRepo;
    }

    @GetMapping("/createList")
    public String createListForm(Model model) {
        model.addAttribute("list", new ListProd());
        return "createList";
    }

    @PostMapping("/createList")
    public String createListSubmit(@RequestParam ArrayList<String> prodName,
                                   @RequestParam ArrayList<Integer> countRec,
                                   @RequestParam String listName,
                                   Map<String, Object> model) {
        ListProd listProd = new ListProd();
        listProd.setListItems(new ArrayList<>());
        listProd.setListName(listName);
        for (int i = 0; i < prodName.size(); i++) {
            ListItem listItem = new ListItem(prodName.get(i), countRec.get(i), listProd);
            listProd.getListItems().add(listItem);
        }
        listProdRepo.save(listProd);
        Iterable<ListProd> lists = listProdRepo.findAll();

        model.put("lists", lists);
        return "list";
    }

    @GetMapping("/list")
    public String listForm(Map<String, Object> model) {
        Iterable<ListProd> lists = listProdRepo.findAll();

        model.put("lists", lists);
        return "list";
    }

    @GetMapping("/list/listProd")
    public String listProdForm(@RequestParam long id,
                               Model model) {
        model.addAttribute("list", listProdRepo.findById(id));
        return "listProd";
    }

    @PostMapping("/listSave")
    public String listProdSave(@RequestParam long listProdID,
                               @RequestParam ArrayList<Integer> number,
                               @RequestParam ArrayList<Integer> countCur,
                               Map<String, Object> model) {
        ListProd listProd = listProdRepo.findById(listProdID);
        for (int i = 0; i < number.size(); i++) {
            for (ListItem listItem :
                    listProd.getListItems()) {
                if (listItem.getNumber() == number.get(i))
                    listItem.setCountCur(countCur.get(i));
            }
        }
        listProdRepo.save(listProd);
        Iterable<ListProd> lists = listProdRepo.findAll();
        model.put("lists", lists);
        return "list";
    }

    @GetMapping("/listRemove")
    public String listProdRemove (@RequestParam long listProdID,
                                  Map<String, Object> model) {
        System.out.println(listProdID);
        listProdRepo.delete(listProdRepo.findById(listProdID));
        Iterable<ListProd> lists = listProdRepo.findAll();
        model.put("lists", lists);
        return "list";
    }
}
