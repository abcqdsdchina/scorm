package com.scorm.action.admin;


import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.scorm.action.ActionSupport;
import com.scorm.service.UserinfoService;
import com.scorm.utils.Page;
import com.scorm.vo.Userinfo;

/**
 * 用户管理action层
 * @author BFS Team 
 *
 */


@SuppressWarnings("serial")
@Scope(value="prototype")
@Component(value="userlistAction")
public class UserlistAction extends ActionSupport{
	@Resource(name="userinfoService")
	private UserinfoService userinfoService;
	/**分页
	 * 
	 */
	private int dataCount;//总记录数
	private Integer pageStart;//当前页吗
	private Page page;
	/**
	 * 用户信息
	 */
	private int userId;
	private String userName;
	private String userPwd;
	private String userEmail;
	private String userPhone;
	private Integer userActive;
	private Integer isAdmin;
	private Userinfo user;
	
	/**
	 * 得到用户信息并分页
	 */
	public String execute(){
	//ss	System.out.println("welcome 后台");
		dataCount = userinfoService.findAllUserinfo().size();
		if( pageStart == null || pageStart <= 0 ) {
			pageStart = 1;
		}
		page = new Page(dataCount, pageStart);
		if( pageStart > page.getPageCount() ) {
			pageStart = page.getPageCount();
			page = new Page(dataCount, pageStart);
		}
		 
		List<Userinfo> list = userinfoService.getUserList(pageStart, page.getPageRecordNum());
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("userList", list);
	//	System.out.println("welcome");
		return "success";
	}
	public String deleteUser(){
		user = userinfoService.findByUserId(userId).get(0);
		userinfoService.deleteUserinfo(user);
    	//System.out.print("ds"+Id);
    	return "success";
    }
	public String changeUser(){
		user = userinfoService.findByUserId(userId).get(0);
		user.setUserName(userName);
		user.setUserEmail(userEmail);
		user.setUserPhone(userPhone);
		userinfoService.updateUserinfo(user);
		return "success";
    }
	public String detailUser(){
		user = userinfoService.findByUserId(userId).get(0);
		return SUCCESS;
	}
	 //getter and   setter
	public UserinfoService getUserinfoService() {
		return userinfoService;
	}
	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Integer getUserActive() {
		return userActive;
	}
	public void setUserActive(Integer userActive) {
		this.userActive = userActive;
	}
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getDataCount() {
		return dataCount;
	}
	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}
	public Integer getPageStart() {
		return pageStart;
	}
	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Userinfo getUser() {
		return user;
	}
	public void setUser(Userinfo user) {
		this.user = user;
	}


	
}
