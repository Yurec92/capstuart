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
import com.webapptest.model.entity.Group;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import java.util.Map;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.dao.EmptyResultDataAccessException;

public class GroupDAO
{
	private JdbcTemplate jdbcTemplate;
 
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	public void addGroup(Group group) {
 
		String sql = "INSERT INTO GROUPS(`NAME`) VALUES(?)";
 
		jdbcTemplate.update(sql, new Object[]{group.getName()});
 
	}
	
	public Group findByName(String name)
	{
		String sql = "SELECT * FROM GROUPS WHERE NAME=?";
		try{
		Group group=(Group)jdbcTemplate.queryForObject(sql,new Object[]{name},new BeanPropertyRowMapper(Group.class));
		return group;
		}
		catch (EmptyResultDataAccessException e)
		{
			return null;
		}
	}
	
	
	public Group findById(int id)
	{
		String sql = "SELECT * FROM GROUPS WHERE ID=?";
		return (Group)jdbcTemplate.queryForObject(sql,new Object[]{id},new BeanPropertyRowMapper(Group.class));
	}
 
	public List<Group> findAll(){
 
	String sql = "SELECT * FROM GROUPS";
 
	List<Group> groups = new ArrayList<Group>();
 
	List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
	for (Map row : rows) {
		Group group = new Group();
		group.setId((Integer)(row.get("id")));
		group.setName((String)row.get("name"));
		groups.add(group);
	}
 
	return groups;
	}
	public void delete(String name)
	{
		String sql="DELETE FROM GROUPS WHERE NAME=?";
		jdbcTemplate.update(sql,new Object[]{name});		
	}

}