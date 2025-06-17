package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
    private DataSource dataFactory;
    private Connection conn;
    private PreparedStatement pstmt;

    // Oracle 데이터베이스 연결
    public MemberDAO() {
        try {
            Context ctx = new InitialContext();
            Context envContext = (Context) ctx.lookup("java:/comp/env");
            dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 회원 목록 조회
    public List<MemberVO> listMembers() {
        List<MemberVO> membersList = new ArrayList<>();
        try {
            conn = dataFactory.getConnection();
            String query = "SELECT * FROM Users ORDER BY email"; // Users 테이블로 변경
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String gender = rs.getString("gender");
                MemberVO memberVO = new MemberVO(email, name, password, phone, gender);
                membersList.add(memberVO);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return membersList;
    }

    // 회원 추가
    public void addMember(MemberVO m) {
        try {
            conn = dataFactory.getConnection();
            String email = m.getEmail();
            String name = m.getName();
            String password = m.getPassword();
            String phone = m.getPhone();
            String gender = m.getGender();


            String query = "INSERT INTO Users(email, name, password, phone, gender) VALUES(?, ?, ?, ?, ?)";
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, name);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, gender);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 회원 정보 조회
    public MemberVO findMember(String email) {
        MemberVO memInfo = null;
        try {
            conn = dataFactory.getConnection();
            String query = "SELECT * FROM Users WHERE email=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            System.out.println(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String gender = rs.getString("gender");

                memInfo = new MemberVO(email, name, password, phone, gender);
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return memInfo;
    }

    // 회원 정보 수정
    public void modMember(MemberVO memberVO) {
        String email = memberVO.getEmail();
        String name = memberVO.getName();
        String password = memberVO.getPassword();
        String phone = memberVO.getPhone();
        String gender = memberVO.getGender();


        try {
            conn = dataFactory.getConnection();
            String query = "UPDATE Users SET name=?, password=?, phone=?, gender=? WHERE email=?";
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, phone);
            pstmt.setString(4, gender);
            pstmt.setString(5, email);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 회원 삭제
    public void delMember(String email) {
        try {
            conn = dataFactory.getConnection();
            String query = "DELETE FROM Users WHERE email=?";
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
