package com.splashlearn.custom.entity.operations;

import com.splashlearn.context.EntityContext;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class KlassOperations {

    private final EntityContext entityContext;
    public KlassOperations(EntityContext entityContext){
        this.entityContext = entityContext;
    }

}
