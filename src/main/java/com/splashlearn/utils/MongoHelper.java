package com.splashlearn.utils;

import com.mongodb.BasicDBObject;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bson.Document;
import org.bson.codecs.configuration.CodecRegistries;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.util.*;

public class MongoHelper {

    public static String uri; 
    private static MongoHelper mongoHelper;
    private MongoClient client;
    private final String database = "automation_service";
    public static String collection;

    private static final Logger logger = LogManager.getLogger(MongoHelper.class);

    public static synchronized MongoHelper getInstance() {
        if(mongoHelper == null)
            mongoHelper = new MongoHelper(uri);
        return mongoHelper;
    }

    public MongoHelper(String uri) {
        try {
            CodecRegistry pojoCodecRegistry = CodecRegistries.fromProviders(PojoCodecProvider.builder().automatic(true).build());
            CodecRegistry codecRegistry = CodecRegistries.fromRegistries(MongoClientSettings.getDefaultCodecRegistry(), pojoCodecRegistry);
            MongoClientSettings settings = MongoClientSettings.builder().
                    applyConnectionString(new ConnectionString(uri)).
                    codecRegistry(codecRegistry).build();
            client = MongoClients.create(settings);
        } catch (Exception e) {
            client = null;
            logger.error("Unable to connect to mongo instance using {}. Got Error: {}", uri, e.getMessage());
        }
    }

    public <T> T query(String q) {
        MongoCollection<Document> c = client.getDatabase(database).getCollection(collection);
        FindIterable<Document> output = (q == null || q.isEmpty()) ? c.find() : c.find(BasicDBObject.parse(q));
        return (T) output;
    }

    public <T> T query() {
        return query("{\"active\": true}");
    }


    /**
     * This methods used single query field and updates mongo document as per data variable
     * @param key field for the query
     * @param value value of the field to be used in query
     * @param data data to be updated
     * @return true or false depending upon the action success
     */
    public boolean update(String key, String value, Map<String, Object> data) {
        if(key.isEmpty() || value.isEmpty() || data == null || data.isEmpty())
            return false;

        Document query = new Document().append(key, value);
        try {
            List<Bson> updates = new ArrayList<>();
            data.forEach((k, v) -> updates.add(Updates.set(k, v)));

            UpdateOptions options = new UpdateOptions().upsert(true);
            client.getDatabase(database).getCollection(collection).updateOne(query, Updates.combine(updates), options);
            logger.debug("Document updated successfully with query {} and data {}", query.toJson(), data);
            return true;
        } catch (MongoException e) {
            logger.error("Unable to update document with query {} and data {}. Got Exception: {} {}",
                    query.toJson(), data, e.getCode(), e);
            logger.error(Arrays.toString(e.getStackTrace()));
        }
        return false;
    }

    public void insert(Map<String, Object> m1) {
        Document document = new Document();
        document.put("_id", new ObjectId());
        document.putAll(m1);
        try {
            client.getDatabase(database).getCollection(collection).insertOne(document);
        } catch (Exception e) {
            logger.error("Unable to insert data {} in mongo. Got Error: {}", m1, e.getMessage());
        }
    }

}
