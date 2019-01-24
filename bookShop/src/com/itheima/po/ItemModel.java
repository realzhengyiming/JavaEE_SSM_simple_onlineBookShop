package com.itheima.po;

import java.util.List;

//接受表单多数据提交
public class ItemModel {
	    private List<Items> items;
		public List<Items> getItems() {
			return items;
		}
		public void setItems(List<Items> items) {
			this.items = items;
		}
		public ItemModel(List<Items> items) {
	        super();
	        this.items = items;
	    }
	    public ItemModel() {
	        super();
	    }

	}