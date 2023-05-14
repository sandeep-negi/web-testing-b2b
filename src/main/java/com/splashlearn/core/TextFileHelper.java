package com.splashlearn.core;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class TextFileHelper {

    public void createNewFile(String fileName) {
        try {
            File myObj = new File(fileName + ".txt");
            if(!myObj.isFile())
                if (myObj.createNewFile()) {
                    System.out.println("File created: " + myObj.getName());
                } else {
                    System.out.println("File already exists.");
                }
        } catch (IOException e) {
            System.out.println("An error occurred in creating file.");
            e.printStackTrace();
        }
    }

    public void writeToFile(String filename, String text){
        try {
            FileWriter myWriter = new FileWriter(filename + ".txt", true);
            BufferedWriter bw = new BufferedWriter(myWriter);
            bw.write('\n');
            bw.write(text);
            bw.close();
//            myWriter.write( text);
//            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred in writing in file.");
            e.printStackTrace();
        }
    }
}
