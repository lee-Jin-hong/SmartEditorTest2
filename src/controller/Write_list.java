package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import helper.BaseController;
import helper.RegexHelper;
import helper.WebHelper;
import model.Test;
import mybatis.MyBatisConnectionFactory;

@WebServlet("/write_list.do")
public class Write_list extends BaseController{

	private static final long serialVersionUID = 2921329060957872271L;

	@Override
	public String doRun(WebHelper web, HttpServletRequest request, HttpServletResponse response, PrintWriter out)
			throws ServletException, IOException {
		
		RegexHelper regex = RegexHelper.getInstance();
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Test test = new Test();
		
		
		List<Test>testList = null;
		
		try {
			testList = sqlSession.selectList("TestMapper.getTestList", test);
			
			for(int i=0; i<testList.size(); i++){
				
				testList.get(i).getContent();
				
				String no_tag = regex.removeHtmlTag(testList.get(i).getContent());
				
				testList.get(i).setContent(no_tag);
			}
			
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		
		if(testList == null){
			web.redirect(null, "Test 목록 불러오기 실패");
		}
		
		System.out.println(testList);
		
		
		sqlSession.close();
		
		request.setAttribute("testList", testList);
		
		return "test_list";
	}

}
