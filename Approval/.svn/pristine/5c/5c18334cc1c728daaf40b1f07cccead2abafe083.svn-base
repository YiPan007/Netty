package com.mingge.biz.impl;
/**
 * @author Bernie
 *
 * 此类为测试框架类，不作开发用途
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mingge.biz.ZappdataBiz;
import com.mingge.dao.ZappdataDao;
import com.mingge.pojo.Zappdata;


@Service
public class ZappdataBizImpl implements ZappdataBiz {
	@Autowired
	private ZappdataDao zappdataDao;
	@Override
	public List<Zappdata> queryZappdata() {
	
		return zappdataDao.queryZappdata();
	}
	
}
