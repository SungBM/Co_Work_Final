package com.naver.cowork.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.Proboard_check_user;
import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_Board_Comment;
import com.naver.cowork.domain.Project_User;
import com.naver.cowork.mybatis.mapper.ProjectMapper;

@Service
public class ProjectServiceImpl implements ProjectService {

	private ProjectMapper dao;

	@Autowired
	public ProjectServiceImpl(ProjectMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
	}

	@Override
	public void close(PreparedStatement pstmt, Connection conn) {
		// TODO Auto-generated method stub

	}

	@Override
	public void all_close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return dao.getListCount();
	}

	@Override
	public Project getDetailProject() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Project p) {
		// TODO Auto-generated method stub
		System.out.println(p.getProject_admin() + "서비스임플");

		return dao.insert(p);
	}

	@Override
	public List<Project> getProjectList(String logingID) {
		// TODO Auto-generated method stub
		List<Project> list = null;
		list = dao.getProjectList(logingID);
		list = getProject_UserInfo(list);

		return list;
	}

	public List<Project> getDeadLineProjects(String logingID) {
		List<Project> list = dao.getDeadLineProjects(logingID);
		list = getProject_UserInfo(list);

		return list;
	}

	public List<Project> getProject_UserInfo(List<Project> list) {
		for (Project p : list) {
			ArrayList<Project_User> user_list = dao.getProjectUser(p.getProject_num());
			int user_count = dao.getProjectUserCount(p.getProject_num());
			p.setProject_parti(user_list);
			p.setParti_count(user_count);
			p.setProject_parti_forModal(user_list);
		}

		return list;

	}

	@Transactional
	public Project insert_user(Project p) {
		insert(p);

		p.setProject_num(p.getProject_num() + 1);
		return dao.insert_user(p);
	}

	@Override
	public List<Project_Board> getPojectBoardFeed(int pNum) {
		return dao.getPojectBoardFeed(pNum);
	}

	@Override

	public Project insert_user(Project_User u) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Project_Board> getProjectDetailList() {
		// TODO Auto-generated method stub
		return dao.getProjectDetailList();
	}

	public String getProjectName(int pNum) {
		// TODO Auto-generated method stub
		return dao.getProjectName(pNum);
	}

	@Override
	public int getDayCount(String startDate, String endDate) {
		int dayCount = 0;

		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.DATE_FORMAT);
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		try {
			Date startFormat = sdf.parse(startDate);
			Date endFormat = sdf.parse(endDate);
			Date todayformat = sdf.parse(strToday);
			long diffSec = (endFormat.getTime() - startFormat.getTime()) / 1000; // 초 차이
			long all_Days_diff = diffSec / (24 * 60 * 60); // 일자수 차이

			long today_diff_sec = (endFormat.getTime() - todayformat.getTime()) / 1000;
			long today_diff = today_diff_sec / (24 * 60 * 60);

			double all_days = all_Days_diff;
			double today = today_diff;
			dayCount = 100 - (int) ((today / all_days) * 100);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dayCount;
	}

	@Override
	public int increaseCheck(int pbNum, String id) {

		int re = dao.increaseCheck(pbNum);
		if (re == 1) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pbNum", pbNum);
			map.put("id", id);
			dao.updateUserCheckInfo(map);
			return dao.getCheckCount(pbNum);
		} else {
			return 0;
		}

	}

	@Override
	public int decreaseCheck(int pbNum, String id) {
		int re = dao.decreaseCheck(pbNum);
		if (re == 1) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pbNum", pbNum);
			map.put("id", id);
			dao.updateUserCheckInfoClear(map);
			return dao.getCheckCount(pbNum);
		} else {
			return 0;
		}
	}

	@Override
	public String[] getProjectBookmarkList(int pNum) {
		// TODO Auto-generated method stub
		return dao.getProjectBookmarkList(pNum);
	}

	@Override
	public String ProjectBookmarkCheckedClear(int pbNum) {
		int re = dao.checkedClearBookmark(pbNum);
		if (re == 1) {
			return dao.ProjectBookmarkCheckedClear(pbNum);
		} else {
			return "북마크 해제 실패";
		}
	}

	@Override
	public String ProjectBookmarkChecked(int pbNum) {
		int re = dao.checkedBookmark(pbNum);
		if (re == 1) {
			return dao.ProjectBookmarkChecked(pbNum);
		} else {
			return "북마크 체크 완료";
		}
	}

	@Override
	public List<Proboard_check_user> getProBoardCheckUserList(String id) {
		return dao.getProBoardCheckUserList(id);
	}

	@Override
	public int ProjectCommentAdd(Project_Board_Comment pbc) {
		// TODO Auto-generated method stub
		return dao.ProjectCommentAdd(pbc);
	}

	@Override
	public List<Project_Board_Comment> getProjectCommentList(int pbNum, int page) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int limit = 5;
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("pbNum", pbNum);
		map.put("start", startrow);
		map.put("end", endrow);

		return dao.getProjectCommentList(map);
	}

	@Override
	public int commentDelete(int pbNum) {
		return dao.commentDelete(pbNum);
	}

	@Override
	public int ProjectCommentUpdate(Project_Board_Comment pbc) {
		// TODO Auto-generated method stub
		return dao.ProjectCommentUpdate(pbc);
	}

	@Override
	public int ProjectCommentReply(Project_Board_Comment pbc) {
		// TODO Auto-generated method stub
		return dao.ProjectCommentReply(pbc);
	}

	@Override
	public int getPjectCommentCount(int pbNum) {
		// TODO Auto-generated method stub
		return dao.getPjectCommentCount(pbNum);
	}

	@Override
	public List<Project> getProjectListForMain() {
		// TODO Auto-generated method stub
		return dao.getProjectListForMain();
	}

	@Override
	public List<Project> getProjectListWithProg(List<Project> list) {

		for (Project p : list) {
			String d1 = p.getProject_start().substring(0, 10);
			String d2 = p.getProject_end().substring(0, 10);
			;

			int prog = getDayCount(d1, d2);
			if (prog > 100) {
				prog = 100;
				p.setProject_prog(prog);
				p.setProject_state(PJStateEnum.OVERDEADLINE.getState());
				p.setProject_priority(PJPriorityEnum.NONEPRIORITY.getPriority());
			} else {
				p.setProject_prog(prog);
			}
		}
		return list;
	}

	@Override
	public int insertProjectBoard(Project_Board board) {
		return dao.insertProjectBoard(board);

	}

	@Override
	public List<Project> searchByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return dao.searchByKeyword(keyword);
	}

	@Override
	public List<Project> getAllProjects() {
		// TODO Auto-generated method stub
		return dao.getAllProjects();
	}

	@Override
	public List<Project> getProjectsByCreatorId(String creatorId) {
		// TODO Auto-generated method stub
		return dao.getProjectsByCreatorId(creatorId);
	}

}
