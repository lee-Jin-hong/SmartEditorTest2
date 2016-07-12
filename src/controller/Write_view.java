package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import helper.BaseController;
import helper.WebHelper;
import model.Test;
import mybatis.MyBatisConnectionFactory;

@WebServlet("/write_view.do")
public class Write_view extends BaseController{

	private static final long serialVersionUID = -3882736759958966255L;

	@Override
	public String doRun(WebHelper web, HttpServletRequest request, HttpServletResponse response, PrintWriter out)
			throws ServletException, IOException {
		
		int widx = web.getInt("widx");
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Test test = null;
		
		try {
			test = sqlSession.selectOne("TestMapper.getWrite", test);
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		
		sqlSession.close();
		
		request.setAttribute("test", test);
		
		return "write_view";
	}

}
