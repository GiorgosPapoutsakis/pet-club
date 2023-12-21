package omadiki_ergasia;

import java.sql.*;

public class Welfare {
    
    private String username;
	private String password;
    private String name;
	private String owner;
	private String vat;
    private String email;
    private String lastname;
    private String phone;
	private String location;


    public Welfare(String username, String password, String name, String owner, String vat, String phone, String location) {        
        this.username = username;
        this.password = password;
        this.name = name;
        this.owner = owner;
        this.vat = vat;
        this.phone = phone;
        this.location = location;
    }

    public Welfare(String username, String password, String name, String lastname, String email, String phone) {        
        this.username = username;
        this.password = password;
        this.name = name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getΕmail() {
        return email;
    }

    public void getΕmail(String email) {
        this.email = email;
    }

    public String getLastName() {
        return lastname;
    }

    public void setLastName(String lastname) {
        this.lastname = lastname;
    }

    public int getPrimaryKey(String username, String password) throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT welfID FROM welfare WHERE username = ? AND password = ?;";
        
        int primary_key = -1;

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
               primary_key = rs.getInt("welfID"); 
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
