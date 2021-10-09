package com.example.homeland.repos;

import com.example.homeland.domain.ListProd;
import org.springframework.data.repository.CrudRepository;

public interface ListProdRepo extends CrudRepository<ListProd, Long> {
       //поиска листа по ID
       ListProd findById (long id);
}
