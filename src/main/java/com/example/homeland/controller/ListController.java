package com.example.homeland.controller;


import com.example.homeland.domain.ListItem;
import com.example.homeland.domain.ListProd;
import com.example.homeland.repos.ListProdRepo;
import com.example.homeland.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Controller
public class ListController {
    private final UserRepo userRepo;
    private final ListProdRepo listProdRepo;

    public ListController(ListProdRepo listProdRepo, UserRepo userRepo) {
        this.listProdRepo = listProdRepo;
        this.userRepo = userRepo;
    }

    //Переход на страницу создания нового списка
    @GetMapping("/createList")
    public String createListForm(Model model) {
        model.addAttribute("list", new ListProd()); //Отправляем на страницу новый ListProd.
        return "createList";
    }

    //Создание нового списка
    @PostMapping("/createList")
    public String createListSubmit(@RequestParam ArrayList<String> prodName,
                                   @RequestParam ArrayList<Integer> countRec,
                                   @RequestParam String listName,
                                   Map<String, Object> model) {
        ListProd listProd = new ListProd(); //Создаем новый список
        listProd.setListItems(new ArrayList<>()); //Задаем список пунктов списка
        listProd.setListName(listName); //Задаем имя списка
        //Для каждого пункта заполняем пункты списка
        for (int i = 0; i < prodName.size(); i++) {
            if ((prodName.get(i) != null) | (countRec.get(i) != null)) {
                ListItem listItem = new ListItem(prodName.get(i), countRec.get(i), listProd);
                listProd.getListItems().add(listItem);
            }
        }
        //Сохраняем созданный список
        listProdRepo.save(listProd);

        //Находим все списки и возвращаем пользователя на страницу списков
        Iterable<ListProd> lists = listProdRepo.findAll();

        model.put("lists", lists);
        return "list";
    }

    //Переход на страницу списков
    @GetMapping("/list")
    public String listForm(Map<String, Object> model) {
        Iterable<ListProd> lists = listProdRepo.findAll();
        //передаем списки если есть, в противном случае говорим что их нету
        if (listsExist(lists))
            model.put("lists", lists);
        else model.put("message", "Нет ни одного списка");
        return "list";
    }

    //Переход к редактированию или заполнению списка
    @GetMapping("/list/listProd")
    public String listProdForm(@RequestParam long id,
                               String edit,
                               Model model) {
        model.addAttribute("list", listProdRepo.findById(id));
        if (edit != null)
            return "listEdit";
        return "listProd";
    }

    //Заполнение списка
    @PostMapping("/listSave")
    public String listProdSave(@RequestParam long listProdID,
                               @RequestParam ArrayList<Integer> number,
                               @RequestParam ArrayList<Integer> countCur,
                               Map<String, Object> model) {
        ListProd listProd = listProdRepo.findById(listProdID);
        for (int i = 0; i < number.size(); i++) {
            for (ListItem listItem :
                    listProd.getListItems()) {
                if (listItem.getNumber() == number.get(i)) {
                    listItem.setCountCur(countCur.get(i));
                    break;
                }
            }
        }
        listProdRepo.save(listProd);
        Iterable<ListProd> lists = listProdRepo.findAll();
        model.put("lists", lists);
        return "list";
    }

    //Редактирование списка
    @PostMapping("/listSave/{list}")
    public String listSaveAftEdit(@PathVariable ListProd list,
                                  @RequestParam String listName,
                                  @RequestParam ArrayList<String> prodName,
                                  @RequestParam ArrayList<Integer> countRec,
                                  @RequestParam ArrayList<Integer> countCur,
                                  @RequestParam ArrayList<Integer> number,
                                  Map<String, Object> model) {
        list.setListName(listName);
        //Изменяем уже занесенные позиции
        for (int i = 0; i < number.size(); i++) {
            for (ListItem listItem :
                    list.getListItems()) {
                if (listItem.getNumber() == number.get(i)) {
                    listItem.setItemName(prodName.get(i));
                    listItem.setCountRec(countRec.get(i));
                    listItem.setCountCur(countCur.get(i));
                    break;
                }
            }
        }
        //Если кол-во полученных строк элементов списка больше текущего, то добавляем новые строки
        for (int i = number.size(); i < prodName.size(); i++) {
            if ((prodName.get(i) != null) | (countRec.get(i) != null)) {
                ListItem listItem = new ListItem(prodName.get(i), countRec.get(i), list);
                list.getListItems().add(listItem);
            }
        }
        //Сохраняем изменения
        listProdRepo.save(list);

        //Передаем клиенту все списки и возвращаем на страницу их просмотра
        Iterable<ListProd> lists = listProdRepo.findAll();
        model.put("lists", lists);
        return "list";
    }

    //Удаление списка
    @GetMapping("/listRemove")
    public String listProdRemove(@RequestParam long listProdID,
                                 Map<String, Object> model) {
        listProdRepo.delete(listProdRepo.findById(listProdID));
        Iterable<ListProd> lists = listProdRepo.findAll();
        if (listsExist(lists))
            model.put("lists", lists);
        else model.put("message", "Нет ни одного списка");
        return "list";
    }

    private boolean listsExist(Iterable<ListProd> iterable) {
        return ((Collection<?>) iterable).size() != 0;
    }
}
