package com.naver.cowork.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Project_Board {
	private int PRO_BOARD_NUM;
	private String PRO_BOARD_CREATER_ID;
	private String PRO_BOARD_CARTEGORY;
	private String PRO_BOARD_STATE;
	private String PRO_BOARD_MANAGER;
	private String PRO_BOARD_CREATER_NAME;
	private String PRO_BOARD_SUBJECT;
	private String PRO_BOARD_CONTENT;
	private String PRO_BOARD_FILE;
	private int PRO_BOARD_READCOUNT;
	private String PRO_BOARD_CREATE_DATE;
	private String PRO_BOARD_START;
	private String PRO_BOARD_END;
	private String PRO_BOARD_PRIORITY;
	private int PRO_BOARD_LIKE;
	private int PRO_BOARD_BOOKMARK;
	private int PROJECT_NUM;
	private String PRO_BOARD_FILE_ORIGINAL;
	private List<Proboard_check_user> PROBOARD_CHECK_USERS;
	}
