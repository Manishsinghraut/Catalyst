package com.lucernex.qa.data;

public class FolderNameField  {
    private String folderName;


    public String getFolderName() {
        return folderName;
    }

    public void setFolderName(String folderName) {
        this.folderName= folderName;
    }

    @Override
    public String toString() {
        return "Field{" +
                "folderName='" + folderName + '\'' +
                '}';
    }

    public FolderNameField(String folderName) {
        this.folderName = folderName;
    }

    public FolderNameField() {
    }
}

