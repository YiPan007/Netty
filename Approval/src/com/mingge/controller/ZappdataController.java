package com.mingge.controller;
/**
 * York
 * 此类用于页面跳转
 */


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mingge.biz.ZappdataBiz;
import com.mingge.pojo.zppdataurl;

@Controller
public class ZappdataController {
	@Autowired
	private ZappdataBiz zappdataBiz;
	private String dataurl;
	private String user1;
	private String state;
	private String ztA;

	
	//钉钉进入后的首页
	@RequestMapping(value="/start")
	public Object start(ModelAndView modelAndView,String tel){	
		if (("").equals(tel) || tel==null) {			
			return "redirect:start404";
		}else {
			modelAndView.addObject("tel", tel);
			modelAndView.setViewName("start");
			return modelAndView;
		}	
	}
	
	@RequestMapping(value="/start404")
	public ModelAndView start404(ModelAndView modelAndView){
		modelAndView.setViewName("start404");
		return modelAndView;
	}
	
	//已审核页面
	@RequestMapping(value="/check")
	public Object check(ModelAndView modelAndView,String yddusr_0,String zt,String username,HttpSession session){
	    //判断前段点击的是那个按钮，如果等于ysp则说明是已审批按钮
		dataurl="agins?yddusr_0="+yddusr_0;           //忘审批界面传入查询已审核数据的地址用于ajax请求数据
		System.out.println(username+"用户名字");	
		state=zt;
		System.out.println(session.getAttribute("user")+"第一个用户名字");
		modelAndView.addObject("dataurl", dataurl);		  //往审批页面传值
		modelAndView.setViewName("check");
		return modelAndView;
		}
	//未审核页面
	@RequestMapping(value="/checkA")
	public Object checkA(ModelAndView modelAndView,String yddusr_0,String zt,String username,HttpSession session){
		dataurl="threes?yddusr_0="+yddusr_0;           //忘审批界面传入查询已审核数据的地址用于ajax请求数据
		state=zt;
		System.out.println(session.getAttribute("user")+"第一个用户名字");
		modelAndView.addObject("dataurl", dataurl);		  //往审批页面传值
		modelAndView.setViewName("checkA");
		return modelAndView;
	}
		
		
		@RequestMapping(value="/sr")					//采购请求页面网址
		public ModelAndView sourcingRequest(ModelAndView modelAndView){
//			zppdataurl datas = new zppdataurl(dataurl, user);
			modelAndView.addObject("dataurl", dataurl);		  //往审批页面传值
			modelAndView.setViewName("sourcingRequest");
			return modelAndView;
	}
		@RequestMapping(value="/ptp")					//采购付款页面网址
		public ModelAndView ProcureToPay(ModelAndView modelAndView){
			//zppdataurl datas = new zppdataurl(dataurl, user);
			modelAndView.addObject("dataurl",dataurl);		  //往审批页面传值
			modelAndView.setViewName("ProcureToPay");
			return modelAndView;
	}
		@RequestMapping(value="/so")				//销售订单页面网址
		public ModelAndView SalesOrder(ModelAndView modelAndView){
			//zppdataurl datas = new zppdataurl(dataurl, user);
			modelAndView.addObject("dataurl", dataurl);		  //往审批页面传值
			modelAndView.setViewName("SalesOrder");
			return modelAndView;
	}
	@RequestMapping(value="/DPage")  //订单详情页面
	public ModelAndView load(ModelAndView modelAndView,String number,String state,HttpSession session){
		
		String Dpageurl;
		if("3".equals(state)){                             //判断前段点击的是那个按钮，如果等于ysp则说明是已审批按钮
			Dpageurl="aginTos?zppori_0="+number;           //忘审批界面传入查询已审核数据的地址用于ajax请求数据
		}else{                                            //如果不是已审批按钮
			Dpageurl="updates?zppori_0="+number;;          //往审批界面传入查询未审核数据的地址用于ajax请求数据
		}
		System.out.println(session.getAttribute("user")+"(((((((");
		user1=(String) session.getAttribute("user");
		zppdataurl datas = new zppdataurl(Dpageurl,user1);
		System.out.println(user1+"这是第二个用户名字");
		modelAndView.addObject("dataurl", datas);//需要将请求地址发送到页面用于ajax请求
		modelAndView.setViewName("DetailPage");
		return modelAndView;
	}
	//新增职位页面
	@RequestMapping(value="/nowjob")
	public ModelAndView nowjob(ModelAndView modelAndView,String rowid4){
		String id = rowid4;
		modelAndView.addObject("id", id);
		modelAndView.setViewName("NowJob");
		return modelAndView;
	}

}
