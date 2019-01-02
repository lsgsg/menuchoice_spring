package pack.food.model.jeong;

public class BoardDto {
	
	private String no, food_no, client_id, content, date, groups;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public void setFood_no(String food_no) {
		this.food_no = food_no;
	}
	
	public String getFood_no() {
		return food_no;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setGroups(String groups) {
		this.groups = groups;
	}

	public String getGroups() {
		return groups;
	}
	
}
