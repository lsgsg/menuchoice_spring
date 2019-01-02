package pack.food.model.jeong;

import java.util.List;

import pack.food.controller.jeong.BoardBean;

public interface FoodDaoInter { // 인사, 자재, 영업 inter 등... "다형성"을 위해 인터페이스 운영

   // 메뉴 전체보기
   List<FoodDto> getDataAll();

   // 메뉴 상세보기
   FoodDto getData(String no);

   // 카테고리 이름 가져오기
   List<FoodDto> selectGroup();

   // 해당 카테고리별 음식목록 가져오기
   List<FoodDto> getDataGroup(String groups);

   
   // 상세보기 페이지 메뉴별 댓글
   List<BoardDto> getContentAll(String food_no);
   List<FoodDto> getDataName(String name);
   BoardDto selectPart(String no);   // 글번호
   boolean insertData(BoardBean bean);
   boolean updateData(BoardBean bean);
   boolean deleteData(String no);   // 글번호

}