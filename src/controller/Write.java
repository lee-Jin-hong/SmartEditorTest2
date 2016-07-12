package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.BaseController;
import helper.WebHelper;

@WebServlet("/write.do")
public class Write extends BaseController{

	private static final long serialVersionUID = -8352126335912777589L;

	@Override
	public String doRun(WebHelper arg0, HttpServletRequest arg1, HttpServletResponse arg2, PrintWriter arg3)
			throws ServletException, IOException {
		
		return "write";
	}

}
