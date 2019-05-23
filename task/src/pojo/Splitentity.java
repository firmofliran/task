package pojo;

import java.io.Serializable;
import java.util.List;

public class Splitentity implements Serializable{
	private static final long serialVersionUID = 1L;
	public int currentpage;
	public int pagesize;
	public int totalnum;
	public int totalpage;
	public List<Student> listsplitpage;
	public Splitentity() {
	}


	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
		totalpage = totalnum % pagesize != 0 ? totalnum / pagesize + 1 : totalnum / pagesize;
	}

	public int getTotalnum() {
		return totalnum;
	}

	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}

	public List<Student> getListsplitpage() {
		return listsplitpage;
	}

	public void setListsplitpage(List<Student> finallylist) {
		this.listsplitpage = finallylist;
	}

	public int getTotalpage() {
		return totalpage;
	}

}