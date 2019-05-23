package com.duoyu.servlet;

public class testt{
	public static void main(String[] args) {
//		int n=5000;
//		for(int i=0;i<100;i++){
//			System.out.println("insert into studentrank(stuno,name, department,member,competition,score) values('"+
//					(n++)+"','李四','医学院',5,'学科竞赛',"+(n++)+");");
//		}
		String str="342-123,789-4532,";
		String[] single = str.split(",");
		for(int i = 0; i<single.length;i++){
			String[] split = single[i].split("-");
			String sno = split[0];
			String pid = split[1];
			System.out.println("---sno---"+sno+"---pid---"+pid);
			char[] c ;
			
		}
		
	}
}
