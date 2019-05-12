package com.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.demo.model.User;

public class UserService {
	
	Connection con;
	
	public UserService()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");
		    
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	
	public int insertUser(User user)
	{
		try 
		{
			PreparedStatement ps = con.prepareStatement("insert into myjspprac (name, age, email) values (?, ?, ?)");
			ps.setString(1, user.getName());
			ps.setInt(2, user.getAge());
			ps.setString(3, user.getEmail());
			
			return ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		return 0;
	}
	
	
	
	public int deleteUser(User user)
	{
		
		try 
		{
			PreparedStatement ps = con.prepareStatement("DELETE FROM myjspprac WHERE id=?");
			ps.setInt(1, user.getId());
			
			return ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return 0;
	}

}
