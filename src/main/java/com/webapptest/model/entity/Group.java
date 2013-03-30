package com.webapptest.model.entity;

import java.sql.Timestamp;

public class Group
{
	private int _id;
	private String _name;
	
	public Group() {}
	public Group(int id,String name)
	{
		_id=id;
		_name=name;
	}
	public void setId(int id)
	{
		_id=id;
	}
	public int getId()
	{
		return _id;
	}
	public void setName(String name)
	{
		_name=name;
	}
	public String getName()
	{
		return _name;
	}
}