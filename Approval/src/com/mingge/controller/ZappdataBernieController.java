package com.mingge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mingge.biz.ZappdataBernieBiz;
import com.mingge.dao.ZappdataBernieDao;
import com.mingge.pojo.Autilis;
import com.mingge.pojo.Prequisd;
import com.mingge.pojo.Ysqneir;
import com.mingge.pojo.Zappdata;
import com.mingge.pojo.Zeaapost;

@Controller
public class ZappdataBernieController {
	private Autilis autilis;

	@Autowired
	private ZappdataBernieBiz zappdataBernieBiz;
	@Autowired
	private ZappdataBernieDao zappdataBernieDao;

	// 根据电话号码查询用户信息 //查询所有职位 
	// @RequestMapping(value="/action")
	// public ModelAndView load(ModelAndView modelAndView,String yddusr_0){
	// List<Autilis> list = zappdataBernieBiz.queryAutilis(yddusr_0);
	// List<Zeaapost> list2=zappdataBernieBiz.queryZeaapost();
	// modelAndView.addObject("list", list);
	// modelAndView.addObject("list2",list2);
	// modelAndView.setViewName("action");
	// return modelAndView;
	// }
	// your新加根据电话号码查询用户信息 并返回json格式数据
	@ResponseBody
	@RequestMapping(value = "/actions")
	public Object loads(String yddusr_0, HttpSession session) {
		System.out.println("第一步，进入程序");
		List<Autilis> list = zappdataBernieBiz.queryAutilis(yddusr_0);
		for (Autilis autilis : list) {
			session.setAttribute("user", autilis.getNomusr_0());
			session.setAttribute("yddusr", yddusr_0);
			System.out.println(session.getAttribute("user"));
		}
		if (list.size() == 0) {
			return "redirect:start404";
		} else {
			return list;
		}

	}

	// your新加根据电话号码查询用户信息 并返回json格式数据 end

	@ResponseBody
	@RequestMapping(value = "/actioned")
	public Object loaded(String yddusr_0) {
		List<Zeaapost> list2 = zappdataBernieBiz.queryZeaapost();
		return list2;
	}

	// your新加根据电话号码查询用户信息 并返回json格式数据 end

	// 根据职位查询已审核的信息
	// @RequestMapping(value="/agin")
	// public ModelAndView agin(ModelAndView modelAndView,String yddusr_0){
	// List<Autilis> list = zappdataBernieBiz.queryAutilis(yddusr_0);
	// List<Zappdata> listZapp = zappdataBernieBiz.queryZappdata(list);
	// modelAndView.addObject("listZapp", listZapp);
	// modelAndView.setViewName("agin");
	// return modelAndView;
	// }
	// 根据原始单据号查询已审批单据详细页
	@RequestMapping(value = "/aginTo")
	public ModelAndView aginTo(ModelAndView modelAndView, String zppori_0) {
		List<Zappdata> listZappTo = zappdataBernieBiz.queryZappdataTo(zppori_0);
		System.out.println(listZappTo.size() + "已审批为条数");
		modelAndView.addObject("listZappTo", listZappTo);
		modelAndView.setViewName("index");
		System.out.println("aa");
		return modelAndView;
	}

	// your新加根据职位查询已审核的信息 并返回json格式数据返回json end
	// your新加根据职位查询已审核的信息 并返回json格式数据返回json
	@ResponseBody
	@RequestMapping(value = "/aginTos")
	public Object aginTos(String zppori_0) {
		System.out.println("未审批第二步");
		List<Zappdata> listZappTo = zappdataBernieBiz.queryZappdataTo(zppori_0);
		System.out.println(listZappTo.size() + "已审批为条数");
		return listZappTo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/aginTos1")
	public Object aginTos1(String ypshnum_0) {
		System.out.println("未审批明细");
		List<Ysqneir> listZappTo = zappdataBernieDao.queruyPrequis1(ypshnum_0);
		System.out.println(listZappTo.size() + "已审批为条数");
		return listZappTo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/aginTos2")
	public Object aginTos2(String pshnum_0) {
		System.out.println("未审批明细");
		List<Prequisd> listZappTo = zappdataBernieDao.queruyPrequis2(pshnum_0);
		System.out.println(listZappTo.size() + "已审批为条数");
		System.out.println(listZappTo + "已审批为条数");
		return listZappTo;
	}

	// your新加根据职位查询已审核的信息 并返回json格式数据返回json
	@ResponseBody
	@RequestMapping(value = "/agins")
	public Object agins(String yddusr_0, HttpSession session) {
		String yddusr;
		List<Autilis> list;
		if (yddusr_0.equals("null") || yddusr_0.equals("")) {
			yddusr = (String) session.getAttribute("yddusr");
			list = zappdataBernieBiz.queryAutilis(yddusr);
			List<Zappdata> listZapp = zappdataBernieBiz.queryZappdata(list);
			return listZapp;
		} else {
			list = zappdataBernieBiz.queryAutilis(yddusr_0);
			List<Zappdata> listZapp = zappdataBernieBiz.queryZappdata(list);
			return listZapp;
		}
	}

	// your新加根据职位查询已审核的信息 并返回json格式数据返回json end

	// 根据职位查询未审核的信息
	// @RequestMapping(value = "/three")
	// public ModelAndView three(ModelAndView modelAndView, String yddusr_0) {
	// List<Autilis> list = zappdataBernieBiz.queryAutilis(yddusr_0);
	// List<Zappdata> listZappTwo = zappdataBernieBiz.queryZappdataTwo(list);
	// System.out.println(listZappTwo.size() + "根据职位查询未审核条数");
	// modelAndView.addObject("listZappTwo", listZappTwo);
	// modelAndView.setViewName("three");
	// return modelAndView;
	// }

	// your新加根据职位查询未审核的信息 并返回json格式数据返回json
	@ResponseBody
	@RequestMapping(value = "/threes")
	public Object threes(String yddusr_0, HttpSession session) {
		List<Autilis> list;
		if (yddusr_0.equals("null")||yddusr_0.equals("")) {
			String yddusr = (String) session.getAttribute("yddusr");
			list = zappdataBernieBiz.queryAutilis(yddusr);
	//		System.out.println(session.getAttribute("yddusr") + "===2");
			List<Zappdata> listZappTwo = zappdataBernieBiz.queryZappdataTwo(list);
			return listZappTwo;
		} else {
			list = zappdataBernieBiz.queryAutilis(yddusr_0);
			List<Zappdata> listZappTwo = zappdataBernieBiz.queryZappdataTwo(list);
			System.out.println("===3" + listZappTwo);
			return listZappTwo;
		}
	}

	// your新加根据职位查询未审核的信息 并返回json格式数据返回json end

	// 根据单号查询详细信息
	@RequestMapping(value = "/update")
	public ModelAndView update(ModelAndView modelAndView, String zppori_0) {
		List<Zappdata> listZappUp = zappdataBernieBiz.queryZappdataUp(zppori_0);
		System.out.println(listZappUp.size() + "未审批为条数");
		modelAndView.addObject("listZappUp", listZappUp);
		modelAndView.setViewName("update");
		return modelAndView;
	}

	// your新加根据单号查询详细信息 并返回json格式数据返回json
	@ResponseBody
	@RequestMapping(value = "/updates")
	public Object updates(String zppori_0) {
		List<Zappdata> listZappUp = zappdataBernieBiz.queryZappdataUp(zppori_0);
		for (Zappdata zappdata : listZappUp) {
			System.out.println(zappdata.getRowid() + "这是本条数据的主键id号");

		}
		System.out.println(listZappUp.size() + "未审批为条数");

		return listZappUp;
	}

	// your新加根据单号查询详细信息 并返回json格式数据返回json end
	
	@ResponseBody
	@RequestMapping(value = "/updates1")
	public Object updates1(String ypshnum_0) {
		List<Ysqneir> listZappUp = zappdataBernieDao.queruyPrequis1(ypshnum_0);
		
		System.out.println(listZappUp.size() + "未审批为条数");

		return listZappUp;
	}

	@ResponseBody
	@RequestMapping(value = "/updates2") 
	public Object updates2(String pshnum_0) {
		List<Prequisd> listZappUp = zappdataBernieDao.queruyPrequis2(pshnum_0);
		
		System.out.println(listZappUp.size() + "未审批为条数");

		return listZappUp;
	}


	// 根据id号修改审批状态
	@RequestMapping(value = "/updateOn", method = RequestMethod.POST)
	public Object updateOn(ModelAndView modelAndView,
			HttpServletRequest request, Zappdata zappdata, String rowid1,
			HttpSession session) {
		System.out.println(zappdata.getYfawuqz_0());
		System.out.println(zappdata.getZppusr_0());
		System.out.println(rowid1);
		Integer rowid = Integer.parseInt(rowid1);
		zappdataBernieBiz.updateZappdata(rowid, zappdata);
		modelAndView.addObject("tel", session.getAttribute("tel"));
		modelAndView.setViewName("success");
		return modelAndView;

	}

	// 根据id号退回申请人
	@RequestMapping(value = "/updateTo", method = RequestMethod.POST)
	public Object updateTo(ModelAndView modelAndView, HttpSession session,
			HttpServletRequest request, String rowid2, Zappdata zappdata) {
		System.out.println(session.getAttribute("tel"));
		Integer rowid = Integer.parseInt(rowid2);

		zappdataBernieBiz.updateZappdataTO(rowid, zappdata);
		modelAndView.addObject("tel", session.getAttribute("tel"));
		modelAndView.setViewName("success");
		return modelAndView;
	}

	// 不同意退回上一级
	@RequestMapping(value = "/updateThree", method = RequestMethod.POST)
	public Object updateThree(ModelAndView modelAndView, HttpSession session,
			HttpServletRequest request, String rowid3, Zappdata zappdata) {
		Integer rowid = Integer.parseInt(rowid3);
		System.out.println(zappdata.getZppmemo_0() + "这是不同意返回上一级的id号");
		zappdataBernieBiz.updateZappdataThree(rowid, zappdata);
		modelAndView.addObject("tel", session.getAttribute("tel"));
		modelAndView.setViewName("success");
		return modelAndView;
	}

	// 增加职位
	// 进入增加职位下拉列表，
	@RequestMapping(value = "/insertZeaaPost")
	public ModelAndView insertZeaaPost(ModelAndView modelAndView, Integer rowid) {
		List<Zeaapost> listZeaaPost = zappdataBernieBiz.queryZeaapost();
		System.out.println(listZeaaPost.size());
		modelAndView.addObject("list2", listZeaaPost);
		modelAndView.addObject("rowid", rowid);
		modelAndView.setViewName("zeaaPost");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/insertZeaaPosts")
	public Object insertZeaaPosts(ModelAndView modelAndView, Integer rowid4) {
		List<Zeaapost> listZeaaPost = zappdataBernieBiz.queryZeaapost();
		//System.out.println(listZeaaPost);
		return listZeaaPost;
	}
	String[] NewJob; 
	// 点击确定后运行
	@RequestMapping(value = "/insertZappdata", method = RequestMethod.POST)
	public Object insertZappdata(ModelAndView modelAndView,
			HttpSession session, HttpServletRequest request, String rowid3,Zappdata zappdata) {
		System.out.println("fw"+zappdata.getYfawuqz_0());
		System.out.println("ys"+zappdata.getYusuan_0());
		System.out.println("112233");
		if (null!=zappdata.getZptnum_0()) {
		String str = zappdata.getZptnum_0();
		System.out.println(str);
		String[]  strs=str.split(",");
		System.out.println(strs);
		NewJob = strs;
		Integer rowid = Integer.parseInt(rowid3);
		for(int i=0,len=strs.length;i<len;i++){
		    System.out.println(strs[i].toString());
		    String[] strd=strs[i].split("_");
		    System.out.println(strd[0].toString());
		    System.out.println(strd[1].toString());
		    Zappdata zappdata1 = new Zappdata();
		    zappdata1.setZptnum_0(strd[0]);
		    zappdata1.setZptnumdes_0(strd[1]);		    
		    rowid = zappdataBernieBiz.insertIntoZappdata(rowid,zappdata1);
		}}
		
		//Integer rowid = Integer.parseInt(rowid3);
		//System.out.println(rowid3+zappdata.getZptnum_0()); 
		//zappdataBernieBiz.insertIntoZappdata(rowid,zappdata);
		modelAndView.addObject("tel", session.getAttribute("tel"));
		modelAndView.setViewName("NP");
		return modelAndView;
	}
	@ResponseBody
	@RequestMapping(value = "/NewJob")
	public Object NewJob(ModelAndView modelAndView, Integer rowid4) {
		
		return NewJob;
	}
}
