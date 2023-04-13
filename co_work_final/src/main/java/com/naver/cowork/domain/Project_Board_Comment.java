package com.naver.cowork.domain;


import org.springframework.web.multipart.MultipartFile;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Project_Board_Comment {
		private int PRO_BO_COMMENT_NUM;
		private String PRO_BO_COMMENT_ID;
		private String PRO_BO_COMMENT_NAME;
		private String PRO_BO_COMMENT_CONTENT;
		private String PRO_BO_COMMENT_FILE;
		private int PRO_BO_COMMENT_RE_LEV;
		private String PRO_BO_COMMENT_DATE;
		private int PRO_BOARD_NUM;
		private String PRO_BO_COMMENT_ORIGINFILE;
		private int PRO_BO_COMMENT_RE_REF;
		private MultipartFile fileNames;
	


}
