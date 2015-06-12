package com.zygl.dao.login.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;


public class TestMain {
    public static void main(String[] args) {
        /*Map<String, String> map=new HashMap<String, String>();
		map.put("A", "a");
		map.put("B", "b");
		map.put("C", "c");
		Iterator<Entry<String, String>> iterator=map.entrySet().iterator();
		Entry<String, String> entry;
		while(iterator.hasNext()){
			entry=iterator.next();
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
		}*/
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < 5; i++) {
            model model = new model();
            model.setKey("key");
            model.setValue("123");
            model.setCriteria("=:");
        }
        for (int j = 0; j < list.size(); j++) {
            String hql = "";
        }
    }
}

class model {
    private String key;
    private String value;
    private String criteria;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public model() {

    }
}
