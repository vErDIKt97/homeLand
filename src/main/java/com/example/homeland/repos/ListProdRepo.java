package com.example.homeland.repos;

import com.example.homeland.domain.ListProd;
import org.springframework.data.repository.CrudRepository;

public interface ListProdRepo extends CrudRepository<ListProd, Long> {
       ListProd findById (long id);
}
