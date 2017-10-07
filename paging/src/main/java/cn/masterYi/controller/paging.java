package cn.masterYi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;

import cn.masterYi.entity.pageList;
import cn.masterYi.service.pagesList;
import cn.masterYi.util.JsonResult;

@Controller
@RequestMapping("/notebook")
public class paging extends BaseController {
	@Resource
    private pagesList pageslist;
    @ResponseBody
	@RequestMapping(value = "/actions.do")
	public Object paging(int pagenum) {
		List<pageList> list = pageslist.listpage(pagenum);
		int nums = pageslist.pagenum();
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("list", (Object) list);
		map.put("num", nums);
		return new JsonResult(map);
	}
}	
