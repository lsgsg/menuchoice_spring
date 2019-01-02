package pack.food.model.hong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginClientImpl {
	@Autowired
	private LoginClientInter inter;

	public ClientDto getLoginInfo(String no) {
		return inter.getLoginInfo(no);
	}
}
