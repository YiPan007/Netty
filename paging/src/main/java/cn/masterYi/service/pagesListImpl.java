package cn.masterYi.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import cn.masterYi.entity.pageList;

@Service("pageList")
public class pagesListImpl implements pagesList {
	List<pageList> pageing;
	public List<pageList> listpage(int pagenum) {
		pageing = new ArrayList<pageList>();
		List<pageList> pageings = new ArrayList<pageList>();
		System.out.println("123eerr");
		for (int i = 1; i <60; i++) {
			pageing.add(new pageList("A000"+i,"A0000"+i,"采购付款","待审批","高**","2017-07-20"));
		}
		if((pageing.size()-pagenum*3)>0){
		for(int i=(pagenum-1)*3;i<pagenum*3;i++){
			pageings.add(pageing.get(i));
		}
		return pageings;
		}else{
			for(int i=(pagenum-1)*3;i<pageing.size();i++){
				pageings.add(pageing.get(i));
			}	
		}
	
		return pageings;
	}

	public int pagenum() {
		
		return pageing.size();
	}
	
}
