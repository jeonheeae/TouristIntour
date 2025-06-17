package notice;

import java.net.URLEncoder;  // URL 인코딩을 위한 클래스
import java.sql.Connection;  // 데이터베이스 연결을 위한 클래스
import java.sql.Date;  // 날짜 데이터를 처리하기 위한 클래스
import java.sql.PreparedStatement;  // SQL 문을 실행하기 위한 클래스
import java.sql.ResultSet;  // SQL 쿼리 결과를 저장하기 위한 클래스
import java.util.ArrayList;  // 배열 리스트를 사용하기 위한 클래스
import java.util.List;  // 리스트를 사용하기 위한 클래스
import java.util.Map;  // 맵을 사용하기 위한 클래스

import javax.naming.Context;  // JNDI에서 네이밍 서비스를 위한 클래스
import javax.naming.InitialContext;  // 네이밍 컨텍스트를 초기화하기 위한 클래스
import javax.sql.DataSource;  // 데이터베이스 연결 풀을 위한 클래스

public class BoardDAO {
	private DataSource dataFactory;  // 데이터 소스 객체를 선언
	Connection conn;  // 데이터베이스 연결 객체 선언
	PreparedStatement pstmt;  // SQL 문 실행 객체 선언

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();  // JNDI 초기 컨텍스트 생성
			Context envContext = (Context) ctx.lookup("java:/comp/env");  // 환경 설정 컨텍스트 검색
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");  // 데이터 소스를 찾음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
	}

	public List selectAllArticles(Map pagingMap) {
		List articlesList = new ArrayList();  // 게시물 목록을 저장할 리스트 생성
		int section = (Integer)pagingMap.get("section");  // section 값을 가져옴
		int pageNum = (Integer)pagingMap.get("pageNum");  // pageNum 값을 가져옴
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "SELECT * FROM ( "
						 + "select ROWNUM  as recNum,"+"LVL,"
						 + "articleNO," + "parentNO," + "title," + "id," + "writeDate"
						 + " from (select LEVEL as LVL, "
						 + "articleNO," + "parentNO," + "title," + "id," + "writeDate"
						 + " from t_board" 
						 + " START WITH  parentNO=0"
						 + " CONNECT BY PRIOR articleNO = parentNO"
						 + "  ORDER SIBLINGS BY articleNO DESC)"
						 + ") "                        
						 + " where recNum between(?-1)*100+(?-1)*10+1 and (?-1)*100+?*10";  // 게시물 목록을 가져오는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setInt(1, section);  // section 값을 설정
			pstmt.setInt(2, pageNum);  // pageNum 값을 설정
			pstmt.setInt(3, section);  // section 값을 설정
			pstmt.setInt(4, pageNum);  // pageNum 값을 설정
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			while(rs.next()) {
				int level = rs.getInt("lvl");  // 계층 레벨 값을 가져옴
				int articleNO = rs.getInt("articleNO");  // 게시물 번호를 가져옴
				int parentNO = rs.getInt("parentNO");  // 부모 게시물 번호를 가져옴
				String title = rs.getString("title");  // 게시물 제목을 가져옴
				String id = rs.getString("id");  // 작성자 ID를 가져옴
				Date writeDate = rs.getDate("writeDate");  // 작성 날짜를 가져옴
				ArticleVO article = new ArticleVO();  // 게시물 VO 객체 생성
				article.setLevel(level);  // 게시물 레벨 설정
				article.setArticleNO(articleNO);  // 게시물 번호 설정
				article.setParentNO(parentNO);  // 부모 게시물 번호 설정
				article.setTitle(title);  // 제목 설정
				article.setId(id);  // 작성자 ID 설정
				article.setWriteDate(writeDate);  // 작성 날짜 설정
				articlesList.add(article);  // 게시물 리스트에 추가
			}
			rs.close();  // ResultSet 닫음
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch(Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return articlesList;  // 게시물 리스트 반환
	} 
	
	public List selectAllArticles() {
		List articlesList = new ArrayList();  // 게시물 목록을 저장할 리스트 생성
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "SELECT LEVEL,articleNO,parentNO,title,content,id,writeDate"
						 + " from t_board"
						 + " START WITH  parentNO=0"
						 + " CONNECT BY PRIOR articleNO=parentNO"
						 + " ORDER SIBLINGS BY articleNO DESC";  // 전체 게시물 목록을 가져오는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			while (rs.next()) {
				int level = rs.getInt("level");  // 계층 레벨 값을 가져옴
				int articleNO = rs.getInt("articleNO");  // 게시물 번호를 가져옴
				int parentNO = rs.getInt("parentNO");  // 부모 게시물 번호를 가져옴
				String title = rs.getString("title");  // 게시물 제목을 가져옴
				String content = rs.getString("content");  // 게시물 내용을 가져옴
				String id = rs.getString("id");  // 작성자 ID를 가져옴
				Date writeDate = rs.getDate("writeDate");  // 작성 날짜를 가져옴
				ArticleVO article = new ArticleVO();  // 게시물 VO 객체 생성
				article.setLevel(level);  // 게시물 레벨 설정
				article.setArticleNO(articleNO);  // 게시물 번호 설정
				article.setParentNO(parentNO);  // 부모 게시물 번호 설정
				article.setTitle(title);  // 제목 설정
				article.setContent(content);  // 내용 설정
				article.setId(id);  // 작성자 ID 설정
				article.setWriteDate(writeDate);  // 작성 날짜 설정
				articlesList.add(article);  // 게시물 리스트에 추가
			}
			rs.close();  // ResultSet 닫음
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return articlesList;  // 게시물 리스트 반환
	}

	private int getNewArticleNO() {
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "SELECT max(articleNO) from t_board";  // 가장 큰 게시물 번호를 가져오는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			if (rs.next()) return (rs.getInt(1) + 1);  // 다음 게시물 번호 반환
			rs.close();  // ResultSet 닫음
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return 0;  // 게시물 번호가 없으면 0 반환
	}

	public int insertNewArticle(ArticleVO article) {
		int articleNO = getNewArticleNO();  // 새로운 게시물 번호 생성
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			int parentNO = article.getParentNO();  // 부모 게시물 번호 가져옴
			String title = article.getTitle();  // 게시물 제목 가져옴
			String content = article.getContent();  // 게시물 내용 가져옴
			String id = article.getId();  // 작성자 ID 가져옴
			String imageFileName = article.getImageFileName();  // 이미지 파일명 가져옴
			String query = "INSERT INTO t_board (articleNO, parentNO, title, content, imageFileName, id)"
						 + " VALUES (?, ? ,?, ?, ?, ?)";  // 새 게시물을 추가하는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setInt(1, articleNO);  // 게시물 번호 설정
			pstmt.setInt(2, parentNO);  // 부모 게시물 번호 설정
			pstmt.setString(3, title);  // 제목 설정
			pstmt.setString(4, content);  // 내용 설정
			pstmt.setString(5, imageFileName);  // 이미지 파일명 설정
			pstmt.setString(6, id);  // 작성자 ID 설정
			pstmt.executeUpdate();  // 쿼리 실행
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return articleNO;  // 추가된 게시물 번호 반환
	}

	public ArticleVO selectArticle(int articleNO) {
		ArticleVO article = new ArticleVO();  // 게시물 VO 객체 생성
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "select articleNO,parentNO,title,content, NVL(imageFileName, 'null') as imageFileName, id, writeDate"
						 + " from t_board"
						 + " where articleNO=?";  // 특정 게시물을 조회하는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setInt(1, articleNO);  // 게시물 번호 설정
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			rs.next();  // 첫 번째 결과로 이동
			int _articleNO = rs.getInt("articleNO");  // 게시물 번호 가져옴
			int parentNO = rs.getInt("parentNO");  // 부모 게시물 번호 가져옴
			String title = rs.getString("title");  // 게시물 제목 가져옴
			String content = rs.getString("content");  // 게시물 내용 가져옴
			String imageFileName = URLEncoder.encode(rs.getString("imageFileName"), "UTF-8");  // 이미지 파일명을 UTF-8로 인코딩
			if(imageFileName.equals("null")) {
				imageFileName = null;  // 이미지 파일명이 'null'일 경우 null로 처리
			}
			String id = rs.getString("id");  // 작성자 ID 가져옴
			Date writeDate = rs.getDate("writeDate");  // 작성 날짜 가져옴

			article.setArticleNO(_articleNO);  // 게시물 번호 설정
			article.setParentNO(parentNO);  // 부모 게시물 번호 설정
			article.setTitle(title);  // 제목 설정
			article.setContent(content);  // 내용 설정
			article.setImageFileName(imageFileName);  // 이미지 파일명 설정
			article.setId(id);  // 작성자 ID 설정
			article.setWriteDate(writeDate);  // 작성 날짜 설정
			rs.close();  // ResultSet 닫음
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return article;  // 게시물 정보 반환
	}

	public void updateArticle(ArticleVO article) {
		int articleNO = article.getArticleNO();  // 수정할 게시물 번호 가져옴
		String title = article.getTitle();  // 수정할 게시물 제목 가져옴
		String content = article.getContent();  // 수정할 게시물 내용 가져옴
		String imageFileName = article.getImageFileName();  // 수정할 이미지 파일명 가져옴
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "update t_board  set title=?,content=?";  // 게시물을 수정하는 SQL 쿼리
			if (imageFileName != null && imageFileName.length() != 0) {
				query += ",imageFileName=?";  // 이미지 파일명이 있을 경우 추가
			}
			query += " where articleNO=?";  // 게시물 번호 조건 추가

			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setString(1, title);  // 제목 설정
			pstmt.setString(2, content);  // 내용 설정
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);  // 이미지 파일명 설정
				pstmt.setInt(4, articleNO);  // 게시물 번호 설정
			} else {
				pstmt.setInt(3, articleNO);  // 게시물 번호 설정
			}
			pstmt.executeUpdate();  // 쿼리 실행
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
	}

	public void deleteArticle(int articleNO) {
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "DELETE FROM t_board "
						 + " WHERE articleNO in ("
						 + "  SELECT articleNO FROM  t_board "
						 + " START WITH articleNO = ?"
						 + " CONNECT BY PRIOR  articleNO = parentNO )";  // 게시물 및 관련 답글 삭제 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setInt(1, articleNO);  // 게시물 번호 설정
			pstmt.executeUpdate();  // 쿼리 실행
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
	}

	public List<Integer> selectRemovedArticles(int articleNO) {
		List<Integer> articleNOList = new ArrayList<Integer>();  // 삭제할 게시물 번호 리스트 생성
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "SELECT articleNO FROM  t_board "
						 + " START WITH articleNO = ?"
						 + " CONNECT BY PRIOR  articleNO = parentNO";  // 삭제할 게시물 및 관련 답글 번호 조회 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			pstmt.setInt(1, articleNO);  // 게시물 번호 설정
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			while (rs.next()) {
				articleNO = rs.getInt("articleNO");  // 게시물 번호 가져옴
				articleNOList.add(articleNO);  // 리스트에 추가
			}
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return articleNOList;  // 삭제할 게시물 번호 리스트 반환
	}

	public int selectTotArticles() {
		try {
			conn = dataFactory.getConnection();  // 데이터베이스 연결을 가져옴
			String query = "select count(articleNO) from t_board";  // 전체 게시물 수를 조회하는 SQL 쿼리
			pstmt = conn.prepareStatement(query);  // SQL 문을 준비
			ResultSet rs = pstmt.executeQuery();  // 쿼리 실행
			if (rs.next()) return (rs.getInt(1));  // 게시물 수 반환
			rs.close();  // ResultSet 닫음
			pstmt.close();  // PreparedStatement 닫음
			conn.close();  // 데이터베이스 연결 닫음
		} catch (Exception e) {
			e.printStackTrace();  // 예외가 발생하면 스택 추적 출력
		}
		return 0;  // 게시물 수가 없으면 0 반환
	}
}
