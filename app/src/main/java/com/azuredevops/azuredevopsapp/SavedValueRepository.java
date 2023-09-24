package com.azuredevops.azuredevopsapp;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "value", path = "value")
public interface SavedValueRepository extends PagingAndSortingRepository<SavedValue, Long>, CrudRepository<SavedValue,Long> {

	List<SavedValue> findByValue(@Param("value") String value);

}