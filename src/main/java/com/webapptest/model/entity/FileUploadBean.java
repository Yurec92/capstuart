package com.webapptest.model.entity;

import java.util.List;
 
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUploadBean
{
	private CommonsMultipartFile _file;
	private String _name;
	
	public String getName()
	{
		return _name;
	}
	public void setName(String name)
	{
		_name=name;
	}
	
	public CommonsMultipartFile getFile()
	{
		return _file;
	}	
	public void setFile(CommonsMultipartFile file)
	{
		_file=file;
		_name=file.getOriginalFilename();
	}
}