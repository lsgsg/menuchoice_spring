package pack.food.model.seul;

import java.util.List;

import pack.food.model.jeong.BoardDto;

public interface AjaxDaoInter {   // 인사, 자재, 영업 inter 등... "다형성"을 위해 인터페이스 운영
   
   List<MenuDto>  getDataAll(String name);
//   MemDto selectPart(String num);
   List<BoardDto> getDataAllco(String no);
   boolean insertDataInter(BoardDto dto);
//   boolean updateData(MemBean bean);
//   boolean deleteData(String num);
   
}