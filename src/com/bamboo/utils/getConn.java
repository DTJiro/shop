package com.bamboo.utils;

import java.sql.*;

public class getConn {
	private Connection conn =null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String Driver ="com.mysql.jdbc.Driver";
	private String uri="jdbc:mysql://localhost:3306/shop";
	private String user="root";
	private String password="759431507";
	public void getConnection(){
		try{
			 Class.forName(Driver);
			 this.conn = DriverManager.getConnection(uri, user, password);
		}catch(Exception e){
			System.out.println("建立连接失败");
			e.printStackTrace();
			
		}
	}
	public ResultSet doQuery(String sql,Object[] arr){
		this.getConnection();
		try{
			this.pstmt = conn.prepareStatement(sql);
			for(int i=0;i<arr.length;i++){
				pstmt.setObject(i+1, arr[i]);
			}
			this.rs = pstmt.executeQuery();
		}catch(Exception e){
			System.out.println("执行错误");
			e.printStackTrace();
		}
		return this.rs;
	}
	public int insert(String sql,Object[] arr){
		int rs1=0;
		this.getConnection();
		try{
			this.pstmt = conn.prepareStatement(sql);
			for(int i=0;i<arr.length;i++){
				pstmt.setObject(i+1, arr[i]);
			}
			rs1 = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("执行错误");
			e.printStackTrace();
		}
		return rs1;
	}
}
