package dao;

import java.util.List;

import pojo.PublishCompetition;

public interface Publish {
	// 发布信息
	public abstract int add(String s, String s1, String s2, String s3, String s4, String s5, String s6, int i,
			String s7,String filename);

	// 搜索所有发布的信息
	public abstract List<PublishCompetition> selectAllPublish(String s);
	//搜索发布信息表里是否存在pid的比赛
	public PublishCompetition selPublishByPid(String pid);
}