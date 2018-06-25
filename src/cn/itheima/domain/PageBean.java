package cn.itheima.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private int currentPage;
	private int currentCount;
	private int totalCount;
	private int totalPage;
	private List<T> shujuzidianList = new ArrayList<T>();
	private List<T> staffList = new ArrayList<T>();
	private List<T> kaoqinjiluList = new ArrayList<T>();
	private List<T> jiaqishenqingList = new ArrayList<T>();
	private List<T> chuchaishenqingList = new ArrayList<T>();
	private List<T> jiabanshenqingList = new ArrayList<T>();
	private List<T> tiaoxiushenqingList = new ArrayList<T>();
	private List<T> kaoqinchaxunList = new ArrayList<T>();
	
	public List<T> getKaoqinchaxunList() {
		return kaoqinchaxunList;
	}
	public void setKaoqinchaxunList(List<T> kaoqinchaxunList) {
		this.kaoqinchaxunList = kaoqinchaxunList;
	}
	public List<T> getTiaoxiushenqingList() {
		return tiaoxiushenqingList;
	}
	public void setTiaoxiushenqingList(List<T> tiaoxiushenqingList) {
		this.tiaoxiushenqingList = tiaoxiushenqingList;
	}
	public List<T> getJiabanshenqingList() {
		return jiabanshenqingList;
	}
	public void setJiabanshenqingList(List<T> jiabanshenqingList) {
		this.jiabanshenqingList = jiabanshenqingList;
	}
	public List<T> getChuchaishenqingList() {
		return chuchaishenqingList;
	}
	public void setChuchaishenqingList(List<T> chuchaishenqingList) {
		this.chuchaishenqingList = chuchaishenqingList;
	}
	public List<T> getJiaqishenqingList() {
		return jiaqishenqingList;
	}
	public void setJiaqishenqingList(List<T> jiaqishenqingList) {
		this.jiaqishenqingList = jiaqishenqingList;
	}
	public List<T> getKaoqinjiluList() {
		return kaoqinjiluList;
	}
	public void setKaoqinjiluList(List<T> kaoqinjiluList) {
		this.kaoqinjiluList = kaoqinjiluList;
	}
	public List<T> getStaffList() {
		return staffList;
	}
	public void setStaffList(List<T> staffList) {
		this.staffList = staffList;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getShujuzidianList() {
		return shujuzidianList;
	}
	public void setShujuzidianList(List<T> shujuzidianList) {
		this.shujuzidianList = shujuzidianList;
	}
	
	
}
