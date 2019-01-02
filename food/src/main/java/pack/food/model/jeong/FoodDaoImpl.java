package pack.food.model.jeong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.food.controller.jeong.BoardBean;

@Repository // (객체 생성과 관련된 어노테이션)
public class FoodDaoImpl implements FoodDaoInter {

   @Autowired
   private FoodAnnoInter annoInter;

   // 메뉴 전체보기
   public List<FoodDto> getDataAll() {
      return annoInter.getDataAll();
   }

   // 카테고리별 메뉴목록
   public List<FoodDto> getDataGroup(String groups) {
      return annoInter.getDataGroup(groups);
   }

   // 메뉴 상세보기용
   public FoodDto getData(String no) {
      return annoInter.getData(no);
   }

   // 카테고리 이름 가져오는 용도
   public List<FoodDto> selectGroup() {
      return annoInter.selectGroup();
   }

   // 상세보기 페이지에서 댓글 보기
   public List<BoardDto> getContentAll(String food_no) {
      // System.out.println("getContentAll impl:" + no);
      return annoInter.getContentAll(food_no);
   }
   
   // 게시판 글 하나
   public BoardDto selectPart(String no) {
      return annoInter.selectPart(no);
   }

   // 댓글 추가
   public boolean insertData(BoardBean bean) {

      int re = annoInter.insertData(bean);
      if (re > 0)
         return true;
      else
         return false;
   }

   public boolean updateData(BoardBean bean) {
      
      int re = annoInter.updateData(bean);
      if (re > 0)
         return true;
      else
         return false;
   }

   public boolean deleteData(String no) {

      int re = annoInter.deleteData(no);
      if (re > 0)
         return true;
      else
         return false;
   }
   public List<FoodDto> getDataName(String name) {
      return annoInter.getDataNameInter(name);
   }

}