package pack.food.model.hong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientModifyImpl {
	@Autowired
	private ClientModifyInter inter;
	
	public ClientDto getClientOne(String id) {
		return inter.getClientOne(id);
	}
	
	public boolean updateClientOne(ClientDto dto) {
		return inter.updateClientOne(dto);
	}

}
