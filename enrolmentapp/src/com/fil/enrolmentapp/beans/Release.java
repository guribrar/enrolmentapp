package com.fil.enrolmentapp.beans;

import java.util.Date;

public class Release {
	
	private int idrelease;
	private String releasename;
	private Date releasestartdate;
	private Date releaseenddate;
	private String desc;
	
	public Release() {
	
		idrelease = 0;
		releasename = "";
		releasestartdate = new Date();
		releaseenddate = new Date();
		desc = "";
	}

	public int getIdrelease() {
		return idrelease;
	}

	public void setIdrelease(int idrelease) {
		this.idrelease = idrelease;
	}

	public String getReleasename() {
		return releasename;
	}

	public void setReleasename(String releasename) {
		this.releasename = releasename;
	}

	public Date getReleasestartdate() {
		return releasestartdate;
	}

	public void setReleasestartdate(Date releasestartdate) {
		this.releasestartdate = releasestartdate;
	}

	public Date getReleaseenddate() {
		return releaseenddate;
	}

	public void setReleaseenddate(Date releaseenddate) {
		this.releaseenddate = releaseenddate;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
