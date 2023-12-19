package omadiki_ergasia;

import java.sql.*;

public class Volunteer {
    
    private String username;
	private String password;
    private String firstname;
	private String lastname;
	private String email;
	private String phone;
	private int age;
    private String location;

   
    public Volunteer(String username, String password, String firstname, String lastname, String email, String phone, int age, String location) {        
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.location = location;
    }

    public Volunteer(String username, String password, String firstname, String lastname, String email, String phone) {        
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.email = email;
        this.lastname = lastname;
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getPrimaryKey(String username, String password) throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT volID FROM ismgroup43.volunteer WHERE username = ? and password = ?;";
        
        int primary_key = -1;

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
               primary_key = rs.getInt("volID"); 
            }

            stmt.close();
            con.close();
            return primary_key;
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                // TODO: handle exception
            }
        }
    }

}