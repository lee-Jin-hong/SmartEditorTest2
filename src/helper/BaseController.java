package helper;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

//-->URL에 노출되는 @WebServlet은 자식 클래스에서 정의하도록 하고, 
//   이 클래스는 추상클래스로 변경한다.
//@WebServlet("/BaseController")
public abstract class BaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//Log4j 객체 생성
	//-->import org.apache.logging.log4j.Logger;
	public Logger logger = null;
	
	//세션 객체 생성하기
	public HttpSession session;
	
    public BaseController() {
    	// 실행되는 주체를 확인하기 위해서 클래스 이름을 콘솔에 출력한다
    	String className = this.getClass().getName();
    	//System.out.println(className);
    	logger = LogManager.getLogger(className);
    }
    
    /** Get 방식 요청이 들어오면 실행된다. */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공통 처리 메서드로 제어를 이동시킨다.
		this.pageInit(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공통 처리 메서드로 제어를 이동시킨다.
		this.pageInit(request, response);
	}
	
	/**
	 * Get, Post 방식에 상관없이 공통 처리되는 메서드
	 * @param request - JSP request 내장 객체
	 * @param response - JSP response 내장 객체
	 */
	private void pageInit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지 형식 지정하기
		response.setContentType("text/html; charset=utf-8");
		//파라미터 처리 형식 지정하기
		request.setCharacterEncoding("utf-8");
		
		/** 현재 URL의 구성정보를 획득하여 View에게 전달한다. */
		//현재 URL
		String now_url = request.getRequestURL().toString();
		request.setAttribute("NOW_URL", now_url);
		//http접속인지 https 접속인지 조회
		String schema = request.getScheme();
		request.setAttribute("SCHEMA", schema);
		//현재 도메인
		String domain = request.getServerName();
		request.setAttribute("DOMAIN", domain);
		//포트번호
		int server_port = request.getServerPort();
		request.setAttribute("SERVER_PORT", server_port);
		//Context 경로
		String home_path = request.getContextPath();
		request.setAttribute("HOME_PATH", home_path);
		
		/** 홈페이지의 절대 경로를 생성한다. */
		//http://localhost
		String home_url = schema + "://" + domain;
		
		//80포트가 아니라면 URL에 포트번호 추가
		if(server_port != 80){
			home_url +=":" + server_port;
		}
		
		if(home_path != "/"){
			home_url += home_path;
		}
		
		//String FILE_DIR			= "C:/workspace/upload/";	// 파일경로
		String FILE_DIR			= "/Tomin/upload";	// 파일경로 (workspace 이름 따라 가네..)
		request.setAttribute("FILE_DIR", FILE_DIR);
		request.setAttribute("HOME_URL", home_url);
		//세션 객체를 생성한다.
		session = request.getSession();
		
		// 현재 URL을 획득해서 로그에 출력한다.
		String url = request.getRequestURI().toString();
		if(request.getQueryString() != null){
			url = url + "?" + request.getQueryString();
		}
		
		//GET 방식인지, POST 방식인지 조회한다.
		String methodName = request.getMethod();
		
		logger.info("[" + methodName + "]" + url);
		
		//WebHelper 객체를 생성한다.
		PrintWriter out = response.getWriter();
		WebHelper web = WebHelper.getInstance(request, response, out);
		
		//View의 이름을 얻기 위하여 webPage 메서드를 호출한다.
		String view = doRun(web, request, response, out);
		
		//획득한 View가 존재한다면 화면 표시
		if(view != null){
			//View를 생성한다.
		  view = "/WEB-INF/" + view + ".jsp";
		  logger.info("[View]" + view); 
		  RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		  dispatcher.forward(request, response);
		}
	
	}
	
	/**
	 * 웹 페이지 구성에 필요한 처리를 수행한 후, View의 이름을 리턴한다.
	 * 이 메서드를 추상화 한다.
	 * 이 클래스를 상속받는 자식 클래스는 반드시 이 메서드를 재정의 해야 한다.
	 */
	public abstract String doRun(WebHelper web, HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException;

}
