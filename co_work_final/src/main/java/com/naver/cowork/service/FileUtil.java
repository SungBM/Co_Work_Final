package com.naver.cowork.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.Project_Board_Comment;


public class FileUtil {
	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
	
	 public static void fileUpload(MultipartFile uploadFile,Project_Board_Comment pbc,MySaveFolder mysavefolder) throws Exception {
	
		   String fileName = uploadFile.getOriginalFilename();
           pbc.setPRO_BO_COMMENT_ORIGINFILE(fileName);

           String saveFolder = mysavefolder.getSavefolder();
           String fileDBName = FileUtil.fileDBName(fileName, saveFolder);
           logger.info("fileDBName = " + fileDBName);

           uploadFile.transferTo(new File(saveFolder + fileDBName));
           logger.info("transferTo.path = " + saveFolder + fileDBName);
           pbc.setPRO_BO_COMMENT_FILE(fileDBName);
	 }
	
	  public static String fileDBName(String fileName, String saveFolder) {
	        // 새로운 폴더 이름 : 오늘 년+월+일
	        Calendar c = Calendar.getInstance();
	        int year = c.get(Calendar.YEAR); // 오늘 연도
	        int month = c.get(Calendar.MONTH) + 1; // 오늘 월
	        int date = c.get(Calendar.DATE); // 오늘 일

	        String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
	        logger.info(homedir);
	        File path1 = new File(homedir);
	        if (!(path1.exists())) {
	            path1.mkdir(); // 새로운 폴더를 생성
	        }

	        // 난수를 구합니다.
	        Random r = new Random();
	        int random = r.nextInt(100000000);

	        /*** 확장자 구하기 시작 ***/
	        int index = fileName.lastIndexOf(".");
	        // 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
	        // indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반명,
	        // lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
	        // (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
	        logger.info("index = " + index);

	        String fileExtension = fileName.substring(index + 1);
	        logger.info("fileExtention = " + fileExtension);
	        /*** 확장자 구하기 끝 ***/

	        // 새로운 파일명
	        String refileName = "bbs" + year + month + date + random + "." + fileExtension;
	        logger.info("refileName = " + refileName);

	        // 오라클 디비에 저장될 파일명
	        // String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
	        String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
	        logger.info("fileDBName = " + fileDBName);
	        return fileDBName;
	    }
}
