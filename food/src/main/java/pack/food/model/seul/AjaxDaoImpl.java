package pack.food.model.seul;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.food.model.jeong.BoardDto;

@Repository //(객체 생성과 관련된 어노테이션)
public class AjaxDaoImpl implements AjaxDaoInter{

   
   @Autowired
   private AjaxAnnoInter annoInter;
   
   public List<MenuDto>  getDataAll(String name) {
//      return getSqlSession().selectList("selectDataAll");
      return annoInter.getDataAll(name);
   }
   
   public List<BoardDto> getDataAllco(String no){
      return annoInter.getDataAllCo(no);
   }

   public boolean insertDataInter(BoardDto dto) {

      
      boolean re = annoInter.insertDataContent(dto);
      if(true)
         return true;
      else
         return false;
   }
   


}