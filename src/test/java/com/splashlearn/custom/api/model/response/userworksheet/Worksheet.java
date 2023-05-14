package com.splashlearn.custom.api.model.response.userworksheet;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
@Data
public class Worksheet {
    private int id ;
    private String user_collection_id;
    private int entity_id ;
    private String entity_type ;
    private String created_at ;
}
