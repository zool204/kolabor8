package org.devslashnull.kolabor8.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ScrumBoardServlet
 * @author Zool
 */
@WebServlet("/ScrumBoardServlet")
public class ScrumBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ScrumBoardServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.err.println("get!!!");

		Map<Integer, Map<String, Object>> data = getTestData();

		Random rand = new Random();
		int min = 1;
		int max = 3;
		int randomNum = rand.nextInt(max - min + 1) + min;
		Gson gson = new Gson();
		Map<String, Object> resultData = data.get(randomNum);
		String jsonResult = gson.toJson(resultData);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResult);
	}

	private Map<Integer, Map<String, Object>> getTestData() {
		Map<Integer, Map<String, Object>> data = new HashMap<Integer, Map<String, Object>>();
		HashMap<String, Object> a = new HashMap<String, Object>();
		a.put("id", "100");
		a.put("name", "Geoff");
		a.put("title", "God of biscuits");
		data.put(1, a);
		
		HashMap<String, Object> b = new HashMap<String, Object>();
		b.put("id", "200");
		b.put("name", "Ted");
		b.put("title", "Janitor of doom");
		data.put(2, b);

		HashMap<String, Object> c = new HashMap<String, Object>();
		c.put("id", "300");
		c.put("name", "Bill");
		c.put("title", "Keeper of foo");
		data.put(3, c);
		return data;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.err.println("post!!!");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.println("Bar!!!");
		out.flush();
		out.close();
	}

}
