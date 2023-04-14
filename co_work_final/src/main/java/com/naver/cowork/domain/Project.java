package com.naver.cowork.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Project {
		private int row_num;
		private int project_num;
		private String project_name;
		private String project_state;
		private int project_prog;
		private String project_start;
		private String project_end;
		private String project_priority;
		private int project_partici;
		private String project_admin;
		private String project_admin_img;
		private ArrayList<Project_User> project_parti;
		private int parti_count;
		private ArrayList<Project_User> project_parti_forModal;
		
	}
