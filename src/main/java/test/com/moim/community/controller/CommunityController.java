package test.com.moim.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller



public class CommunityController {

	@Autowired
	HttpSession session;

	@Autowired
	CommunityService service;


	@RequestMapping(value = "/community_selectAll.do", method = RequestMethod.GET)
	public String community_selectAll(Model model) {
		log.info("community_selectAll.do().....{}");

		List<CommunityVO> vos = service.selectAll();

		for (CommunityVO vo : vos) {
			log.info(vo.toString());
		}

		model.addAttribute("vos",vos);

		return "community/selectAll";
	}

	@RequestMapping(value = "/community_selectOne.do", method = RequestMethod.GET)
	public String community_selectOne(CommunityVO vo, Model model) {
		log.info("community_selectOne.do().....");

		CommunityVO vo2 = service.selectOne(vo);
		log.info("test...{}",vo2);

		model.addAttribute("vo2",vo2);

		return "community/selectOne";
	}

	@RequestMapping(value = "/community_insert.do", method = RequestMethod.GET)
	public String community_insert(Model model) {
		String userId = (String) session.getAttribute("user_id");
		model.addAttribute("user_id", "tester");
		log.info("community_insert.do().....");


		return "community/insert";
	}

	@RequestMapping(value = "/community_insertOK.do", method = RequestMethod.POST)
	public String community_insertOK(Model model , CommunityVO vo){
		String userId = (String) session.getAttribute("user_id");
		model.addAttribute("user_id", userId);
		log.info("/community_insertOK.do...{}", vo);

		int result = service.insert(vo);
		log.info("result...{}", result);

		if(result==1) {
			return "redirect:community_selectAll.do";
		}else {
			return "redirect:community_insert.do";
		}

	}

	@RequestMapping(value = "/community_update.do", method = RequestMethod.GET)
	public String community_update(CommunityVO vo, Model model) {
		log.info("/community_update.do...{}", vo);

		CommunityVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "community/update";
	}

	@RequestMapping(value = "/community_updateOK.do", method = RequestMethod.POST)
	public String community_updateOK(CommunityVO vo) {
		log.info("/community_updateOK.do...{}", vo);

		int result = service.update(vo);
		log.info("result...{}", result);

		if(result==1) {
			return "redirect:community_selectOne.do?num="+vo.getNum();
		}else {
			return "redirect:community_update.do?num="+vo.getNum();
		}

	}

	@RequestMapping(value = "/community_deleteOK.do", method = RequestMethod.GET)
	public String community_deleteOK(CommunityVO vo){
		log.info("/community_deleteOK.do...{}", vo);

		int result = service.delete(vo);
		log.info("result...{}", result);

		if(result==1) {
			return "redirect:community_selectAll.do";
		}else {
			return "redirect:community_selectOne.do?num="+vo.getNum();
		}

	}

}