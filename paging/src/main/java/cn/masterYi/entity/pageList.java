package cn.masterYi.entity;

public class pageList {
	private String spdh;
	private String yspdh;
	private String cglx;
	private String spzt;
	private String dqspr;
	private String date;
	
	
	
	public pageList(String spdh, String yspdh, String cglx, String spzt, String dqspr, String date) {
		this.spdh = spdh;
		this.yspdh = yspdh;
		this.cglx = cglx;
		this.spzt = spzt;
		this.dqspr = dqspr;
		this.date = date;
	}
	public pageList() {
	}
	public String getSpdh() {
		return spdh;
	}
	public void setSpdh(String spdh) {
		this.spdh = spdh;
	}
	public String getYspdh() {
		return yspdh;
	}
	public void setYspdh(String yspdh) {
		this.yspdh = yspdh;
	}
	public String getCglx() {
		return cglx;
	}
	public void setCglx(String cglx) {
		this.cglx = cglx;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public String getDqspr() {
		return dqspr;
	}
	public void setDqspr(String dqspr) {
		this.dqspr = dqspr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "pageList [spdh=" + spdh + ", yspdh=" + yspdh + ", cglx=" + cglx + ", spzt=" + spzt + ", dqspr=" + dqspr
				+ ", date=" + date + "]";
	}
	
}
