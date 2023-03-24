package com.naver.cowork.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Project;
import com.naver.cowork.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	private ProjectService projectService;
	
	
	public ProjectController(ProjectService projectService) {
		this.projectService = projectService;
	}

	 /*
	   1.view contoller 보낼 url 지정 파라미터값 지정 //service 클래스 변수 만들기
	  
	   2.컨트롤러에서 해당 url @RequestMapping(value =  "url주소" , method = RequestMethod.GET //겟 or 포스트)
	   3.반환값은 헷갈리면 ModelAndView 쓰시고 안되면 말씀해주세여 
	   4. @RequestParam(value = "id")String id 이 파라미터는  HttpServletRequest request / requset.getParmeter() 랑 동일
	   5. mv.addObject( )  view에서 접근할 이름을 지정 ,  사용할 데이터 설정
	   --DB접속 
	   5-1 : Vo 객체 도메인에 본인이만들 DB 구조그대로 Project.java 만들어주시고
	   5-2 : Service 인터페이스 생성 // 예를들어서 리스트를 가져오고싶다 getProjectList(파라미터있으면 파라미터까지 설정);
	   5-3 : ServiceImpl : 5-2에서 만든 인터페이스를 implements 하는 클래스 인터페이스선언한 메서드 구현  
	   		 구현할때 Mapper 클래스 에 접근해야됩니다 그래서 Mapper변수를 클래스변수로 선언 이 변수로 db접근 
	   5-4 : Mapper 인터페이스는 @Mapper 꼭 달아주시고 Service getProjectList파라미터값도 그대로)
	   5-5 : src/main/resources/com//naver/cowork/mybatis/mapper/ ~~.xml
	   5-6 : xml 데이터베이스에서 가져올 쿼리문 작성하는곳 
	         <mapper namespace="com.naver.cowork.mybatis.mapper.ProjectMapper">
	   6. mv.setViewName(  ) url 주소 지정 어디로가라 
	   7. 반환값에 맞춰서 return mv;
	  */


	@RequestMapping(value =  "/ProjectList" , method = RequestMethod.GET)
	public ModelAndView project_list(ModelAndView mv , @RequestParam(value = "id")String id) {
		//HTA1 
		List<Project> list = projectService.getProjectList(id);
		mv.addObject("projectList", list);
		
		mv.setViewName("project/project_List2");
		
		return mv;
	}
	
}
