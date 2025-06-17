package notice;

import java.io.UnsupportedEncodingException;  // 인코딩/디코딩 시 필요한 예외를 처리하기 위한 클래스
import java.net.URLDecoder;  // URL 디코딩을 위한 클래스
import java.net.URLEncoder;  // URL 인코딩을 위한 클래스
import java.sql.Date;  // SQL에서 사용하는 Date 객체 import

public class ArticleVO {  // 게시물 정보를 담는 VO(Value Object) 클래스
	private int level;  // 게시물의 레벨(계층 구조에서의 깊이)
	private int articleNO;  // 게시물 번호
	private int parentNO;  // 부모 게시물 번호 (답글이나 하위 게시물일 경우 부모 게시물 번호 저장)
	private String title;  // 게시물 제목을 저장
	private String content;  // 게시물 내용을 저장
	private String imageFileName;  // 첨부된 이미지 파일명을 저장
	private String id;  // 작성자의 ID를 저장
	private Date writeDate;  // 게시물 작성 날짜 저장
	
	public ArticleVO() {  // 기본 생성자
		
	}

	public ArticleVO(int level, int articleNO, int parentNO, String title, String content, String imageFileName, String id) {  
		// 모든 필드를 초기화하는 생성자
		super();
		this.level = level;  // 게시물의 레벨을 초기화
		this.articleNO = articleNO;  // 게시물 번호를 초기화
		this.parentNO = parentNO;  // 부모 게시물 번호를 초기화
		this.title = title;  // 제목을 초기화
		this.content = content;  // 내용을 초기화
		this.imageFileName = imageFileName;  // 이미지 파일명 초기화
		this.id = id;  // 작성자 ID를 초기화
	}

	public int getLevel() {  // 게시물의 레벨을 반환하는 getter 메서드
		return level;
	}

	public void setLevel(int level) {  // 게시물의 레벨을 설정하는 setter 메서드
		this.level = level;
	}

	public int getArticleNO() {  // 게시물 번호를 반환하는 getter 메서드
		return articleNO;
	}

	public void setArticleNO(int articleNO) {  // 게시물 번호를 설정하는 setter 메서드
		this.articleNO = articleNO;
	}

	public int getParentNO() {  // 부모 게시물 번호를 반환하는 getter 메서드
		return parentNO;
	}

	public void setParentNO(int parentNO) {  // 부모 게시물 번호를 설정하는 setter 메서드
		this.parentNO = parentNO;
	}

	public String getTitle() {  // 제목을 반환하는 getter 메서드
		return title;
	}

	public void setTitle(String title) {  // 제목을 설정하는 setter 메서드
		this.title = title;
	}

	public String getContent() {  // 내용을 반환하는 getter 메서드
		return content;
	}

	public void setContent(String content) {  // 내용을 설정하는 setter 메서드
		this.content = content;
	}
	
	public String getImageFileName() {  // 이미지 파일명을 반환하는 getter 메서드
		try {
			if (imageFileName != null && imageFileName.length() != 0) {  // 파일명이 존재하고 길이가 0이 아닌 경우 디코딩을 시도
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");  // UTF-8로 디코딩
			}
		} catch (UnsupportedEncodingException e) {  // 인코딩이 지원되지 않는 경우 예외를 처리
			e.printStackTrace();
		}
		return imageFileName;  // 디코딩된 파일명을 반환
	}

	public void setImageFileName(String imageFileName) {  // 이미지 파일명을 설정하는 setter 메서드
		try {
			if(imageFileName != null && imageFileName.length() != 0) {  // 파일명이 존재하고 길이가 0이 아닐 경우 인코딩을 시도
				this.imageFileName = URLEncoder.encode(imageFileName, "UTF-8");  // 파일명에 특수문자가 있을 경우 UTF-8로 인코딩
			}else {
				this.imageFileName = imageFileName;  // 파일명이 없을 경우 그대로 저장
			}
		} catch (UnsupportedEncodingException e) {  // 인코딩이 지원되지 않는 경우 예외를 처리
			e.printStackTrace();
		}
	}

	public String getId() {  // 작성자 ID를 반환하는 getter 메서드
		return id;
	}

	public void setId(String id) {  // 작성자 ID를 설정하는 setter 메서드
		this.id = id;
	}

	public Date getWriteDate() {  // 작성 날짜를 반환하는 getter 메서드
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {  // 작성 날짜를 설정하는 setter 메서드
		this.writeDate = writeDate;
	}
}
