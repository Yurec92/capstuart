package com.webapptest.model.entity;


public class Sliderimage
{
	private int _id;
	private String _name;
	private String _pathToFile;
	
	public Sliderimage(){}
	public Sliderimage(String name,String pathToFile)
	{
		_name=name;
		_pathToFile=pathToFile;
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
	public void setPathToFile(String pathToFile)
	{
		_pathToFile=pathToFile;
	}
	public String getPathToFile()
	{
		return _pathToFile;
	}
	
	
}