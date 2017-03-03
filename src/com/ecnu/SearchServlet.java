package com.ecnu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class SearchServlet extends HttpServlet {
	static List<String> datas = new ArrayList<String>();
	static{
		datas.add("ajax");
		datas.add("bill");
		datas.add("james");
		datas.add("jerry");
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("aaa");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");

		List<String> listData = getData(keyword);

		System.out.println(JSONArray.fromObject(listData));
		response.getWriter().write(JSONArray.fromObject(listData).toString());
	}
	public List<String> getData(String keyword){
		List<String> list = new ArrayList<String>();
		for(String data:datas){
			
			if(data.contains(keyword)){
				list.add(data);
			}
		}
	
		return list;
	}
}
