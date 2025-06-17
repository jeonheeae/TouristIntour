package notice;

import java.util.HashMap;  // HashMap 사용을 위한 클래스
import java.util.List;  // List 사용을 위한 클래스
import java.util.Map;  // Map 사용을 위한 클래스

public class BoardService {
	BoardDAO boardDAO;  // BoardDAO 객체 선언

	public BoardService() {
		boardDAO = new BoardDAO();  // BoardDAO 객체 초기화
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();  // 게시물과 관련된 데이터를 저장할 Map 생성
		List<ArticleVO> articlesList = boardDAO.selectAllArticles(pagingMap);  // DAO에서 페이징된 게시물 목록을 가져옴
		int totArticles = boardDAO.selectTotArticles();  // 전체 게시물 수를 가져옴
		articlesMap.put("articlesList", articlesList);  // 게시물 목록을 Map에 추가
		articlesMap.put("totArticles", totArticles);  // 전체 게시물 수를 Map에 추가
		return articlesMap;  // 게시물 관련 정보를 담은 Map 반환
	}

	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();  // DAO에서 모든 게시물 목록을 가져옴
		return articlesList;  // 게시물 목록 반환
	}

	public int addArticle(ArticleVO article) {
		return boardDAO.insertNewArticle(article);  // 새 게시물을 DAO에 추가하고 생성된 게시물 번호를 반환
	}

	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;  // 게시물 VO 객체를 초기화
		article = boardDAO.selectArticle(articleNO);  // DAO에서 게시물 번호로 게시물 정보를 가져옴
		return article;  // 게시물 정보 반환
	}

	public void modArticle(ArticleVO article) {
		boardDAO.updateArticle(article);  // 게시물 수정 정보를 DAO에 전달하여 업데이트 수행
	}

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);  // 삭제할 게시물 번호 리스트를 가져옴
		boardDAO.deleteArticle(articleNO);  // 해당 게시물을 DAO에서 삭제
		return articleNOList;  // 삭제된 게시물 번호 리스트 반환
	}

	public int addReply(ArticleVO article) {
		return boardDAO.insertNewArticle(article);  // 답글을 추가하고 새로 생성된 답글의 게시물 번호를 반환
	}
}
