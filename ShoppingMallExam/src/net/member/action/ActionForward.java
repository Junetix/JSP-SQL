package net.member.action;

public class ActionForward {
	private boolean isRedirect = false;
	private String path;
	public boolean isRedirect() {
		return isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setRedirect(boolean b) {
		this.isRedirect = b;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
