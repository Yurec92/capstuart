package com.webapptest.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.ArrayList;
import com.webapptest.model.entity.Sliderimage;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import java.util.Map;


public class SliderimageDAO
{
	private JdbcTemplate jdbcTemplate;
	public void setDataSource(DataSource dataSource) 
	{
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Sliderimage> findAll()
	{
 
		String sql = "SELECT * FROM SLIDERIMAGES";
		List<Sliderimage> images = new ArrayList<Sliderimage>();
		List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
		for (Map row : rows) 
		{
			Sliderimage image = new Sliderimage();
			image.setId((Integer)(row.get("id")));
			image.setName((String)row.get("name"));
			image.setPathToFile((String)row.get("pathToFile"));
			images.add(image);
		}
 
		return images;
	}
	
	
	public void addSliderImage(String name,String pathToFile)
	{
		String sql="INSERT INTO SLIDERIMAGES(`NAME`,`PATHTOFILE`) VALUES(?,?)";
		jdbcTemplate.update(sql,new Object[]{name,pathToFile});
	}
	
}