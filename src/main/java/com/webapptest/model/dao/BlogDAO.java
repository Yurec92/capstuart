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
import com.webapptest.model.entity.Blog;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import java.util.Map;
import java.util.Date;

public class BlogDAO
{
	private JdbcTemplate jdbcTemplate;
	public void setDataSource(DataSource dataSource) 
	{
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Blog> findAll()
	{
 
		String sql = "SELECT * FROM BLOGS";
		List<Blog> blogs = new ArrayList<Blog>();
		List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
		for (Map row : rows) 
		{
			Blog blog = new Blog();
			blog.setId((Integer)(row.get("id")));
			blog.setAuthor((String)row.get("author"));
			blog.setDateOfCreation((Date)row.get("dateOfCreation"));
			blog.setTitle((String)(row.get("title")));
			blog.setText((String)(row.get("text")));
			blogs.add(blog);
		}
 
		return blogs;
	}
}