package com.mingge.pojo;

import java.sql.Timestamp;

public class Zeaapost {
	private Integer rowid;
	private String zptnum_0;
	private String zptdes_0;
	private Timestamp credat_0;
	private String creusr_0;
	private Timestamp upddat_0;
	private String updusr_0;
	public Integer getRowid() {
		return rowid;
	}
	public void setRowid(Integer rowid) {
		this.rowid = rowid;
	}
	public String getZptnum_0() {
		return zptnum_0;
	}
	public void setZptnum_0(String zptnum_0) {
		this.zptnum_0 = zptnum_0;
	}
	public String getZptdes_0() {
		return zptdes_0;
	}
	public void setZptdes_0(String zptdes_0) {
		this.zptdes_0 = zptdes_0;
	}
	public Timestamp getCredat_0() {
		return credat_0;
	}
	public void setCredat_0(Timestamp credat_0) {
		this.credat_0 = credat_0;
	}
	public String getCreusr_0() {
		return creusr_0;
	}
	public void setCreusr_0(String creusr_0) {
		this.creusr_0 = creusr_0;
	}
	public Timestamp getUpddat_0() {
		return upddat_0;
	}
	public void setUpddat_0(Timestamp upddat_0) {
		this.upddat_0 = upddat_0;
	}
	public String getUpdusr_0() {
		return updusr_0;
	}
	public void setUpdusr_0(String updusr_0) {
		this.updusr_0 = updusr_0;
	}
	@Override
	public String toString() {
		return "Zeaapost [rowid=" + rowid + ", zptnum_0=" + zptnum_0 + ", zptdes_0=" + zptdes_0 + ", credat_0="
				+ credat_0 + ", creusr_0=" + creusr_0 + ", upddat_0=" + upddat_0 + ", updusr_0=" + updusr_0 + "]";
	}
	
	
	
}
