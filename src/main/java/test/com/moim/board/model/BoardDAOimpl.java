package test.com.moim.board.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

@Slf4j
@Repository
public class BoardDAOimpl implements BoardDAO{

    @Autowired
    SqlSession sqlSession;

    public BoardDAOimpl(){
        log.info("Boardimpl()....");
    }




    @Override
    public List<Somoim_BoardVO> selectList(Somoim_BoardVO vo) {


        return sqlSession.selectList("JOIN_SOMOIM_SELECT_ALL",vo);
    }

    @Override
    public Somoim_BoardVO selectJoin(Somoim_BoardVO vo) {
        return sqlSession.selectOne("JOIN_SOMOIM_SELECT_ONE",vo);
    }

    @Override
    public List<Somoim_ScheduleVO> sch_selectList(Somoim_ScheduleVO vo) {
        return sqlSession.selectList("Sch_SELECT_ALL",vo);
    }

    @Override
    public int update(Somoim_BoardVO vo) {
        return sqlSession.update("JOIN_SOMOIM_UPDATE",vo);
    }

    @Override
    public int delete(Somoim_BoardVO vo) {
        return sqlSession.delete("JOIN_SOMOIM_DELETE",vo);
    }

    @Override
    public int Sch_insert(Somoim_ScheduleVO vo) {
        return sqlSession.insert("Sch_INSERT",vo);
    }

    @Override
    public Somoim_ScheduleVO selectOne_schedule(Somoim_ScheduleVO vo) {
        return sqlSession.selectOne("Sch_SELECT_ONE",vo);
    }

    @Override
    public int Sch_update(Somoim_ScheduleVO vo) {
        return sqlSession.update("Sch_UPDATE",vo);
    }

    @Override
    public int Sch_delete(Somoim_ScheduleVO vo) {
        return sqlSession.delete("Sch_DELETE",vo);
    }

    @Override
    public int join_insert(Somoim_BoardVO vo) {
        return sqlSession.insert("JOIN_INSERT",vo);
    }

    @Override
    public int SCH_PART_UPDATE(Somoim_ScheduleVO vo) {
        return sqlSession.update("SCH_PART_UPDATE",vo);
    }

    @Override
    public int SCH_Part_Cancle(Somoim_ScheduleVO vo) {
        return sqlSession.update("SCH_CANCEL_UPDATE",vo);
    }

    @Override
    public List<Somoim_ScheduleVO> sch_selectList_part(Somoim_ScheduleVO vo) {
        return sqlSession.selectList("Sch_SELECT_PART",vo);
    }

    @Override
    public Somoim_ScheduleVO selectPay(Somoim_ScheduleVO vo) {
        return sqlSession.selectOne("SCHEDULE_PAYMENT",vo);
    }

    @Override
    public Somoim_MemberVO selectMember(Somoim_MemberVO mvo) {
        return sqlSession.selectOne("PAYMENT_USER_CHECK",mvo);
    }


}
