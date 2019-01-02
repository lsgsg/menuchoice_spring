package pack.food.model.hong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientJoinImpl {
	@Autowired
	private ClientJoinInter inter;
	
	public ClientDto idCheck(String id) {
		return inter.checkId(id);
	}
	
	public boolean joinClient(ClientDto dto) {
		if(inter.joinClient(dto)) return true;
		else return false;		
	}
	
	public boolean joinClient2(ClientDto dto) {
		if(inter.joinClient2(dto)) return true;
		else return false;		
	}
}
