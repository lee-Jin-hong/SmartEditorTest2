package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

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

@WebServlet("/write_ok.do")
public class Write_ok extends BaseController{

	private static final long serialVersionUID = 5674412444910400068L;

	@Override
	public String doRun(WebHelper web, HttpServletRequest request, HttpServletResponse response, PrintWriter out)
			throws ServletException, IOException {
		
		boolean upload_ok = web.multipartRequest();
		
		if(!upload_ok){
			web.redirect(null, "Multipart/Form-data 형식이 아닙니다.");
		}
		
		
		Map<String, String> paramMap = web.getParamMap();
		
		String subject = paramMap.get("subject");
		String content = paramMap.get("ir1");
		String fileurl = paramMap.get("thumbURL");
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Test test = new Test(0, subject, content, fileurl);
		
		int no = 0;
		
		try {
			no = sqlSession.insert("TestMapper.doWrite", test);
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		
		if(no < 1){
			sqlSession.close();
			web.redirect(null, "저장에 실패!");
			return null;
		}
		
		sqlSession.commit();
		sqlSession.close();
		
		String addr = "write_view.do";
		web.redirect(addr, "test가 등록됨");
		
		
		return null;
	}

}
